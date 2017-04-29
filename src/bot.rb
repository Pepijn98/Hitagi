require 'bundler/setup'
require 'discordrb'
require 'json'
require 'nokogiri'
require 'open-uri'
require 'yaml'

module Bot
  Dir['src/modules/*.rb'].each { |mod| load mod }

  CONFIG = OpenStruct.new YAML.load_file 'data/config.yaml'

  VERSION = CONFIG.version

  BOT = Discordrb::Commands::CommandBot.new(client_id: CONFIG.client_id,
                                            token: CONFIG.token,
                                            prefix: CONFIG.prefix,
                                            fancy_log: true,
                                            ignore_bots: true)

  module DiscordCommands; end
  Dir['src/modules/commands/*.rb'].each { |mod| load mod }
  DiscordCommands.constants.each do |mod|
    BOT.include! DiscordCommands.const_get mod
  end

  module DiscordEvents; end
  Dir['src/modules/events/*.rb'].each { |mod| load mod }
  DiscordEvents.constants.each do |mod|
    BOT.include! DiscordEvents.const_get mod
  end

  BOT.set_user_permission(CONFIG.owner, 999)

  File.readlines('data/whitelist.txt').map(&:chomp).each { |i| BOT.set_user_permission(i, 10) }

  File.readlines('data/blacklist.txt').map(&:chomp).each { |i| BOT.ignore_user(i) }

  BOT.bucket :limit, limit: 10, time_span: 1000, delay: 60

  BOT.run
end
