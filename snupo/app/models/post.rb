
#coding:UTF-8
class Post < ActiveRecord::Base
  # attr_accessible :title, :body
  require'net/http'
  require'uri'
  require'cgi'
  require'open-uri'
  require'nokogiri'

  def self.regi
    def login_gcm_regi
      token = params[:token]
      gcm_token = params[:gcm_token]
      user = User.where(:token => token).last
      user.gcm_token = gcm_token
      if !User.where(:gcm_token => gcm_token).empty?
        previous_user = User.where(:gcm_token => gcm_token).last
        previous_user.gcm_token = nil
        previous_user.save
        #이부분은 기존에 다른 gcm_token을 가지고 있는 유저가 있는 경우, 그 유저의 gcm_token을 지운다.
      end
      user.save
      error_code = 0 #원래 1이  정상인 표신데 클라딴에서 바꾸기 귀찮아서 그냥 0으로함
      data = {:error_code => error_code}
      render :json => data.to_json
    end
 

  end


  def self.alram
    #coding:utf-8
    require 'rubygems'
    require 'pushmeup'
    GCM.host = 'https://android.googleapis.com/gcm/send'
    GCM.format = :json
    GCM.key = "AIzaSyB8Fnp924UbU4BOAhKZ3BGzchsxbsryxhQ"

    puts "input message :"
    a = gets.chomp


    user = User.where(:email => "0").last
    puts user.name
    #user.each do |u|
      destination = [user.gcm_token]
      data = {:title => "Growing", :message =>a, :msgcnt => "1", :soundname => "beep.wav"}
      puts destination
      puts data
      GCM.send_notification( destination, data)
      GCM.send_notification( destination, data)
      GCM.send_notification( destination, data)
      GCM.send_notification( destination, data)
      GCM.send_notification( destination, data)
    #end


  end
  def self.check

    hongs_cookie = "otac066t219dtuk2j0tpfkmsp5"
    http = Net::HTTP.new('www.snupo.org',80)
    http.start() { |http|
      params = {:type => "new_post"}
      request = Net::HTTP::Get.new('/cello')
      cookie1 = CGI::Cookie.new('PHPSESSID',hongs_cookie)
      request['Cookie'] = cookie1.to_s
      request.set_form_data({"type" => "new_post"})

      response = http.request(request)
      puts "------------------------------------``"
      puts "---------------------------------------------------------------"
      puts "---------------------------------------------------------------"
      puts "---------------------------------------------------------------"
      puts "---------------------------------------------------------------"
      puts "---------------------------------------------------------------"
      puts "---------------------------------------------------------------"
      doc = Nokogiri::HTML(response.body)
      doc.css("tr td").each do |x|
        title =  x.css("a.post-link").text

        writer =  x.css("a.author").text


        if Post.where(:title => title ).empty?
          p = Post.new
          p.title = title
          p.writer = writer
          p.save
          
          Post.alram


        end
      end
    }




  end
  
end
