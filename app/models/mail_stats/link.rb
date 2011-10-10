module MailStats
  class Link < ActiveRecord::Base
    validates_presence_of :url, :on => :create, :message => "URL can't be blank"
  end
end
