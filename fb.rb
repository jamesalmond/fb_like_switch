require 'sinatra'
require 'json'
require 'fbgraph'
disable :protection
post '/' do
  json = FBGraph::Canvas::parse_signed_request(ENV['FACEBOOK_SECRET'], params[:signed_request])
  if json['page']['liked']
    [200, {'Content-Type' => 'text/html'}, "<html><h1>LIKED</h1></html>"]
  else
    [200, {'Content-Type' => 'text/html'}, "<html><h1>NOT LIKED</h1></html>"]
  end
end
