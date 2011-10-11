# encoding: utf-8

module MailStats
  class MailStatsInterceptor < MailStats::InterceptorPrototype

    private

    def self.process(part, recipients, subject)
      @document = Nokogiri::HTML.parse part.body.to_s
      @mail = MailStats::SentMail.new(:subject => subject,
                                      :recipients => recipients.join(' '),
                                      :recipients_count => recipients.length)

      self.process_pixel
      self.process_links

      @mail.save!
      @document.to_s
    end

    def self.process_pixel
      @pixel = MailStats::Pixel.create
      @mail.pixel = @pixel
      
      short_url = @pixel.id.base62_encode
      pixel = Nokogiri::XML::Node.new('img', @document)

      pixel["src"] = self.format_link_string("p", short_url)
      pixel["style"] = "display: none"

      @document.css('body').children.last.after pixel
    end

    def self.process_links
      @document.css("a").each do |node|
        short_url = self.get_link_short_url node
        node.set_attribute "href", self.format_link_string("r", short_url)
      end
    end

    def self.get_link_short_url(node)
      url = node.attributes["href"].to_s
      self.check_and_return_url(url) if url =~ VALID_URL_REGEX
    end

    def self.format_link_string(type, url)
      "#{MailStats::Base.base_url}#{type}/#{url}"
    end

    #FIXME: Something ugly, need to refactor somehow
    def self.check_and_return_url(url)
      link = MailStats::Link.find_by_url url
      unless link
        begin
          link = MailStats::Link.create(:url => url) 
          @mail.links << link
        rescue Exception
          return url 
        end
      end
      link.id.base62_encode
    end
  end
end