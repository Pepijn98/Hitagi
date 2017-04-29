module Bot
  module DiscordCommands
    module Game
      extend Discordrb::Commands::CommandContainer
      command(:game,
              description: 'Set the "Playing" status.',
              usage: "#{BOT.prefix}game <text>") do |event, *game|
                  unless event.user.id == CONFIG.owner
                      event.respond("❌ You don't have permission for that!")
                      break
                    end
                  event.bot.game = game.join(' ')
                  event.respond("✅ Game set to `#{game.join(' ')}`!")
              end
    end
  end
end
