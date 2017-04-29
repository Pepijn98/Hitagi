module Bot
  module DiscordCommands
    module Restart
      extend Discordrb::Commands::CommandContainer
      command(:restart,
              help_available: false,
              description: 'Restarts and updates bot.',
              usage: "#{BOT.prefix}restart") do |event|
        break unless event.user.id == CONFIG.owner
        puts 'Restarting...'
        event.respond ['Restarting', 'Buying more games', 'Making more tea', 'Refreshing playlists', 'Checking friend list'].sample + '...'
        BOT.stop
        exit
      end
    end
  end
end
