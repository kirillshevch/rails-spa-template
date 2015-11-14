remove_file "Gemfile"
def relative_path(path)
  directory = File.dirname(__FILE__)
  File.expand_path(path, "#{directory}/files")
end

def makefile(path)
  read_path = relative_path(path)
  file path, IO.read(read_path)
end

def remove_and_make(filename)
  remove_file filename
  makefile filename
end  

remove_file "Gemfile"
run "touch Gemfile"
add_source 'https://rubygems.org'

gem 'rails',                              '4.2.5'
gem 'pg',                                 '~> 0.18.3'

gem 'jquery-rails',                       '~> 4.0.5'
gem 'sass-rails',                         '~> 5.0.0.beta1'
gem 'uglifier',                           '>= 1.3.0'
gem 'coffee-rails',                       '~> 4.1.0'
gem 'bower-rails',                        '~> 0.10.0'
gem 'carrierwave',                        '~> 0.10.0'
gem 'mini_magick',                        '~> 4.3.3'

gem 'bootstrap-sass',                     '~> 3.3.5.1'

gem 'haml-rails',                         '~> 0.9.0'

gem 'cancancan',                          '~> 1.12.0'
gem 'devise',                             '~> 3.5.2'

gem 'angular_rails_csrf',                 '~> 1.0.4'
gem 'angular-rails-templates',            '~> 0.2.0'
gem 'active_model_serializers',           '~> 0.9.3'

gem 'puma',                               '~> 2.14.0'
gem 'i18n-js',                            '>= 3.0.0.rc11'
gem 'responders',                         '~> 2.1.0'

gem_group :development, :test do
  gem 'pry-byebug',                       '~> 3.2.0'
  gem 'habtm_generator',                  '~> 0.3'
  gem 'faker',                            '~> 1.5.0'
  gem 'factory_girl_rails',               '~> 4.5.0'
  gem 'rspec-rails',                      '~> 3.3.3'
end

gem_group :development do
  gem 'spring',                           '~> 1.4.0'
end

gem_group :test do
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'poltergeist'
end

gem_group :production do
  gem 'rails_12factor'
end

run 'bundle install'

append_file '.gitignore', <<-CODE
/.bundle
/log/*
!/log/.keep
/tmp
/shared/*
/config/database.yml
/config/secrets.yml
/public/assets
/public/uploads
/vendor/assets/bower_components
.ruby-gemset
vendor/bundle/*
CODE

remove_and_make 'app/assets/javascripts/application.js'
makefile 'app/assets/javascripts/app.coffee'
makefile 'app/assets/javascripts/core/core.coffee'
makefile 'app/assets/javascripts/core/mainCtrl.coffee'
makefile 'app/assets/javascripts/core/routes.coffee'
makefile 'app/assets/javascripts/pages/indexPageCtrl.coffee'
makefile 'app/assets/javascripts/pages/pages.coffee'
makefile 'app/assets/javascripts/shared/shared.coffee'
makefile 'app/assets/javascripts/templates/pages/index.html.haml'
makefile 'app/assets/javascripts/templates/index.html.haml'
remove_file 'app/views/layouts/application.html.erb'
makefile 'app/views/layouts/application.html.haml'

remove_and_make 'app/controllers/application_controller.rb'
makefile 'app/controllers/home_controller.rb'

remove_and_make 'config/routes.rb'
remove_file 'config/database.yml'
makefile 'config/database.yml.example'

name_of_db = ask 'Name of database(without prefixes _dev, _test, _production): '
user_of_db = ask 'User for db: '
pass_of_db = ask 'Password of db: '

run 'touch config/database.yml'

append_file 'config/database.yml', <<-CODE
default: &default
  adapter: postgresql
  pool: 5
  encoding: unicode
  timeout: 5000
  user: #{user_of_db}
  password: #{pass_of_db}

development:
  <<: *default
  database: #{name_of_db}_dev

test:
  <<: *default
  database: #{name_of_db}_test

production:
  <<: *default
  database: #{name_of_db}_production
CODE

run 'rake db:create'
run 'rake db:migrate'

remove_file 'README.rdoc'

run 'rails g bower_rails:initialize'
remove_and_make 'Bowerfile'
rake 'bower:install'
