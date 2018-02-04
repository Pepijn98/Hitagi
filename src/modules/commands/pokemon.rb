require 'oakdex/pokedex'

module Bot
  module DiscordCommands
    # Pokemon command, or at least should have been one lol
    module Pokemon
      extend Discordrb::Commands::CommandContainer
      command(:pokemon,
              min_args: 1,
              max_args: 1,
              description: '',
              usage: "#{BOT.prefix}pokemon <name>") do |event, *args|
        # string = "#{args}"
        # ok = string[2..-3]
        # pokemon = Oakdex::Pokedex::Pokemon.find('Eevee')
        event.channel.send_embed do |embed|
          embed.colour = 0x563055
          embed.description = 'Command currently not available.' # "Types: #{pokemon.types}"
        end
      end
    end
  end
end
