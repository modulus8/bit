source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use Puma as the app server
gem 'puma', '~> 3.0'

#bootstrap
gem 'bootstrap', '~> 4.0.0.beta2.1'
gem 'font-awesome-sass' #アイコンのために
gem 'jquery-rails'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# paperclip系
gem "paperclip", "~> 4.2"
#gem 'rmagick' #error

#SNSログイン&その他SNS系
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'devise'
gem 'omniauth', '1.8.1'
gem 'twitter'
gem 'oa-oauth'
gem 'koala'


gem 'will_paginate'
gem 'bootstrap-will_paginate'

# sp pc viewの切り分け
gem 'jpmobile', "5.0.0"

# slim
gem 'slim'

# action_cache
gem 'actionpack-action_caching', '~> 1.2'

# # act_as_paranoidの置き換え(論理削除)
# gem 'paranoia'

# # aws-s3の置き換え
# gem 'aws-sdk', '< 2.0'

# delayed_job系
gem "delayed_job"
gem 'delayed_job_active_record'
gem 'daemons'

# # メルマガ系
# gem 'mailchimp-api'
# #gem 'mandrill-api' mandrillは使ってないみたい

# プログラム処理系
gem 'hpricot'
gem 'json', '~> 1.4'

# rails console系のgem
gem 'awesome_print'
gem 'pry-rails'
gem 'rb-readline'

# sessionをredisで
gem 'redis-rails'
# Use Redis adapter to run Action Cable in production
gem 'redis'

# # エラーメール
# gem 'exception_notification'
#
# #gem 'rails-observers', git: 'https://github.com/rails/rails-observers.git'
#
# gem 'sitemap_generator'
#
#
# # group :production do
#   gem 'dalli-elasticache'
# # end


gem 'net-sftp'

gem 'passenger'

gem 'execjs'
gem 'therubyracer'

gem "rest-client"
