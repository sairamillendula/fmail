source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '4.1.1'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'spring',        group: :development
gem 'bootstrap-sass'
gem 'figaro', '>= 1.0.0.rc1'
gem 'haml-rails'
gem 'sendgrid'
gem 'thin'

#auth
gem 'omniauth'
gem 'omniauth-facebook'
gem 'koala', '~> 1.9.0'

#S3
gem 'paperclip'
gem 'aws-sdk'

group :development do
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'html2haml'
  gem 'hub', :require=>nil
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
end

group :development, :test do
  gem 'rspec-rails'
  gem 'sqlite3'
end

group :test do
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
end

group :production do
  gem 'rails_12factor'
  gem 'newrelic_rpm'
  gem 'pg'
end
