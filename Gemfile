source 'http://rubygems.org'
require 'rubygems'

gem 'rails', '3.1.0'
gem 'sqlite3'
gem 'database_cleaner'
gem 'capybara'
gem 'launchy'
gem 'rspec-rails'
gem 'railroady'
gem 'haml-rails'
gem 'simplecov'
# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'sqlite3'
  #gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'railroady'
  gem 'haml-rails'
  gem 'simplecov'
end
group :test do
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels'
  gem 'railroady'
  gem 'haml-rails'
  gem 'autotest-rails'
  gem 'pdf-reader'
end
group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'therubyracer'              
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'
gem 'prawn'
gem 'googlecharts'



# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
gem 'haml', :require => "open-uri"
