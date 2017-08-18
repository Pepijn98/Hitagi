require 'uri'
require 'net/http'
require 'net/https'
require 'json'

module Bot
  module DiscordCommands
    module Post
      extend Discordrb::Commands::CommandContainer
      command(:post,
              help_available: false,
              description: 'Post server count.',
              usage: "#{BOT.prefix}post") do |event|
        break unless event.user.id == CONFIG.owner
        puts 'Posting server count...'
        RestClient.post("https://discordbots.org/api/bots/300435268689985538/stats", "{'server_count': #{event.bot.servers.count}}", :'Authorization' => "#{CONFIG.dbotstoken}", :'Content-Type' => :json);
        puts "Done!"
      end
    end
  end
end