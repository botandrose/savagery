require "savagery/version"
require "savagery/spriter"

module Savagery
  def self.sprite! path
    Spriter.new(path).sprite!
  end
end

