require "savagery"
require "fileutils"

describe Savagery do
  before do
    FileUtils.rm_rf ["tmp/svgs", "tmp/svgs.svg"]
    FileUtils.cp_r "spec/support/svgs", "tmp/svgs"
  end

  it ".sprite!" do
    Savagery.sprite!("tmp/svgs")
    File.read("tmp/svgs.svg").should == File.read("spec/support/svgs.svg")
  end
end

