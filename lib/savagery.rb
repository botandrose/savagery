require "savagery/version"
require "savagery/spriter"

if defined?(Rails)
  require "savagery/engine"
end

module Savagery
  def self.sprite! path
    Spriter.new(path).sprite!
  end
end

