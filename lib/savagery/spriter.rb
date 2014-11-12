require "savagery/spriter/image"

module Savagery
  class Spriter
    def initialize path
      self.path = path
    end

    attr_accessor :path

    def sprite!
      File.write sprite_path, sprite
    end

    private

    def sprite_path
      path + ".svg"
    end

    def sprite
      "<svg><defs>\n\n#{symbols.join("\n")}\n</defs></svg>\n"
    end

    def symbols
      Image.from_paths(image_paths).map(&:symbol)
    end

    def image_paths
      Dir.glob(path + "/*.svg").sort
    end
  end
end

