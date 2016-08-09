ROM::Rails::Railtie.configure do |config|
  database_config = ActiveRecord::Base.connection_config
  username = database_config.fetch(:username)
  adapter = database_config.fetch(:adapter)
  database = database_config.fetch(:database)

  config_url = "#{adapter}://#{username}@localhost/#{database}"

  config.gateways[:default] = [:sql, config_url]
end
