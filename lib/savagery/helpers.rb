require "set"

module Savagery
  module Helpers
    def svg_sprite_include path
      raw _svg_sprite_helper.svg_sprite_include(path)
    end

    def svg_sprite_use name, options={}
      raw _svg_sprite_helper.svg_sprite_use(name, options)
    end

    private

    def _svg_sprite_helper
      @_svg_sprite_helper ||= Helper.new
    end

    class Helper
      def svg_sprite_include path
        return "" if svg_sprites_included.include?(path)
        svg_sprites_included.add path
        svg_sprite_read(path)
      end

      def svg_sprite_use name, options={}
        dirname = File.dirname(name)
        sprite = svg_sprite_include(dirname)

        basename = File.basename(name)
        options[:class] ||= basename
        use = %(<svg class="#{options[:class]}"><use xlink:href="##{basename}"></use></svg>)

        sprite + use
      end

      private

      def svg_sprites_included
        @svg_sprites_included ||= Set.new
      end

      def svg_sprite_read path
        File.read("app/assets/svgs/#{path}.svg")
      end
    end
  end
end

