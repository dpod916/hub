source 'https://rubygems.org'

# ruby '2.3.1', :engine => 'jruby', :engine_version => '9.1.7.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'

gem 'activerecord'
gem 'acts_as_follower', github: 'tcocca/acts_as_follower', branch: 'master'
gem 'acts_as_list'

gem 'active_model_serializers'
# gem 'money'

gem 'best_in_place'
gem 'bootstrap-sass'

gem 'cancancan', '~> 1.10'
gem 'chartkick'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'

# gem 'dropzonejs-rails'

# gem 'journey'


# gem 'omniauth-github'
# gem 'pusher'
# gem 'rails-assets-jquery', source: 'http://rails-assets.org'
# gem 'rails-assets-datatables', source: 'http://rails-assets.org'
# gem 'finishing_moves'
# gem 'dashing-rails'
# gem 'lazy_high_charts'

# gem 'axlsx_rails'
# gem 'kiba'


gem 'mailboxer'
gem 'troupe'

gem 'groupdate'

gem 'elasticsearch-model'
gem 'elasticsearch-rails'
gem 'searchkick'


# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'


# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-infinite-pages'
gem 'execjs'

gem 'redis'
gem 'opinions'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
gem 'pg'

gem 'rails-jquery-tokeninput'
gem 'rails-calendar'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'maxminddb'
gem 'will_paginate'
gem 'whenever', :require => false
gem 'jquery-ui-rails'
# gem 'kristin'
# gem 'pdf-reader'
# gem 'wicked_pdf'
# gem 'wkhtmltopdf-binary'

## User Authentication Gems
gem 'devise', '~> 4.2'
gem 'devise-two-factor'
gem "devise_ldap_authenticatable"

# gem 'mail'
# gem 'linguistics'

# gem 'railroad'

gem 'jqgrid_for_rails'
gem 'jquery-datatables-rails'
gem 'mini_magick'

gem 'public_activity'
gem 'link_thumbnailer'
gem 'activity_notification'
gem 'rolify'

gem 'feedjira'
gem 'nokogiri'
gem 'kaminari'

gem 'font-awesome-rails'
gem 'truncate_html'
#gem 'bootstrap_form'

gem 'verbs'
gem 'paperclip'

gem 'simple_form'
gem 'summernote-rails'
gem 'webpacker'

gem 'geonames'
gem 'sqlite3'

platform :jruby do
	gem 'activerecord-jdbc-adapter'
# 	gem 'activerecord-jdbcderby-adapter'
	gem 'trinidad', :require => nil
	gem 'jdbc-sqlite3'
	gem 'activerecord-jdbcsqlite3-adapter', git: 'https://github.com/jruby/activerecord-jdbc-adapter.git', branch: 'rails-5'
end

group :development, :test do
  # # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug', :require => nil, platform: :mri
  # gem 'sqlite3', :require => nil, platform: :mri
  # gem 'populator'
  # gem 'faker'
  # gem 'betterlorem'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  # gem 'notesgrip', :require => nil
  # gem 'htmlentities'
  # gem 'ruby_dep'
  # gem 'rails_refactor'
  # gem 'listen'
  # gem 'coffee-script-source', '1.8.0'
  # gem "better_errors"
  # gem "binding_of_caller", :require => nil
  gem 'rails_db', :require => nil
  gem "simple-spreadsheet"
  gem 'rename'
  # gem 'net'
  # gem 'nori'
  # gem 'jruby-win32ole', platforms: [:mingw, :mswin, :x64_mingw]
  # gem 'rubypython'
  # gem 'nbayes'
  gem 'closure_tree'
  # gem 'graphviz'
  # gem 'harking-acts_as_graph'
end

group :production do
  
	gem 'activerecord-jdbcpostgresql-adapter', platform: :jruby
	gem 'activerecord-oracle_enhanced-adapter'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
