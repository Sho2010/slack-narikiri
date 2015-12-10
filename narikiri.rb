require 'sinatra'
require 'sinatra/reloader'
require 'json'

post '/narikiri' do

  headers 'content-type' => 'application/json'

  emoji, message = params[:text].partition(' ').values_at(0,2)
  {
    response_type: "in_channel",
    icon_emoji: emoji,
    text: message, 
  }.to_json
end
