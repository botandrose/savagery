module Savagery
  class Middleware < Struct.new(:app)
    def call *args
      sprite!
      app.call *args
    end

    private

    def sprite!
      paths = Dir.glob("app/assets/svgs/*/").map(&:chop)
      paths.each do |path|
        Spriter.new(path).sprite!
      end
    end
  end
end

