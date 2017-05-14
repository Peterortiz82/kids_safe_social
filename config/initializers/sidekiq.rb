# frozen_string_literal: true

Sidekiq.configure_client do |config|
  config.redis = { :size => 25 }
end

Sidekiq.configure_server do |config|
  config.redis = { :size => 25 }
end