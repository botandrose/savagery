require "savagery/helpers/rails"
require "action_view"

describe Savagery::Helpers::Rails do
  subject { ActionView::Base.new.extend(described_class) }

  context "given a sprite" do
    let(:helpers) do
      double(svg_sprite_include: "<svg_sprite_include />",
             svg_sprite_use: "<svg_sprite_use />")
    end

    before do
      Savagery::Helpers.should_receive(:new).with("app/assets/svgs").and_return(helpers)
    end

    describe "#svg_sprite_include" do
      it "delegates to helpers" do
        subject.svg_sprite_include.should == "<svg_sprite_include />"
      end

      it "is marked as safe to embed" do
        subject.svg_sprite_include.should be_html_safe
      end
    end

    describe "#svg_sprite_use" do
      it "delegates to helpers" do
        subject.svg_sprite_use.should == "<svg_sprite_use />"
      end

      it "is marked as safe to embed" do
        subject.svg_sprite_use.should be_html_safe
      end
    end
  end
end
