# encoding: utf-8

module MailStats
  class MailStatsInterceptor < MailStats::InterceptorPrototype
    VALID_URL_REGEX  = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix

    private

    def self.process(part)
      @document = Nokogiri::HTML.parse part.body.to_s

      self.process_pixel
      self.process_links
      

      @document.to_s
    end

    def self.process_links
      @document.css("a").each do |node|
        short_url = self.get_link_short_url node
        node.set_attribute "href", self.format_link_string("r", short_url)
      end
    end

    def self.process_pixel
      short_url = MailStats::Pixel.create.id.base62_encode
      pixel = Nokogiri::XML::Node.new('img', @document)

      pixel["src"] = self.format_link_string("p", short_url)
      pixel["style"] = "display: none"

      @document.css('body').children.last.after pixel
    end

    def self.get_link_short_url(node)
      url = node.attributes["href"].to_s
      self.check_and_return_url url
    end

    def self.format_link_string(type, url)
      "#{MailStats::Base.base_url}#{type}/#{url}"
    end

    def self.check_and_return_url(url)
      link = MailStats::Link.find_by_url url
      if url =~ VALID_URL_REGEX && link
        link.id.base62_encode
      else
        MailStats::Link.create(:url => url).id.base62_encode rescue Exception url
      end
    end
  end
end