require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'slack'
require 'active_support'
require 'active_support/core_ext'

%w(SLACK_TOKEN VERIFICATION_TOKEN).each do |env|
  raise Exception.new("Please set #{env} environment") if ENV[env].blank?
end

slack = Slack::Client.new token: ENV['SLACK_TOKEN']

def token_valid?(params)
  params[:token] == ENV['VERIFICATION_TOKEN']
end
end

post '/narikiri' do
  return status 403 unless token_valid?(params)

  headers 'content-type' => 'application/json'

  emoji, message = params[:text].partition(' ').values_at(0,2)
  emoji.delete!(':')
  slack.chat_postMessage(channel: params[:channel_id], text: message, username: emoji, icon_emoji: ":#{emoji}:")

  status 200
end
