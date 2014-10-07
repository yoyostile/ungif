require 'rack/cache'
require './ungif'

use Rack::Cache,
  :verbose      => true,
  :metastore    => 'file:./meta',
  :entitystore  => 'file:./body'

run Sinatra::Application
