source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }



# messages
gem 'mailboxer', github: 'mailboxer/mailboxer'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
gem 'pg', '>= 0.18', '< 2.0'
gem 'pg_search'
# figaro is used for env variables
gem "figaro"
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# notifications
gem "noticed", "~> 1.4"
# images for seeding
gem 'unsplash'
gem 'faker'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'duktape'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'


gem 'jquery-rails'
gem 'jquery-ui-rails'


# Use Redis adapter to run Action Cable in production
 gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# gem 'bcrypt-ruby', '3.1.0', :require => 'bcrypt'
  # gem 'bcrypt', git: 'https://github.com/codahale/bcrypt-ruby.git', :require => 'bcrypt'
# gem 'ed25519', '~> 1.2'
# gem 'bcrypt_pbkdf', '~> 1'


gem 'devise'
# Use ActiveStorage variant
gem 'mini_magick', '~> 4.8'

gem "azure-storage", require: false
gem 'activestorage-validator'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'capistrano', '3.14.1'
gem 'capistrano-rails', '~> 1.4'
gem 'capistrano-passenger', '~> 0.2.0'
gem 'capistrano-rbenv', '~> 2.1', '>= 2.1.4'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
