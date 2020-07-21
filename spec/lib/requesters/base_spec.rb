# frozen_string_literal: true

RSpec.describe Rubank::Requesters::Base do
  subject { described_class.new }

  describe ".call" do
    let(:base_headers) do
      { "Content-Type" => "application/json",
        "X-Correlation-Id" => "WEB-APP.pewW9",
        "User-Agent" => "Rubank - https://github.com/danilobarion1986/rubank",
        "Origin" => "https://conta.nubank.com.br",
        "Referer" => "https://conta.nubank.com.br/" }
    end

    it "works" do
      subject.call

      expect(subject.response_body).to_not be_empty
    end

    it "has the correct headers" do
      subject.call

      expect(subject.request.request.options[:headers]).to include(base_headers)
    end
  end
end
