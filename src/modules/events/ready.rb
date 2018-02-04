module Bot
  module DiscordEvents
    # Ready event
    module Ready
      extend Discordrb::EventContainer
      ready do |event|
        # server_count = BOT.servers.count
        # event.post("https://discordbots.org/api/bots/#{BOT.bot_user.id}/stats", "{'server_count': '#{server_count}'}", :'Authorization' => "#{CONFIG.dbotstoken}", :'Content-Type' => :json);
        event.bot.game = CONFIG.game
        puts BOT.invite_url
        puts "Bot is ready! #{Time.now}"
      end
    end
  end
end
