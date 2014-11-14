require "savagery/helpers"
require "action_view"

describe Savagery::Helpers do
  subject { ActionView::Base.new.extend(described_class) }

  context "given a sprite" do
    before { subject.stub _svg_sprite_read: "<svg-defs/>\n" }

    describe "#svg_sprite_use" do
      it "outputs the sprite plus svg use element on first try" do
        subject.svg_sprite_use("omg/wtf").should ==
          %(<svg-defs/>\n<svg class="wtf"><use xlink:href="#wtf"></use></svg>)
      end

      it "outputs just the svg use element on second try" do
        subject.svg_sprite_use("omg/wtf")
        subject.svg_sprite_use("omg/wtf").should ==
          %(<svg class="wtf"><use xlink:href="#wtf"></use></svg>)
      end
    end
  end
end

