require "savagery"

describe Savagery do
  let(:spriter) { double(:spriter) }
  let(:path) { double(:path) }

  it ".sprite! delegates to Savagery::Spriter" do
    Savagery::Spriter.should_receive(:new).with(path).and_return(spriter)
    spriter.should_receive(:sprite!)

    subject.sprite!(path)
  end
end

