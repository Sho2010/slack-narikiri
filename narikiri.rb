require 'sinatra'
require 'sinatra/reloader'
require 'json'

post '/narikiri' do
  emoji, message = params[:text].partition(' ').values_at(0,2)
  {
    emoji: emoji, 
    text: message, 
    channel: 'in_channel'
  }.to_json
end
