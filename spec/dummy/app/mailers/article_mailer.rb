class ArticleMailer < ActionMailer::Base
  default :from => "from@example.com"

  def new_article
    @greeting = "Hi"
    
    mail :to => ["to@example.org", "to2@example.org"]
  end
end
