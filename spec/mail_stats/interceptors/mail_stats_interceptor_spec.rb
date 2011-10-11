require "spec_helper"

describe MailStats::MailStatsInterceptor do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  let(:email) { ArticleMailer.new_article }
  
  describe "message" do
    describe "before interception" do
      it "should leave href= of <a> tag as it is" do
        email.should have_body_text('href="http://github.com/"')
      end
    end

    describe "after interception" do
      let(:email) { ArticleMailer.new_article.deliver }

      it "should change href= of <a> tag properly" do
        email.should have_body_text REDIRECT_LINK_REGEX
      end

      it "should have stats pixel" do
        email.should have_body_text PIXEL_IMAGE_REGEX
      end
    end
  end
end
