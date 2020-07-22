# frozen_string_literal: true

RSpec.describe Rubank::Requesters::AppUrlsDiscoverer do
  subject { described_class.new }

  describe ".call" do
    subject { described_class }

    it "sends #call to an instance of #{described_class}" do
      expect_any_instance_of(described_class).to receive(:call)

      subject.call
    end
  end

  describe "#call" do
    let(:expected_response) do
      {
        scopes: "https://prod-global-auth.nubank.com.br/api/admin/scope",
        creation: "https://prod-global-auth.nubank.com.br/api/creation",
        change_password: "https://prod-global-auth.nubank.com.br/api/change-password",
        smokejumper: "https://prod-cdn.nubank.com.br/mobile/fire-station/smokejumper.json",
        block: "https://prod-global-auth.nubank.com.br/api/admin/block",
        lift: "https://prod-s0-webapp-proxy.nubank.com.br/api/proxy/random_url",
        shard_mapping_id: "https://prod-global-auth.nubank.com.br/api/mapping/:kind/:id",
        force_reset_password: "https://prod-global-auth.nubank.com.br/api/admin/force-reset-password",
        revoke_token: "https://prod-s0-webapp-proxy.nubank.com.br/api/proxy/random_url",
        userinfo: "https://prod-global-auth.nubank.com.br/api/userinfo",
        reset_password: "https://prod-s0-webapp-proxy.nubank.com.br/api/proxy/random_url",
        unblock: "https://prod-global-auth.nubank.com.br/api/admin/unblock",
        shard_mapping_cnpj: "https://prod-s0-webapp-proxy.nubank.com.br/api/proxy/random_url",
        shard_mapping_cpf: "https://prod-global-auth.nubank.com.br/api/mapping/cpf",
        register_prospect: "https://prod-s0-webapp-proxy.nubank.com.br/api/proxy/random_urlsb2JhbC1jdXN0b21zLm51YmFuay5jb20uYnIvYXBpL3Byb3NwZWN0L3JlZ2lzdGVyL21vYmlsZQ",
        engage: "https://prod-s0-webapp-proxy.nubank.com.br/api/proxy/random_url",
        account_recovery_job: "https://prod-s0-webapp-proxy.nubank.com.br/api/proxy/random_urlLWdsb2JhbC1hdXRoLm51YmFuay5jb20uYnIvYXBpL2FkbWluL2pvYnMvYWNjb3VudC1yZWNvdmVyeS86aWQ",
        account_recovery_confirm: "https://prod-s0-webapp-proxy.nubank.com.br/api/proxy/random_urlcm9kLWdsb2JhbC1hdXRoLm51YmFuay5jb20uYnIvYXBpL2FjY291bnQtcmVjb3ZlcnkvOmlkL2NvbmZpcm0",
        magnitude: "https://prod-s0-magnitude.nubank.com.br/api/events",
        revoke_all: "https://prod-s0-webapp-proxy.nubank.com.br/api/proxy/random_url",
        user_hypermedia: "https://prod-global-auth.nubank.com.br/api/admin/users/:id/hypermedia",
        gen_certificate: "https://prod-s0-webapp-proxy.nubank.com.br/api/proxy/random_url",
        email_verify: "https://prod-s0-webapp-proxy.nubank.com.br/api/proxy/random_url",
        token: "https://prod-global-auth.nubank.com.br/api/token",
        account_recovery: "https://prod-s0-webapp-proxy.nubank.com.br/api/proxy/random_url",
        scopes_remove: "https://prod-global-auth.nubank.com.br/api/admin/scope/:admin-id",
        approved_products: "https://prod-s0-webapp-proxy.nubank.com.br/api/proxy/random_url",
        admin_revoke_all: "https://prod-s0-webapp-proxy.nubank.com.br/api/proxy/random_url",
        faq: {
          ios: "https://ajuda.nubank.com.br/ios",
          android: "https://ajuda.nubank.com.br/android",
          wp: "https://ajuda.nubank.com.br/windows-phone"
        },
        scopes_add: "https://prod-global-auth.nubank.com.br/api/admin/scope/:admin-id",
        registration: "https://prod-s0-webapp-proxy.nubank.com.br/api/proxy/random_url",
        global_services: "https://prod-global-auth.nubank.com.br/api/mapping/global-services",
        start_screen: "https://prod-s0-webapp-proxy.nubank.com.br/api/proxy/random_url",
        user_change_password: "https://prod-global-auth.nubank.com.br/api/user/:user-id/password",
        account_recovery_token: "https://prod-s0-webapp-proxy.nubank.com.br/api/proxy/random_url",
        user_status: "https://prod-global-auth.nubank.com.br/api/admin/user-status",
        engage_and_create_credentials: "https://prod-s0-webapp-proxy.nubank.com.br/api/proxy/random_url"
      }
    end

    before do
      stub_request(:get, "https://prod-s0-webapp-proxy.nubank.com.br/api/app/discovery")
        .to_return(status: 200, body: expected_response.to_json)
    end

    it "works" do
      expect(subject.call).to eql(expected_response)
    end
  end
end
