def makefile(path)
  dir = File.dirname(__FILE__)
  read_path = File.expand_path(path, "#{dir}/core")
  file path, IO.read(read_path)
end

add_source 'https://rubygems.org'

gem 'rails',                    '4.2.1'

gem 'pg',                       '~> 0.18.3'
gem 'sass-rails',               '~> 5.0.4'
gem 'bower-rails',              '~> 0.10.0'
gem 'jquery-ui-rails',          '~> 5.0.5'
gem 'uglifier',                 '>= 1.3.0'
gem 'coffee-rails',             '~> 4.1.0'
gem 'jquery-rails',             '~> 4.0.5'
gem 'haml-rails',               '~> 0.9.0'
#gem 'cancancan',                '~> 1.12.0'
#gem 'devise',                   '~> 3.5.2'
gem 'angular_rails_csrf',       '~> 1.0.4'
gem 'angular-rails-templates',  '~> 0.2.0'
gem 'active_model_serializers', '~> 0.9.3'
gem 'puma',                     '~> 2.12.3'

gem_group :development, :test do
  gem 'pry-byebug',             '~> 3.2.0'
  gem 'habtm_generator'
  gem 'faker',                  '~> 1.4.3'
  gem 'factory_girl_rails'
  gem 'rspec-rails',            '~> 3.0'
end

run 'bundle install'

append_file '.gitignore' do
  "bower_components/"
  "/config/database.yml"
  "/vendor/assets/"
end

makefile 'Bowerfile'
rake 'bower:install'

