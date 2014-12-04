module Savagery
  class Spriter
    class Image < Struct.new(:path)
      def self.from_paths paths
        paths.map { |path| Image.new(path) }
      end

      def symbol
        %(<symbol id="#{name}">#{image}</symbol>\n)
      end

      private
      
      def name
        File.basename(path, ".svg")
      end

      def image
        data[/<svg\b[^>]*>(.+)<\/svg>/m, 1].to_s.gsub(/^\s+/, "")
      end

      def data
        File.read(path)
      end
    end
  end
end

