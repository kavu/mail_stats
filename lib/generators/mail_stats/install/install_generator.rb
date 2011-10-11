class MailStats::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path("../templates", __FILE__)
  
  def create_initializer_file
    copy_file "initializer.rb", "config/initializers/mail_stats.rb"
  end

  def copy_migrations
    rake "mail_stats:install:migrations"
  end
end
