module MailStats
  class Link < ActiveRecord::Base
    attr_readonly :visits_count

    belongs_to :sent_mail, :counter_cache => true
    has_many :visits, :as => :visitable
    validates :url, :visits_count, :presence => true
    validates :url, :uniqueness => true
  end
end
