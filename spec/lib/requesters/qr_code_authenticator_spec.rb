# frozen_string_literal: true

RSpec.describe Rubank::Requesters::QrCodeAuthenticator do
  describe ".call" do
    subject { described_class }

    it "sends #call to an instance of #{described_class}" do
      expect_any_instance_of(described_class).to receive(:call)

      subject.call(anything, anything)
    end
  end

  describe "#call" do
    subject { described_class.new }

    let(:random_url) do
      "https://prod-s0-webapp-proxy.nubank.com.br/api/proxy/random_url"
    end
    let(:mock_uuid) do
      "d5ae238b-f2c2-4d52-b11f-01cea3368972"
    end
    let(:expected_request_body) do
      { 'qr_code_id' => mock_uuid,
        'type' => 'login-webapp' }.to_json
    end
    let(:expected_response) do
      { ok: 'ok' }
    end

    before do
      stub_request(:post, random_url)
        .to_return(status: 200, body: expected_response.to_json)
    end

    it "has the correct response format" do
      response = subject.call(random_url, 'random_access_token')

      expect(response).to eql(expected_response)
    end

    before do
      eval <<~CLASS
        class MockQrCode
          def uuid
            "#{mock_uuid}"
          end

          def html
            "<p>mock</p>"
          end
        end
      CLASS
    end

    it "has the correct body parameters on the request" do
      Rubank.config.authentication.qrcode.qrcode_class = MockQrCode
      subject.call(random_url, 'random_access_token')

      expect(subject.request.request.options[:body]).to eql(expected_request_body)
    end
  end
end
