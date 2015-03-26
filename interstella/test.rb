require 'open-uri'
require 'rubygems'
require 'nokogiri'
require 'gmail'


page = Nokogiri::HTML(open("http://www.cgv.co.kr/common/showtimes/iframeTheater.aspx?areacode=01&theatercode=0013&date=20141129"))

hall = page.search 'div.info-hall ul li:contains("IMAX2D")'
imax_data  = hall.last.parent.parent.parent
elements = imax_data.search 'ul li a[target="_top"]'
elements.each do |e|
  title =  e.search 'em'
  raw_population =  e.search 'span.txt-lightblue'
  raw_population = raw_population.text
  population = raw_population[4..-2]

  puts title.text
  puts population

  latest_data = Snapshot.where(:title => title.text).last
  if latest_data.population >= population.to_i
    latest_data.population = population
    latest_data.save
  elsif latest_data.population.to_i + 2 <= population.to_i 
    ss = Snapshot.new
    ss.title = title.text
    ss.population = population
    ss.save
  end 


  puts "----------------------------"
end


mail = Mail.new do 
  from    "hongs.lee90@gmail.com"
  to      "jang2poom@gmail.com"
  subject "Get Insterstell NOW!!"
  body    "title / population"
end

mail.delever!
