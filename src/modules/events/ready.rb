module Bot
  module DiscordEvents
    module Ready
      extend Discordrb::EventContainer
      ready do |event|
        event.bot.game = CONFIG.game
        puts BOT.invite_url
        puts "Bot is ready! #{Time.now}"
      end
    end
  end
end
