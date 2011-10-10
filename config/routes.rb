MailStats::Engine.routes.draw do
  match "/p(/:code)" => "pixel#process_pixel", :as => 'process_pixel'
  match "/r/(:code)" => "link#process_link", :as => 'process_link'
end
