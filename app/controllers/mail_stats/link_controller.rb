module MailStats
  class LinkController < ApplicationController

    private

    def process_visit(code)
      begin
        @link = MailStats::Link.find code.base62_decode
        @link.increment!(:visits)
        redirect_to @link.url
      rescue ActiveRecord::RecordNotFound, NoMethodError
        render :nothing => true, :status => :not_found
      end
    end
  end
end
