module Bot
  module DiscordCommands
    # Owner command
    module Owner
      extend Discordrb::Commands::CommandContainer
      command(:owner,
              description: 'Find the owner of a shared server.',
              usage: "#{BOT.prefix}owner") do |event, id|
        if event.channel.private?
          event.respond("❌ Sorry, you can't find the owner of a DM!")
          break
        end
        id = event.server.id if id.nil?
        owner = event.bot.server(id).owner
        event.channel.send_embed do |embed|
          embed.colour = 0x563055
          embed.description = "👤 Owner of server `#{event.bot.server(id).name}` is **#{owner.distinct}** | ID: (#{owner.id})"
        end
      end
    end
  end
end
