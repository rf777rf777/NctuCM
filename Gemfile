source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'

# 加入bootstrap美化UI
gem 'bootstrap-sass'

# Use sqlite3 as the database for Active Record
gem 'sqlite3',group:[:development, :test] #只有在開發及測試環境用到的插件
gem 'pg', group: :production #只有在上線環境用到的插件
gem 'rails_12factor', group: :production #只有在上線環境用到的插件

#加入搜尋功能的gem
gem 'sunspot_rails'  #sunspot的功能是建立想要搜尋的目錄
gem 'sunspot_solr' , group: :development  #solr伺服器是把這個資料儲存 然後提供搜尋服務給App

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
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

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Generate fack content  facker為專門建立隨機資料的功能插件
gem 'faker' , group: [:development,:test]

# Break large result sets into multiple pages 資料分頁的插件
gem 'will_paginate'

# RSpec測試框架 ...裝最新版會發生錯誤...所以指定2.8版
gem 'rspec-rails','2.8' , group: [:development,:test]

# Testing for Humans
gem 'capybara' , group: :test

#Testing JavaScript execution
gem 'selenium-webdriver' , group: :test

# Create fixtures for Testing
gem 'factory_girl_rails' , '~> 4.0' , group: :test

# Launch pages during testing
gem 'launchy'

# Clear fixtures from database between tests
gem 'database_cleaner', '1.0.0.RC1'