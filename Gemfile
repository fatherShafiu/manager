source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails' 
  gem 'rails-controller-testing'
  gem 'capybara' 
  gem 'simplecov', :require => false, :group => :test 
  gem "factory_bot_rails"

end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring' 
  gem 'spring-watcher-listen', '~> 2.0.0' 
  gem "letter_opener" 
  gem 'foreman'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'redis', '~> 4.0' 
gem 'local_time' 
gem 'devise' 
gem 'devise_invitable' 
gem 'rolify'
gem 'cancancan' 
gem 'immutable-struct' 
gem 'sidekiq' 
gem 'sinatra', require: nil 
gem 'gravatar_image_tag' 
gem 'money-rails' 
gem 'slack-notifier'
gem 'rack-cors', :require => 'rack/cors'
