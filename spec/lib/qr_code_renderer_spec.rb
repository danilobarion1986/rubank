# frozen_string_literal: true

RSpec.describe Rubank::QrCodeRenderer do
  describe ".call" do
    subject { described_class }

    it "sends #call to an instance of #{described_class}" do
      expect_any_instance_of(described_class).to receive(:call)

      subject.call(anything)
    end
  end

  describe "#call" do
    subject { described_class.new }

    let(:html) do
      "<p>some html code</p>"
    end

    it "correctly renders the QR Code" do
      expect(subject.call(html, seconds_to_scan: 0.1)).to be_nil
    end
  end
end
