source 'https://rubygems.org'

ruby ENV['CUSTOM_RUBY_VERSION'] || '2.3.0'

gem 'rails', '~> 4.1.10'
gem 'unicorn'
gem 'haml-rails'
gem 'jquery-rails'
gem 'settingslogic'
gem 'kaminari'
gem 'rails_admin'
gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'

group :development do
  gem 'sqlite3'
  gem 'foreman'
  gem 'pry-rails'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'newrelic_rpm'
end
