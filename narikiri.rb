require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'slack'

slack = Slack::Client.new token: ENV['SLACK_TOKEN']

post '/narikiri' do
  headers 'content-type' => 'application/json'

  emoji, message = params[:text].partition(' ').values_at(0,2)
  emoji.delete!(':')
  slack.chat_postMessage(channel: params[:channel_id], text: message, username: emoji, icon_emoji: ":#{emoji}:")

  status 200
end
