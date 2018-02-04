module Bot
  module DiscordCommands
    # Asofterworld command
    module SofterWorld
      extend Discordrb::Commands::CommandContainer
      command(:asw,
              description: 'Gets a random comic from <http://www.asofterworld.com>',
              usage: "#{BOT.prefix}asw [n]") do |event, n = rand(1..1248)|
        page = Nokogiri::HTML(open("http://www.asofterworld.com/index.php?id=#{n}"))
        event.channel.send_embed do |embed|
          embed.title = "a Softer World №#{n}"
          embed.image = Discordrb::Webhooks::EmbedImage.new(url: page.css('div#comicimg img')[0]['src'])
          embed.footer = Discordrb::Webhooks::EmbedFooter.new(text: page.css('div#comicimg img')[0]['title'])
          embed.colour = [0x399820, 0x1C5A71, 0xB57126, 0xAD2535].sample
        end
      end
    end
  end
end
