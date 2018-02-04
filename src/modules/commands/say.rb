module Bot
  module DiscordCommands
    # Say command
    module Say
      extend Discordrb::Commands::CommandContainer
      command(:say,
              min_args: 1,
              description: 'Make the bot say something!',
              usage: "#{BOT.prefix}say <some text>") do |event, *words|
        event.channel.start_typing
        message = words.join(' ')
        event << '❌ Tell me something to say!' if message == ' ' || message.nil?
        event.respond message.gsub('@everyone', "@\x00everyone")
      end
    end
  end
end
