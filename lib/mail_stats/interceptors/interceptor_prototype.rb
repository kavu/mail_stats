# encoding: utf-8

module MailStats
  class InterceptorPrototype
    VALID_URL_REGEX  = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix

    def self.delivering_email(message)
      message.body.parts.each do |part| 
        part.body = self.process(part, message.to, message.subject) if part.content_type =~ /text\/html/ 
      end
    end

    def self.process(part)
      part.body.to_s
    end
  end
end