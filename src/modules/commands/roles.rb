module Bot
  module DiscordCommands
    module Roles
      extend Discordrb::Commands::CommandContainer
      command(:roles,
              description: 'Get the guild roles.',
              usage: "#{BOT.prefix}roles") do |event|
                server = event.message.channel.server
                roles = server.roles.map {|name| name.name}
                rolesJoin = roles * ", "
                event.channel.send_embed do |embed|
                  embed.color = 0x563055
                  embed.description = "#{rolesJoin}"
                  embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: "All guild roles:")
                end
              end
    end
  end
end
