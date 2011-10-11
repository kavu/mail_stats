module MailStats
  class Link < ActiveRecord::Base
  	belongs_to :sent_mail
  	has_many :visits, :as => :visitable
    validates_presence_of :url, :on => :create, :message => "URL can't be blank"
  end
end
