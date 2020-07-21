# frozen_string_literal: true

RSpec.describe Rubank::Requesters::UrlsDiscoverer do
  subject { described_class.new }

  describe ".call" do
    subject { described_class }

    it "sends #call to an instance of #{described_class}" do
      expect_any_instance_of(described_class).to receive(:call)

      subject.call
    end
  end

  describe "#call" do
    let(:random_url) do
      "https://prod-s0-webapp-proxy.nubank.com.br/api/proxy/random_url"
    end
    let(:expected_response) do
      {
        register_prospect_savings_web: random_url,
        register_prospect_savings_mgm: random_url,
        pusher_auth_channel: random_url,
        register_prospect_debit: random_url,
        reset_password: random_url,
        register_prospect: random_url,
        register_prospect_savings_request_money: random_url,
        register_prospect_global_web: random_url,
        register_prospect_c: random_url,
        request_password_reset: random_url,
        auth_gen_certificates: random_url,
        login: random_url,
        email_verify: random_url,
        auth_device_resend_code: random_url,
        msat: random_url
      }
    end

    before do
      stub_request(:get, "https://prod-s0-webapp-proxy.nubank.com.br/api/discovery")
        .to_return(status: 200, body: expected_response.to_json)
    end

    it "works" do
      expect(subject.call).to eql(expected_response)
    end
  end
end
