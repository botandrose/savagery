require "set"

module Savagery
  class Helpers
    def svg_sprite_include path
      svg_sprites_included.add path
      svg_sprite_read(path)
    end

    def svg_sprite_use name, options={}
      dirname, basename = name.split("/")
      sprite = svg_sprite_include(dirname) unless svg_sprites_included.include?(dirname)
      use = %(<svg class="#{options[:class] || basename}"><use xlink:href="##{basename}"></use></svg>)
      [sprite, use].join
    end

    private

    def svg_sprites_included
      @svg_sprites_included ||= Set.new
    end

    def svg_sprite_read path
      File.read("app/assets/svgs/#{path}.svg")
    end

    module Rails
      def svg_sprite_include *args
        raw _svg_sprite_helper.svg_sprite_include(*args)
      end

      def svg_sprite_use *args
        raw _svg_sprite_helper.svg_sprite_use(*args)
      end

      private

      def _svg_sprite_helper
        @_svg_sprite_helper ||= Helpers.new
      end
    end
  end
end

