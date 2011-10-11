module MailStats
  class ApplicationController < ActionController::Base
    def process_pixel
      params[:code] ? process_visit(params[:code]) : redirect_to(rescued_root_url)
    end
    alias :process_link :process_pixel

    private

    def visit(type, code)
      user_id = begin
        current_user.id
      rescue NameError
        nil
      end
      object = "MailStats::#{type.camelize}".constantize.find code.base62_decode
      object.visits << MailStats::Visit.new(:user_id => user_id)
      object.save!

      object
    end

    #TODO: Write spec for root
    def rescued_root_url
      url = begin
        root_url 
      rescue Exception 
        "/"
      end
    end
  end
end
