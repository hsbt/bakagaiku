source :rubygems

gem 'rails', '~> 3.2.0.rc'
gem 'unicorn'

gem 'haml-rails'
gem 'jquery-rails'

gem 'configatron'
gem 'kaminari'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
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
