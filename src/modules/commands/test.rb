module Bot
  module DiscordCommands
    module Test
      extend Discordrb::Commands::CommandContainer
      command(:test,
              description: 'Some information about the guild.',
              usage: "#{BOT.prefix}guild") do |event|
                server = event.message.channel.server
                id = event.server.id if id.nil?
                owner = event.bot.server(id).owner
                afkTimeout = server.afk_timeout/60
                afkChannel = server.afk_channel.id
                defChannel = server.default_channel.id

                roles = server.roles.map {|name| name.name}
                rolesJoin = roles * ", "
                event.channel.send_embed do |embed|
                  embed.color = 0x563055
                  embed.description = "#{rolesJoin}"
                  embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: "test")
                end
              end
    end
  end
end
