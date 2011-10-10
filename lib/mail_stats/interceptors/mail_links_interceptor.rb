# encoding: utf-8

module MailStats
  class MailLinksInterceptor < MailStats::InterceptorPrototype
    VALID_URL_REGEX  = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix

    private

    def self.process(part)
      document = Nokogiri::HTML.parse part.body.to_s
      document.css("a").each do |node|
        short_url = self.get_short_url node
        node.set_attribute "href", "#{MailStats::Base.base_url}r/#{short_url}"
      end
      document.to_s
    end

    def self.get_short_url(node)
      url = node.attributes["href"].to_s
      link = MailStats::Link.find_by_url(url)
      self.check_url url, link
    end

    def self.check_url(url, link)
      if url =~ VALID_URL_REGEX && link
        link.id.base62_encode
      else
        MailStats::Link.create(:url => url).id.base62_encode rescue Exception url
      end
    end
  end
end
