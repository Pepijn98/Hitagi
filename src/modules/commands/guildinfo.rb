module Bot
  module DiscordCommands
    # Guild info command
    module Guildinfo
      extend Discordrb::Commands::CommandContainer
      command(:guild,
              description: 'Some information about the guild.',
              usage: "#{BOT.prefix}guild") do |event|
        server = event.message.channel.server
        id = event.server.id if id.nil?
        owner = event.bot.server(id).owner
        afk_timeout = server.afk_timeout / 60
        afk_channel = server.afk_channel.id
        def_channel = server.default_channel.id
        online_members = server.online_members(include_idle: 'true', include_bots: 'true').map(&:display_name)
        online_members_num = online_members.count
        roles = server.roles.map(&:name)
        roles_num = roles.count
        emotes = server.emoji
        emote_count = emotes.count
        event.channel.send_embed do |embed|
          embed.colour = 0x563055
          embed.description = server.id
          embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: server.icon_url)
          embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: server.name)
          embed.add_field name: 'Guild Owner', value: "#{owner.distinct} (#{owner.id})", inline: true
          embed.add_field name: 'Guild Members', value: "#{online_members_num}/#{server.member_count}", inline: true
          embed.add_field name: 'Default Channel', value: "<##{def_channel}>", inline: true
          embed.add_field name: 'Guild Region', value: server.region, inline: true
          embed.add_field name: 'Verification Level', value: server.verification_level, inline: true
          embed.add_field name: 'AFK Timeout', value: "#{afk_timeout} min", inline: true
          embed.add_field name: 'AFK Channel', value: "<##{afk_channel}>", inline: true
          embed.add_field name: 'Roles', value: roles_num, inline: true
          embed.add_field name: 'Emotes', value: emote_count, inline: true
        end
      end
    end
  end
end
