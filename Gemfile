source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2'
# Use mysql as the database for Active Record
gem 'mysql2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 3.0'
# Use CoffeeScript for .coffee assets and views
# gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 4.3'

gem 'font-awesome-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.


# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap-sass', '~> 3.4.1'
gem 'email_validator'
gem 'kaminari'
gem 'bootstrap-kaminari-views'
gem 'ancestry'
gem 'jquery-minicolors-rails'
gem 'sinatra', :require => nil
# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'simple_form'
gem 'rails-settings-cached'
gem 'typhoeus'
gem 'audiojs-rails'
gem 'rails-timeago', '~> 2.0'
gem 'cancancan', '~> 1.10'

gem 'active_model_serializers'

gem 'has_secure_token'
gem 'rack-attack', '~> 4.3.1'

gem "audited-activerecord", "~> 4.0"
gem 'nuntium_api', git: 'https://github.com/channainfo/nuntium-api-ruby', branch: 'encode_uri'
gem 'sidekiq', '~> 4.0', '>= 4.0.2'

gem 'csv_builder', :git => "https://github.com/lchanmann/csv_builder.git"

gem 'carrierwave'
gem 'date_validator'
gem "validate_url"

gem 'draper'

# cron job in Ruby => required config/schedule.rb
gem 'whenever', :require => false

# backup & restore to Amazon S3
gem 'aws-sdk-s3'
gem 'config',              '~> 1.7.0'

gem 'elasticsearch-model', '~> 6.0.0'
gem 'elasticsearch-rails', '~> 6.0.0'

group :development do
  gem 'bullet'
  gem 'brakeman', require: false
  gem 'bundler-audit', require: false
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'capistrano', '~> 3.4.0'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv', '~> 2.0'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'capistrano-passenger', '~> 0.2.0'

  gem 'factory_girl_rails'
  gem 'pry-rails'

  gem 'rspec-rails', '~> 3.0'
  gem 'rspec-json_expectations', '~> 2.1.0'
  gem 'spring-commands-rspec'
  gem 'annotate'
end

group :test do
  gem 'rake'
  gem "codeclimate-test-reporter", require: nil

  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'ffaker'
  gem 'launchy'
  gem 'simplecov', require: false

  gem 'timecop'
end
