source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails'
gem 'haml-rails'
gem 'jquery-rails'
gem 'settingslogic'
gem 'kaminari'
# gem 'rails_admin'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :development do
  gem 'sqlite3'
  gem 'foreman'
  gem 'pry-rails'
end

group :production do
  gem 'pg'
  gem 'thin'
  gem 'rack-fiber_pool', require: 'rack/fiber_pool'
  gem 'newrelic_rpm'
end
