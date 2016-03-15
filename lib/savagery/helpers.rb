require "set"

module Savagery
  class Helpers < Struct.new(:base_path)
    def svg_sprite_include path
      svg_sprites_included.add path
      svg_sprite_read(path)
    end

    def svg_sprite_use name, options={}
      dirname, basename = name.split("/")
      sprite = svg_sprite_include(dirname) unless svg_sprites_included.include?(dirname)
      use = %(<svg class="#{options[:class] || basename}"><use xlink:href="#{options[:current_url]}##{basename}"></use></svg>)
      [sprite, use].join
    end

    private

    def svg_sprites_included
      @svg_sprites_included ||= Set.new
    end

    def svg_sprite_read path
      File.read(svg_sprite_path(path))
    end

    def svg_sprite_path path
      File.join(base_path, "#{path}.svg")
    end
  end
end

