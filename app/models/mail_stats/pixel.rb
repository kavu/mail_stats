module MailStats
  class Pixel < ActiveRecord::Base
  	belongs_to :sent_mail
  	has_many :visits, :as => :visitable
  end
end
