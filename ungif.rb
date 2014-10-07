require 'sinatra'
require 'dragonfly'

Dragonfly.app.configure do
  secret 'OMGLOLWTFROFL'
  plugin :imagemagick
end

get '/ungif' do
  url = params[:url]
  size = params[:size] || '80x80'
  Dragonfly.app.fetch_url(url).thumb("#{size}#", 'format' => 'jpg', 'frame' => 5).to_response(env)
end
