source 'http://rubygems.org'

gem 'haml-rails'
gem 'rails', '3.1.0'
gem 'dalli'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development, :test do
  gem "sqlite3"
end

group :development do
  gem 'rspec-rails'
  gem 'guard'
  gem 'guard-rspec'
  gem 'ruby-debug19'
  gem 'heroku'
end

group :test do
  gem 'database_cleaner'
  gem 'rails3-generators' #mainly for factory_girl & simple_form at this point
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'cucumber-rails'
  gem 'capybara'
  gem 'spork', '0.9.0.rc8'
end

group :production do
  gem 'pg'
end
