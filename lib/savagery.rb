require "savagery/version"

module Savagery
  def self.sprite! path
    Spriter.new(path).sprite!
  end

  class Spriter
    def initialize path
    end

    def sprite!
    end
  end
end

