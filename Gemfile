source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

gem "rails", "~> 7.0.4"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "jquery-rails"
gem "bootstrap"
gem "font-awesome-sass", "~> 6.2.1"
gem "sassc-rails"
gem 'slim-rails'
gem "devise"
gem "breadcrumbs_on_rails", "~> 4.1"
gem "chartkick", "~> 5.0"
gem "faker", "~> 3.1"
gem "ransack", "~> 3.2"
gem 'pagy', '~> 6.0'
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "bullet", "~> 7.0"
gem 'open_exchange_rates'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails', '~> 6.0', '>= 6.0.1'
  gem "factory_bot_rails"
end

group :development do
  gem "web-console"
end

group :production do
  gem "pg", "~> 1.1"
end

group :test do
  gem 'shoulda-matchers'
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end





gem "dockerfile-rails", ">= 1.2", :group => :development
