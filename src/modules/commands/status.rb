module Bot
  module DiscordCommands
    # Status command
    module Status
      extend Discordrb::Commands::CommandContainer
      command(:status,
              description: 'Set the bot as idle or dnd or invisible status.',
              min_args: 1,
              max_args: 1) do |event, status|
        unless event.user.id == CONFIG.owner
          event.respond("❌ You don't have permission for that!")
          break
        end
        if status == 'idle'
          event.bot.idle
          event.respond('✅ Status set to **Idle**!')
        elsif status == 'dnd'
          event.bot.dnd
          event.respond('✅ Status set to **Do Not Disturb**!')
        elsif status == 'online'
          event.bot.online
          event.respond('✅ Status set to **Online**!')
        elsif %w[invisible offline].include? status
          event.bot.invisible
          event.respond('✅ Status set to **Invisible**!')
        else
          event.respond('Enter a valid argument!')
        end
      end
    end
  end
end
