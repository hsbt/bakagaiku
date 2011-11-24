source :rubygems

gem 'rails', '~> 3.1.0'
gem 'rake', '~> 0.8.7'
gem 'unicorn'

gem 'haml-rails'
gem 'jquery-rails'

gem 'configatron'
gem 'kaminari'

group :assets do
  gem 'sass-rails', '~> 3.1.0'
  gem 'coffee-rails', '~> 3.1.0'
  gem 'uglifier'
end

group :development do
  gem 'foreman'
  gem 'heroku_san'
end

group :test do
  gem 'capybara'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'therubyracer'
end

group :production do
  gem 'pg'
  gem 'newrelic_rpm'
end
