module MailStats
  class ApplicationController < ActionController::Base
    def process_pixel
      #TODO: Write spec for root_url
      root = begin 
	    root_url 
	  rescue Exception 
		"/"
	  end
      params[:code] ? process_visit(params[:code]) : redirect_to(root)
    end
    alias :process_link :process_pixel
  end
end
