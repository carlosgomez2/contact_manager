source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.7'
gem 'mysql2', '>= 0.3.18', '< 0.6.0'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'faker', '~> 1.9', '>= 1.9.1'
gem 'bootstrap', '~> 4.1.3'
gem 'glyphicons'
gem 'kaminari'
gem 'carrierwave', '~> 1.0'
gem 'carrierwave-imagesorcery'
gem 'mini_magick'
gem 'jasny-bootstrap-rails'
gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'
gem 'devise'