# encoding: utf-8
module MailStats
  class MailPixelInterceptor < MailStats::InterceptorPrototype

    private

    def self.process(part) 
      short_url = MailStats::Pixel.create.id.base62_encode
      document = Nokogiri::HTML.parse part.body.to_s
      pixel = Nokogiri::XML::Node.new('img', document)
      
      pixel["src"] = "#{MailStats::Base.base_url}p/#{short_url}"
      pixel["style"] = "display: none"
      
      document.css('body').children.last.after pixel 
      
      document.to_s
    end
  end
end
