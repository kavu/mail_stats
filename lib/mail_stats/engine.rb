module MailStats
  class Engine < Rails::Engine
    isolate_namespace MailStats
    config.generators do |generator|
      generator.test_framework :rspec, :view_specs => false
    end
  end
end
