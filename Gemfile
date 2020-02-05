source 'https://rubygems.org'

ruby ENV['CUSTOM_RUBY_VERSION'] || '2.6.5'

gem 'rails', '~> 5.2.4'
gem 'unicorn'
gem 'jquery-rails'
gem 'haml-rails'
gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'
gem 'settingslogic'
gem 'kaminari'

group :development do
  gem 'sqlite3'
  gem 'foreman'
  gem 'pry-rails'
end

group :production do
  gem 'pg'
  gem 'newrelic_rpm'
end
