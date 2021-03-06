require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Test1
  class Application < Rails::Application
  	config.eager_load_paths += %W(#{config.root}/lib)
  	  # config.middleware ActionDispatch::ParamsParser, "CatchJsonParseErrors"

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
