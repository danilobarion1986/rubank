# frozen_string_literal: true

RSpec.describe Rubank::Requesters::CredentialsAuthenticator do
  describe ".call" do
    subject { described_class }

    it "sends #call to an instance of #{described_class}" do
      expect_any_instance_of(described_class).to receive(:call)

      subject.call(anything, anything, anything)
    end
  end

  describe "#call" do
    subject { described_class.new }

    let(:random_url) do
      "https://prod-s0-webapp-proxy.nubank.com.br/api/proxy/random_url"
    end
    let(:urls) do
      { login: random_url }
    end
    let(:expected_request_body) do
      { 'grant_type' => 'password',
        'login' => 'username',
        'password' => "password",
        'client_id' => 'other.conta',
        'client_secret' => "yQPeLzoHuJzlMMSAjC-LgNUJdUecx8XO" }.to_json
    end
    let(:expected_response) do
      { access_token: "eyJhbGciOiJSUzI1NiIsI",
        token_type: "bearer",
        _links: {
          revoke_token: { href: random_url },
          revoke_all: { href: random_url },
          account_emergency: { href: random_url },
          bill_emergency: { href: random_url }
        },
        refresh_token: "string token",
        refresh_before: "2020-07-21T22:45:57Z" }
    end

    before do
      stub_request(:post, random_url)
        .to_return(status: 200, body: expected_response.to_json)
    end

    it "has the correct body parameters" do
      subject.call(urls, 'username', 'password')

      expect(subject.request.request.options[:body]).to eql(expected_request_body)
    end

    context "when a correct username/password pair is passed" do
      it "works" do
        response = subject.call(urls, 'correct_username', 'correct_password')

        expect(response).to eql(expected_response)
      end
    end

    context "when a incorrect username/password pair is passed" do
      let(:expected_response) do
        { error: "Unauthorized" }
      end

      before do
        stub_request(:post, random_url)
          .to_return(status: 401, body: expected_response.to_json)
      end

      it "works" do
        response = subject.call(urls, 'correct_username', 'correct_password')

        expect(response).to eql(expected_response)
      end
    end
  end
end
