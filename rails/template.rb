run 'rm Gemfile'
run 'touch Gemfile'
add_source 'https://rubygems.org'

gem 'rails', '~> 4.2.0'
gem 'pg'

gem 'sprockets', '>= 3.0.0'
gem 'sprockets-es6'
gem 'uglifier'
gem 'jquery-rails'

gem 'sass-rails', '~> 5.0'
gem 'autoprefixer-rails'
gem 'bourbon', '5.0.0.beta.5'

gem_group :development do
  gem "quiet_assets"
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
end

gem_group :development, :test do
  gem "awesome_print"
  gem "bullet"
  gem "bundler-audit", ">= 0.5.0", require: false
  gem "factory_girl_rails"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.4.0"
end

gem_group :test do
  gem "capybara-webkit"
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers"
end
