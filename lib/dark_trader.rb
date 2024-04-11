require 'nokogiri'
require 'open-uri'

def dark_trader

doc = Nokogiri::HTML5(URI.open("https://coinmarketcap.com/all/views/all/"))

crypto_page = doc.xpath('//tr[contains(@class, "cmc-table-row")]')
#select à la racine les tr puis check que les class = "cmc...""

crypto_hash = {}

crypto_page.each do |row|
  name = row.xpath(".//td[contains(@class,'symbol')]").text
  currency = row.xpath('.//td[5]').text
  crypto_hash[name] = currency
end

return crypto_hash
end

puts dark_trader

