module Savagery
  module Helpers
    def svg_sprite_include path
      sprite_file_path = Savagery.sprite!("app/assets/images/#{path}")
      raw File.read(sprite_file_path)
    end

    def svg_sprite_use name, options={}
      basename = File.basename(name)
      options[:class] ||= basename
      content_tag :svg, options do
        content_tag :use, nil, "xlink:href" => "##{basename}"
      end
    end
  end
end

