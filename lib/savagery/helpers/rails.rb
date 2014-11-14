require "set"
require "savagery/helpers"

module Savagery
  module Helpers::Rails
    def svg_sprite_include *args
      raw _svg_sprite_helper.svg_sprite_include(*args)
    end

    def svg_sprite_use *args
      raw _svg_sprite_helper.svg_sprite_use(*args)
    end

    private

    def _svg_sprite_helper
      @_svg_sprite_helper ||= Helpers.new("app/assets")
    end
  end
end

