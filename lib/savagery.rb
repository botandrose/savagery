require "savagery/version"
require "savagery/spriter"
require "savagery/engine" if defined?(Rails)

module Savagery
  def self.sprite! path
    Spriter.new(path).sprite!
  end
end

