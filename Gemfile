source 'https://rubygems.org'


######### defaults
gem 'rails', '4.1.0'
gem 'pg', '~> 0.18.0.pre20141117110243'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'

# uncomment the two gems below if they are causing errors
# gem "eventmachine", '~> 1.0.7'
# gem 'tzinfo-data'


group :assets do
  gem 'sprockets'
end
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0'
# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
# gem 'spring'


####### commonly used
gem 'ancestry'
gem 'geocoder'
gem "thin"
gem 'faker'
gem 'protected_attributes', '~> 1.0.5'
gem 'browser'
gem 'dotenv-rails' #remember to load
gem 'pry'
gem 'best_in_place', github: 'bernat/best_in_place'
gem 'upmin-admin'


##### Omniauth
gem 'omniauth-facebook'
gem 'clearance'


# Uploading
gem "paperclip", "~> 4.2"
gem 'aws-sdk'

# exception notifiers
gem 'exception_notification'


# Video Chatting
gem "opentok", "~> 2.2"


# Use unicorn as the app server
gem 'unicorn'
# comment out unicorn during development if you are using windows


# Deploy with Capistrano
gem "net-ssh", "~> 2.7.0"
gem 'capistrano', '~> 2.15'
gem "rvm-capistrano", require: false
gem 'rails-web-console', require: 'rails_web_console/engine'


#testing

group :development, :test do
	gem 'rspec-rails'
	gem 'factory_girl_rails'
end

group :test do
	gem 'capybara'
	gem 'database_cleaner'
	gem 'selenium-webdriver'
	gem 'shoulda-matchers'
	gem 'mocha'
end
