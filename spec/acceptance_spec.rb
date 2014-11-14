require "savagery"
require "fileutils"
require "byebug"

describe Savagery do
  before do
    FileUtils.rm_rf "tmp/svgs"
    FileUtils.rm_rf "tmp/svgs.svg"
    FileUtils.cp_r "spec/support/svgs", "tmp/svgs"
  end

  it ".sprite!" do
    Savagery.sprite!("tmp/svgs")
    actual = File.read("tmp/svgs.svg")
    expected = File.read("spec/support/svgs.svg")
    expect(actual).to eq expected
  end
end

