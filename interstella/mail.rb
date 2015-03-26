require 'mail'
mail = Mail.new do 
  from    "hongs.lee90@gmail.com"
  to      "jang2poom@gmail.com"
  subject "Get Insterstell NOW!!"
  body    "title / population"
  date "Mon, 24 Aug 2009 00:15:46 +1000"
end

mail.deliver
puts mail.to_s

