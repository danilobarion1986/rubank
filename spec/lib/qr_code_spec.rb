# frozen_string_literal: true

RSpec.describe Rubank::QrCode do
  subject { described_class.new }

  it "responds to #uuid" do
    expect(subject).to respond_to(:uuid)
  end

  it "responds to #qrcode" do
    expect(subject).to respond_to(:qrcode)
  end

  it "responds to #html" do
    expect(subject).to respond_to(:html)
  end

  describe "#uuid" do
    it "returns a valid UUID" do
      expect(UUID.validate(subject.uuid)).to be true
    end
  end

  describe "#qrcode" do
    it "returns an instance of RQRCode::QRCode" do
      expect(subject.qrcode).to be_an_instance_of(RQRCode::QRCode)
    end
  end

  describe "#html" do
    it "returns a QR Code rendered as HTML" do
      expect(subject.html).to match(/<table>.*<\/table>/)
    end
  end
end
