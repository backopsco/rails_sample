require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsSample
  class Application < Rails::Application
    # Configure generators values
    config.generators do |g|
      g.test_framework      :rspec, fixture: true
      g.fixture_replacement :factory_girl , dir: "spec/factories"
    end

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:access_token,
                                  :refresh_token
                                ]

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
