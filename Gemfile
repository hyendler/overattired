source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'

# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'

# Use SCSS for stylesheets
# gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
# gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# protect user data with devise
gem 'devise'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# protect sensitive data with dotenv
gem 'dotenv-rails', '~> 2.1'

# make the console pretty and readable with awesome print and pry
gem 'awesome_print'
gem 'pry'

# schedule cron jobs with whenever
gem 'whenever', :require => false

# gems needed for background emails
gem 'redis', '~>3.2'
gem 'sinatra', '>= 1.3.0', :require => nil
gem 'autoscaler'

# gems needed for using sidekiq with emails
gem "letter_opener", :group => :development
gem "launchy"
gem 'sidekiq'
gem 'sidetiq'
# seed data with faker
gem 'faker'

# Use Unicorn as the app server
# gem 'unicorn'

gem 'rails_serve_static_assets'
gem 'rails_stdout_logging'
#Heroku Deployment Debugging to Fix Image Asset Pipeline issues

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Rspec for rails!
  gem 'rspec-rails', '~> 3.0'
  # Sandbox install for Capybara:
  gem 'capybara'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Use Capistrano for deployment
  # gem 'capistrano-rails', group: :development
end
