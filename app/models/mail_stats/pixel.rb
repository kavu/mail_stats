module MailStats
  class Pixel < ActiveRecord::Base
  	attr_readonly :visits_count

  	belongs_to :sent_mail
  	has_many :visits, :as => :visitable
  	validates :visits_count, :presence => true
  end
end
