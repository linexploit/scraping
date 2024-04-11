require_relative '../lib/mairie_christmas'


describe 'mairie_christmas' do
  it 'returns a hash with city names as keys and emails as values' do
    mairie_hash = mairie_christmas
    expect(mairie_hash).to be_a(Hash)
    expect(mairie_hash).not_to be_empty
  end

  it "contains data for specific municipalities" do
    mairie_hash = mairie_christmas

    expect(mairie_hash.keys).to include("Mairie Aigues-Vives")
    expect(mairie_hash["Mairie Aigues-Vives"]).to eq("mairie-aiguesvives@wanadoo.fr")

    expect(mairie_hash.keys).to include("Mairie Airoux")
    expect(mairie_hash["Mairie Airoux"]).to eq("mairieairoux@wanadoo.fr")
  end
end