#coding:UTF-8
require'net/http'
require'uri'
require'cgi'
http = Net::HTTP.new('vmth.snu.ac.kr',8080)

request = Net::HTTP::Post.new('/vetsnu/j_spring_security_check')
request.set_form_data({"j_username" => "admin", "j_password" => "rytnsla"})
response = http.request(request)

puts response.inspect

#puts "Headers: #{response.to_hash.inspect}"
a =  response['set-cookie']
a = a.split(';')
a = a[0].split("=")

puts "new_cookie = "
puts a[1]
new_cookie = a[1]
puts "------------------------------------``"


http = Net::HTTP.new('vmth.snu.ac.kr',8080)
http.start() { |http|
  request = Net::HTTP::Get.new('/vetsnu/timetable/timeTableExcel')
  cookie1 = CGI::Cookie.new('JSESSIONID',new_cookie)
  request['Cookie'] = cookie1.to_s

  response = http.request(request)

  File.open('table.csv','w') do |f|
    f.write response.body
  end


  puts response.inspect
  puts response.to_hash.inspect
  puts response.body
  puts "------------------------------------``"
}

=begin
http = Net::HTTP.new('vmth.snu.ac.kr', 8080)
#http.use_ssl = true
resp = nil
cookie = String.new
http.start do |http|
  request = Net::HTTP::Post.new('/vetsnu/j_spring_security_check')
  request['j_username'] = 'admin'
  request['j_password'] = 'rytnsla'
  resp = http.request(request)
  puts "this is cookie"
  cookie = resp['JSESSIONID']
  puts "thie is resp"
  puts resp
  puts "thie is resp.inspect"
  puts resp.inspect
end
puts cookie
=end
=begin
    http = Net::HTTP.new('www.samplesite.com', 443)
    http.use_ssl = true
    
    http.start do |http|
      request = Net::HTTP::Post.new('/login.php')
      
      ######
      #Here is where I need an example 
      ######
      request['Cookie'] = ?????
      ######
    
      request['user-agent'] = 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9) Gecko/2008051206 Firefox/3.0'
      resp = http.request(request)
     
      resp.value
     
    end
=end
