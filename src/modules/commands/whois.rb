module Bot
  module DiscordCommands
    module Whois
      extend Discordrb::Commands::CommandContainer
      command(:whois,
              description: 'Displays info about a user.') do |event, *_mention|
            event.channel.start_typing
            if event.channel.private? # ignore PMs
                event << '❌ This command can only be used in a server.'
                next
            end

            if event.message.mentions[0]
                user = event.message.mentions[0]
                playing = if user.game.nil?
                              '[N/A]'
                          else
                              user.game
                          end
                member = user.on(event.server)
                nick = if member.nickname.nil?
                           '[N/A]' #
                       else
                           member.nickname
                       end
                event.channel.send_embed do |embed|
                  embed.color = 0x563055
                  embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: "#{user.avatar_url}")
                  embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: "Infomation about #{member.display_name}", icon_url: "#{user.avatar_url}")
                  embed.add_field name: "ID:", value: "#{user.id}", inline:true
                  embed.add_field name: "Username:", value: "#{user.distinct}", inline:true
                  embed.add_field name: "Nickname:", value: "#{nick}", inline:true
                  embed.add_field name: "Status:", value: "#{user.status}", inline:true
                  embed.add_field name: "Playing:", value: "#{playing}", inline:true
                  embed.add_field name: "Account created:", value: "#{user.creation_time.getutc.asctime} UTC", inline:false
                  embed.add_field name: "Joined server at:", value: "#{member.joined_at.getutc.asctime} UTC", inline:false
                end
            else
              user = event.message.author
              playing = if user.game.nil?
                            '[N/A]'
                        else
                            user.game
                        end
              member = user.on(event.server)
              nick = if member.nickname.nil?
                         '[N/A]' #
                     else
                         member.nickname
                     end
              event.channel.send_embed do |embed|
                embed.color = 0x563055
                embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: "#{user.avatar_url}")
                embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: "Infomation about #{member.display_name}", icon_url: "#{user.avatar_url}")
                embed.add_field name: "ID:", value: "#{user.id}", inline:true
                embed.add_field name: "Username:", value: "#{user.distinct}", inline:true
                embed.add_field name: "Nickname:", value: "#{nick}", inline:true
                embed.add_field name: "Status:", value: "#{user.status}", inline:true
                embed.add_field name: "Playing:", value: "#{playing}", inline:true
                embed.add_field name: "Account created:", value: "#{user.creation_time.getutc.asctime} UTC", inline:false
                embed.add_field name: "Joined server at:", value: "#{member.joined_at.getutc.asctime} UTC", inline:false
              end
            end
        end
    end
  end
end
