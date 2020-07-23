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

    it "correctly renders the QR Code" do
      seconds_to_scan = 1
      Rubank.config.authentication.qrcode.seconds_to_scan = seconds_to_scan

      expect(subject.call).to eql seconds_to_scan
    end
  end
end
