module MailStats
  class Base
    class<<self; attr_accessor :base_url end

     self.base_url = "http://localhost:3000/"
  end
end