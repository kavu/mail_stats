require "spec_helper"

describe MailStats::MailPixelInterceptor do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  let(:email) { ArticleMailer.new_article }

  describe "message after interception" do
    it "should have stats pixel" do
      email.deliver.should have_body_text PIXEL_IMAGE_REGEX
    end
  end
end
