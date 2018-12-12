source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'
gem 'rails', '~> 5.2.2'

# Core
gem 'bootsnap', '>= 1.1.0', require: false
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails', '~> 4.3'
gem 'puma', '~> 3.11'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

# Layout
gem 'bootstrap-sass', '~> 3.3'
gem 'haml', '~> 5.0'
gem 'haml-rails', '~> 1.0'
gem 'sass-rails', '~> 5.0'

# Stuff
gem 'active_model_serializers'
gem 'geocoder', '~> 1.5'

# Databases
gem 'pg', group: :production
gem 'sqlite3', group: %i[development test]

# Development and test
group :development do
  # Capistrano
  gem 'capistrano', '~> 3.11'
  gem 'capistrano-passenger', '~> 0.2.0'
  gem 'capistrano-rails', '~> 1.3', '>= 1.3.1'
  gem 'capistrano-rails-collection', '~> 0.1.0'
  gem 'capistrano-rbenv', '~> 2.1', '>= 2.1.3'
  # General
  gem 'listen', '~> 3.1', '>= 3.1.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0', '>= 2.0.1'
  gem 'web-console', '~> 3.5', '>= 3.5.1'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'chromedriver-helper'
  gem 'database_cleaner'
  gem 'factory_bot_rails', '~> 4.11'
  gem 'faker', '~> 1.9'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  gem 'shoulda-callback-matchers', '~> 1.1'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'simplecov', '~> 0.16.1'
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 3.8'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
