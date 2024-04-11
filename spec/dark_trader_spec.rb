require_relative '../lib/dark_trader'

describe "the dark_trader function" do
  it "returns a non-empty hash" do
    crypto_hash = dark_trader
    expect(crypto_hash).to be_a(Hash)
    expect(crypto_hash).not_to be_empty
  end

  it "contains data for specific cryptocurrencies" do
    crypto_hash = dark_trader
    expect(crypto_hash.keys).to include("BTC")
  end
end

