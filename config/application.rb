require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module AsanaCloneBE
  class Application < Rails::Application

   config.load_defaults 5.1

   config.middleware.insert_before 0, Rack::Cors do
            allow do
           origins '*'
           resource '*', :headers => :any, :methods => [:get, :post, :delete, :patch, :options]
         end
       end
    config.api_only = true

  end
end
