require 'nokogiri'
require 'open-uri'


def mairie_christmas
  sleep(5) 
  doc = Nokogiri::HTML5(URI.open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=50"))

  mairie_page = doc.xpath('//div[contains(@class, "main-block large-gutter")]')

  names = mairie_page.xpath(".//h2[contains(@class,'titre_normal')]").map(&:text)
  emails = mairie_page.xpath(".//a[contains(@class,'ann_mail')]").map(&:text)

  mairie_hash = {}

  names.each_with_index do |name, index|
    email = emails[index].strip
    mairie_hash[name.strip] = email.strip if email.include?("@assemblee-nationale")
  end

  mairie_hash.each do |name, email|
    puts "#{name} => #{email}"
  end
end

mairie_christmas

# names = mairie_page.xpath(".//h2[contains(@class,'titre_normal')]").map(&:text) : 
# Cette expression sélectionne tous les éléments h2 qui ont la classe titre_normal et extrait le texte de chaque élément 
# à l'aide de .map(&:text). Cela signifie que seuls les textes à l'intérieur de ces éléments sont extraits et 
# stockés dans la variable names.

# # names = mairie_page.xpath(".//h2[contains(@class,'titre_normal')]") : 
# Cette expression sélectionne tous les éléments h2 qui ont la classe titre_normal, mais elle ne récupère pas le texte 
# à l'intérieur de ces éléments. Au lieu de cela, elle stocke directement les éléments h2 correspondants dans la variable names.

# # En résumé, la première expression extrait le texte des éléments sélectionnés, 
# tandis que la seconde expression stocke directement les éléments sélectionnés