remove_file "Gemfile"
def source_paths
  Array(super) + 
    [File.expand_path(File.dirname(__FILE__))]
end

remove_file "Gemfile"
run "touch Gemfile"
add_source 'https://rubygems.org'

gem 'rails',                              '4.2.4'
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

