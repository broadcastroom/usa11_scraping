require 'open-uri'
require 'nokogiri'
 
url = 'http://int.soccerway.com/teams/united-states/united-states-of-america/2281/squad/'
 
charset = nil
html = open(url) do |f|
	charset = f.charset
	f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)

name_list = doc.xpath('//div[@class="squad-container"]/table[@class="table squad sortable"]/tbody/tr[@class="odd"]/td[@class="photo"]/a/@href')

p name_list.text
