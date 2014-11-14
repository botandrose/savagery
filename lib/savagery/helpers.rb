require "set"

module Savagery
  module Helpers
    def svg_sprite_include path
      return raw("") if _svg_sprites_included.include?(path)
      _svg_sprites_included.add path
      raw _svg_sprite_read(path)
    end

    def svg_sprite_use name, options={}
      dirname = File.dirname(name)
      sprite = svg_sprite_include(dirname)

      basename = File.basename(name)
      options[:class] ||= basename
      sprite + content_tag(:svg, options) do
        content_tag :use, nil, "xlink:href" => "##{basename}"
      end
    end

    private

    def _svg_sprites_included
      @_svg_sprites_included ||= Set.new
    end

    def _svg_sprite_read path
      File.read("app/assets/svgs/#{path}.svg")
    end
  end
end

