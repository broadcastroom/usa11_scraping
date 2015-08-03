require 'open-uri'
require 'nokogiri'
require 'robotex'

url = 'http://int.soccerway.com/teams/united-states/united-states-of-america/squad/'

robotex = Robotex.new "Chrome/28.0.1500.52"
if !robotex.allowed?(url) 
  exit
end

open(url) do |f|
  doc = Nokogiri::HTML.parse f.read

  name_list = doc.xpath('//div[@class="squad-container"]/table[@class="table squad sortable"]/tbody/tr/td[@class="photo"]/a/@href').text.split("/players/").map{|f| f.gsub(/\/.+\//,'')}
  
  name_list.shift

  name_list.each do |player|
    p player
  end
end
