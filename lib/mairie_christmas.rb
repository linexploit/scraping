require 'nokogiri'
require 'open-uri'
require 'pry'

# unless emails.empty?


require 'nokogiri'
require 'open-uri'

def mairie_christmas
 doc = Nokogiri::HTML5(URI.open("https://www.aude.fr/annuaire-mairies-du-departement"))

 city_names = doc.xpath(".//h2[contains(@class,'directory-block__title composite-link__title')]").map(&:text)
 emails = doc.xpath('.//a[contains(@href, "mailto:")]/@href').map { |link| link.value.gsub('mailto:', '') }

 mairie_hash = {}

 city_names.each_with_index do |name, index|
    email = emails[index] ? emails[index] : "Email non trouvé"
    mairie_hash[name] = email
 end

 return mairie_hash
end

puts mairie_christmas
