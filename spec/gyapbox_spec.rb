describe Gyapbox do
  context "with no arguments" do
    subject(:gyapbox) { Gyapbox.new }
    let(:args) { [] }
    let(:image_file_pattern) { %r{\A#{gyapbox.images_dir}/.*\.png\z} }

    it "calls `screencapture`" do
      expect(gyapbox).to receive(:system).with('screencapture', '-i', image_file_pattern) # XXX this expectation depends on Kernel#.system called with explicit receiver
      gyapbox.run!(args)
    end
  end
end
