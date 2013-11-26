source 'https://rubygems.org'

gem 'rails', '~> 4.0.0'
gem 'turbolinks'
gem 'jquery-rails'
gem 'coffee-rails'
gem 'uglifier'
gem 'sass-rails'
gem 'haml-rails'
gem 'friendly_id'
gem 'devise'
gem 'bootstrap-sass'

group :test do
  gem 'coveralls', group: :development, require: false
  gem 'rspec-rails', group: :development
  gem 'cucumber-rails', require: false, github: 'cucumber/cucumber-rails'
  gem 'database_cleaner'
  gem 'email_spec'
end

group :development do
  gem 'sqlite3', group: :test
end

group :production do
  gem 'mysql2'
end
