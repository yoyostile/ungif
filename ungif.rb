require 'sinatra'
require 'dragonfly'

Dragonfly.app.configure do
  secret 'OMGLOLWTFROFL'
  plugin :imagemagick
end

get '/' do
  haml :index
end

get '/ungif' do
  url = params[:url]
  size = params[:size] || '80x80'
  if url
    Dragonfly.app.fetch_url(url).thumb("#{size}#", 'format' => 'jpg', 'frame' => 0).to_response(env)
  else
    redirect to('/')
  end
end
