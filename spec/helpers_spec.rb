require "fileutils"
require "savagery/helpers"

describe Savagery::Helpers do
  context "given a sprite" do
    before do
      FileUtils.rm_rf "tmp/svgs.svg"
      File.write "tmp/svgs.svg", "<svg-defs/>\n"
    end

    subject { described_class.new("tmp") }

    describe "#svg_sprite_use" do
      it "outputs the sprite plus svg use element on first try" do
        subject.svg_sprite_use("svgs/wtf").should ==
          %(<svg-defs/>\n<svg class="wtf"><use xlink:href="#wtf"></use></svg>)
      end

      it "outputs just the svg use element on second try" do
        subject.svg_sprite_use("svgs/wtf")
        subject.svg_sprite_use("svgs/wtf").should ==
          %(<svg class="wtf"><use xlink:href="#wtf"></use></svg>)
      end
    end
  end
end

