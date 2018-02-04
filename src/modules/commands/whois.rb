module Bot
  module DiscordCommands
    # Whois command
    module Whois
      extend Discordrb::Commands::CommandContainer
      command(:whois,
              description: 'Displays info about a user.') do |event, *_mention|
        event.channel.start_typing
        if event.channel.private? # ignore PMs
          event << '❌ This command can only be used in a server.'
          next
        end

        user = if event.message.mentions[0]
                 event.message.mentions[0]
               else
                 event.message.author
               end
        playing = user.game.nil? ? '[N/A]' : user.game
        member = user.on(event.server)
        nick = member.nickname.nil? ? '[N/A]' : member.nickname
        event.channel.send_embed do |embed|
          embed.colour = 0x563055
          embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: user.avatar_url)
          embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: "Infomation about #{member.display_name}", icon_url: user.avatar_url)
          embed.add_field name: 'ID', value: user.id, inline: true
          embed.add_field name: 'Username', value: user.distinct, inline: true
          embed.add_field name: 'Nickname', value: nick, inline: true
          embed.add_field name: 'Status', value: user.status, inline: true
          embed.add_field name: 'Playing', value: playing, inline: true
          embed.add_field name: 'Account created', value: "#{user.creation_time.getutc.asctime} UTC", inline: false
          embed.add_field name: 'Joined server at', value: "#{member.joined_at.getutc.asctime} UTC", inline: false
        end
      end
    end
  end
end
