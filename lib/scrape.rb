require 'nokogiri'
require 'open-uri'

puts "Enter a search term"
search_term = gets.chomp

doc = Nokogiri::HTML5(URI.open("https://www.scrapethissite.com/pages/forms/?q=#{search_term}"))

teams = {}

doc.css("tr.team").each do |team|
  team_name = team.at(".name").content.strip
  team_wins = team.at(".wins").content.to_i

  teams[team_name] ||= 0
  teams[team_name] += team_wins
end

teams.each do |team_name, team_wins|
  puts "#{team_name} => #{team_wins}"
end









doc = Nokogiri::HTML5(URI.open("https://coinmarketcap.com/all/views/all/"))

crypto_rows = doc.css('.cmc-table-row')

crypto_array = []

crypto_rows.each do |row|
 name = row.css('td')[1].text
 currency = row.css('td')[2].text
 crypto_array << {name: name, currency: currency}
end

crypto_array.each do |element_of_crypto_array|
 puts "Name: #{element_of_crypto_array[:name]}"
 puts "Currency: #{element_of_crypto_array[:currency]}"
 puts "-------------------------"
end