# encoding: utf-8

module MailStats
	class InterceptorPrototype
	  def self.delivering_email(message)
	    message.body.parts.each do |part| 
	      part.body = self.process(part) if part.content_type =~ /text\/html/ 
	    end
	  end

	  def self.process(part)
	  	part.body.to_s
	  end
	end
end