require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Dependents
  class Application < Rails::Application
    I18n.enforce_available_locales = true
    config.time_zone = 'Brasilia'
    config.i18n.default_locale = :'pt-BR'
    config.encoding = 'utf-8'
    config.i18n.load_path += Dir[Rails.root.join('config/locales/**/*.yml').to_s]
    config.active_record.raise_in_transactional_callbacks = true
    config.active_job.queue_adapter = :delayed_job
  end
end
