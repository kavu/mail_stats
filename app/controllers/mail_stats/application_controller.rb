module MailStats
  class ApplicationController < ActionController::Base
    def process_pixel
      params[:code] ? process_visit(params[:code]) : redirect_to(self.root_url)
    end
    alias :process_link :process_pixel

    private

    #TODO: Write spec for root_url
    def self.root_url
      begin 
        root_url 
      rescue Exception 
        "/"
      end
    end
  end
end
