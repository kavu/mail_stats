module MailStats
  class Visit < ActiveRecord::Base
  	belongs_to :user
  	belongs_to :visitable, :polymorphic => true, :counter_cache => true
  end
end
