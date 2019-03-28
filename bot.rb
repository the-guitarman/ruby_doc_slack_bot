require 'slack-ruby-client'
require_relative 'lib/message'

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
end

client = Slack::RealTime::Client.new

client.on :hello do
  puts "Successfully connected, welcome '#{client.self["name"]}' to the '#{client.team["name"]}' team at https://#{client.team["domain"]}.slack.com."
end

client.on :message do |data|
  client.message channel: data['channel'], text: Message.instance.answer(data['user'], data['text'])
end

client.on :close do |_data|
  puts "Client is about to disconnect"
end

client.on :closed do |_data|
  puts "Client has disconnected successfully!"
end

begin
  client.start!
rescue Faraday::ConnectionFailed => e
  puts "Error: #{e.message}"
  puts "Please check your connection to the internet."
rescue Exception => e
  puts "Error: #{e.message}" unless e.message.empty?
end
