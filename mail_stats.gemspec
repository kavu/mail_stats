$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mail_stats/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mail_stats"
  s.version     = MailStats::VERSION
  s.authors     = ["Max Riveiro"]
  s.email       = ["kavu13@gmail.com"]
  s.license     = "MIT"
  s.homepage    = "http://github.com/kavu/mail_stats"
  s.summary     = "Proof of Concept Rails Engine gem for mail statistics"
  s.description = "This is just PoC Rails Engine gem for collecting mail statistics with a help of the redirect link and the hidden pixel in the body of the mail message."

  s.files = Dir["{app,config,db,lib,spec}/**/*"] + [".rvmrc", ".rspec", "MIT-LICENSE", "Rakefile", "README.rdoc", "Gemfile", "Gemfile.lock"]

  s.add_dependency "rails", "~> 3.1.1"
  s.add_dependency "nokogiri", "~> 1.5.0"
  s.add_dependency "base62", "~> 0.1.4"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 2.6.1"
  s.add_development_dependency "email_spec", "~> 1.2.1"
  s.add_development_dependency "shoulda-matchers", "~> 1.0.0.beta3"
  s.add_development_dependency "database_cleaner", "~> 0.6.7"
  s.add_development_dependency "rcov", "~> 0.9.1"
end
