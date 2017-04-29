module Bot
  module DiscordCommands
    module Guildinfo
      extend Discordrb::Commands::CommandContainer
      command(:guild,
              description: 'Some information about the guild.',
              usage: "#{BOT.prefix}guild") do |event|
                server = event.message.channel.server
                id = event.server.id if id.nil?
                owner = event.bot.server(id).owner
                afkTimeout = server.afk_timeout/60
                afkChannel = server.afk_channel.id
                defChannel = server.default_channel.id
                onlineMembers = server.online_members(include_idle: 'true', include_bots: 'true').map {|name| name.display_name}
                onlineMembersNum = onlineMembers.count
                roles = server.roles.map {|name| name.name}
                rolesNum = roles.count
                event.channel.send_embed do |embed|
                  embed.color = 0x563055
                  embed.description = "#{server.id}"
                  embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: "#{server.icon_url}")
                  embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: "#{server.name}")
                  embed.add_field name: "Guild Owner:", value: "#{owner.distinct} (#{owner.id})", inline:true
                  embed.add_field name: "Guild Members:", value: "#{onlineMembersNum}/#{server.member_count}", inline:true
                  embed.add_field name: "Default Channel:", value: "<##{defChannel}>", inline:true
                  embed.add_field name: "Guild Region:", value: "#{server.region}", inline:true
                  embed.add_field name: "Verification Level:", value: "#{server.verification_level}", inline:true
                  embed.add_field name: "AFK Timeout:", value: "#{afkTimeout} min", inline:true
                  embed.add_field name: "AFK Channel:", value: "<##{afkChannel}>", inline:true
                  embed.add_field name: "Roles:", value: "#{rolesNum}", inline:true
                end
              end
    end
  end
end
