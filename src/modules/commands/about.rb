# frozen_string_literal: true

module Bot
  module DiscordCommands
    # About command
    module About
      extend Discordrb::Commands::CommandContainer
      command(:about,
              description: 'Some information about the bot.',
              usage: "#{BOT.prefix}about") do |event|
        servers = event.bot.servers
        server_count = servers.count
        event.channel.send_embed do |embed|
          embed.colour = 0x563055
          embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: 'https://cdn.discordapp.com/avatars/300435268689985538/cdb620300854d7207999d10a0c4742a9.jpg?size=2048')
          embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: 'Hitagi', url: 'https://kurozero.xyz/')
          embed.add_field name: 'Creator', value: '<@93973697643155456>', inline: true
          embed.add_field name: 'Library', value: 'discordrb', inline: true
          embed.add_field name: 'Language', value: 'Ruby', inline: true
          embed.add_field name: 'Bot Version', value: "v#{VERSION}", inline: true
          embed.add_field name: 'Servers', value: server_count, inline: true
          embed.add_field name: 'Prefix', value: BOT.prefix, inline: true
          embed.add_field name: 'About', value: 'Fast and simple to use discord bot, created in ruby using discordrb.', inline: false
          embed.add_field name: 'Website', value: 'https://kurozero.xyz/hitagi', inline: true
          embed.add_field name: 'Support Server', value: 'https://discord.gg/Vf4ne5b', inline: true
        end
      end
    end
  end
end
