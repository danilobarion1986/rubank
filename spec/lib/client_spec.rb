RSpec.describe Rubank::Client do
  subject { described_class.new }

  describe "#authenticate" do
    context "when no credential are passing" do
      it "raises Rubank::Client::AuthenticationError" do
        expect { subject.authenticate }.to raise_error(Rubank::Client::AuthenticationError)
      end
    end
  end
end
