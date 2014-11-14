require "savagery/spriter"
require "fileutils"

describe Savagery::Spriter do
  before do
    FileUtils.rm_rf ["tmp/svgs", "tmp/svgs.svg"]
    FileUtils.cp_r "spec/support/svgs", "tmp/svgs"
  end

  subject { described_class.new("tmp/svgs") }

  it "#sprite!" do
    subject.sprite!
    File.read("tmp/svgs.svg").should == File.read("spec/support/svgs.svg")
  end
end

