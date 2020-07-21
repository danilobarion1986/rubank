# frozen_string_literal: true

RSpec.describe Rubank::Client do
  subject { described_class.new }

  before do
    allow(Rubank::Requesters::UrlsDiscoverer).to receive(:call).and_return({ login: 'url'})
  end

  describe "#authenticate" do
    context "when no credentials are passed" do
      it "raises Rubank::Client::AuthenticationError" do
        expect { subject.authenticate }.to raise_error(Rubank::Client::AuthenticationError)
      end
    end

    context "when the credentials are passed" do
      context "when they are incorrect" do
        it "raises Rubank::Client::AuthenticationError" do
          allow(Rubank::Requesters::CredentialsAuthenticator).to(
            receive(:call).and_return({ error: 'Unauthorized' })
          )

          expect { subject.authenticate(username: anything, password: anything) }.to(
            raise_error(Rubank::Client::AuthenticationError)
          )
        end
      end

      context "when they are correct" do
        it "do not raises error" do
          allow(Rubank::Requesters::CredentialsAuthenticator).to(
            receive(:call).and_return({ ok: 'Ok' })
          )

          expect { subject.authenticate(username: anything, password: anything) }.to_not raise_error
        end
      end
    end
  end
end
