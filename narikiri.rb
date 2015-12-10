require 'sinatra'
require 'sinatra/reloader'
require 'json'

post '/narikiri' do
  emoji, message = params[:text].partition(' ').values_at(0,2)
  {
    response_type: "in_channel",
    emoji: emoji, 
    text: message, 
  }.to_json
end
