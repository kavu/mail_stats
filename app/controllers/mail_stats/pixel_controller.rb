module MailStats
  class PixelController < ApplicationController

    private

    def process_visit(code)
      begin
        MailStats::Pixel.find(code.base62_decode).increment!(:visits)
        render :nothing => true, :status => :no_content
      rescue ActiveRecord::RecordNotFound, NoMethodError
        render :nothing => true, :status => :not_found
      end
    end
  end
end
