source "https://rubygems.org"

ruby "3.2.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.3", ">= 7.1.3.3"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"
gem "faraday"
gem "googleauth"
gem "google-id-token"
gem "mime-types-data"
gem "rack_session_access"
gem "webrick"
gem "sassc"

group :development, :test do
  gem "capybara"
  gem "factory_bot_rails"
  gem "faker"
  gem "launchy"
  gem "orderly"
  gem "pry"
  gem "rspec-rails"
  gem "rubocop" # optional - for use with RuboCop VSCode plugin
  gem "rubocop-discourse" # optional
  gem "shoulda-matchers"
  gem "simplecov"
  gem "solargraph" # optional - for use with Solargraph VSCode plugin
  gem "standard" # optional - for use with Ruby Standard VSCode plugin
end

group :development do
  gem "hotwire-livereload"
  gem "sass-rails"
  gem "web-console"
end
