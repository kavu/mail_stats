module MailStats
  class SentMail < ActiveRecord::Base
    has_one :pixel
    has_many :links
    validates :subject, :recipients, :recipients_count, :links_count, :presence => true
  end
end
