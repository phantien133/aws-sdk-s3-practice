source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.3.1"

gem "rails", "~> 5.2.1"
gem "pg", ">= 0.18", "< 2.0"

gem "bootsnap", ">= 1.1.0", require: false

gem "aws-sdk-s3"

gem "activerecord-import", "~> 0.20.2"

gem 'whenever'

group :development, :test do
  gem "pry"
  gem "pry-rails"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
