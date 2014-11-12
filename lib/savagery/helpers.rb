require "set"

module Savagery
  module Helpers
    def svg_sprite_include path
      return raw("") if svg_sprites_included.include?(path)
      svg_sprites_included.add path

      sprite_path = "app/assets/svgs/#{path}"
      sprite_file = Savagery.sprite!(sprite_path)
      raw File.read(sprite_file)
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

    def svg_sprites_included
      @svg_sprites_included ||= Set.new
    end
  end
end

