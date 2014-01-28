require 'sinatra'
require 'sinatra/reloader' if development?
require 'docker'
require 'haml'
require 'hashie/mash'
require 'active_support/core_ext'
require 'action_view/helpers'
require 'rack/contrib'
require 'i18n'
require 'i18n/backend/fallbacks'
require './image_decorator'
require './container_decorator'

include ActionView::Helpers::DateHelper

# MIDDLEWARE
use Rack::Locale

# CONFIGURATION
configure do
  I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)
  I18n.load_path = Dir[File.join(settings.root, 'locales', '*.yml')]
  I18n.backend.load_translations
end

also_reload 'image_decorator.rb'
also_reload 'container_decorator.rb'

Time::DATE_FORMATS[:mdy] = '%a %b %d %Y'

Docker.url = 'unix:///var/host_run/docker.sock'

# ROUTES
get '/' do
  haml :home
end

get '/images' do
  @images = Docker::Image.all.map do |i|
    ImageDecorator.new(i)
  end
  haml :images
end

get '/images/:id' do
  image = Docker::Image.get(params[:id])
  puts image.info
  @image = ImageDecorator.new(image)
  haml :image
end

get '/containers' do
  @containers = Docker::Container.all(all: true).map do |c|
    ContainerDecorator.new(c)
  end
  haml :containers
end

get '/settings' do
  @info = Docker.info
  @version = Docker.version
  haml :settings
end

