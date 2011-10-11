module MailStats
  class SentMail < ActiveRecord::Base
  	has_one :pixel
  	has_many :links
  end
end
