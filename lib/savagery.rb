require "savagery/version"

module Savagery
  def self.sprite! path
    Spriter.new(path).sprite!
  end

  class Spriter < Struct.new(:path)
    def sprite!
      File.write sprite_path, sprite
    end

    private

    def sprite
      header + images + footer
    end

    def sprite_path
      path + ".svg"
    end

    def header
      "<svg><defs>\n\n"
    end

    def images
      Image.from_paths(image_paths).map(&:symbol).join("\n")
    end

    def footer
      "\n</defs></svg>\n"
    end

    def image_paths
      Dir.glob(path + "/*.svg").sort
    end

    class Image < Struct.new(:path)
      def self.from_paths paths
        paths.map { |path| Image.new(path) }
      end

      def symbol
        header + image + footer
      end

      private
      
      def header
        %(<symbol id="#{name}">)
      end

      def image
        data[/<svg\b[^>]*>(.+)<\/svg>/m, 1].gsub(/[\r\n]+/, "\n")
      end

      def footer
        "</symbol>\n"
      end

      def data
        File.read(path)
      end

      def name
        File.basename(path, ".svg")
      end
    end
  end
end

