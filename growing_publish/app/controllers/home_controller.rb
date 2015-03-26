#coding:utf-8
class HomeController < ApplicationController
  def index
    
  end
  def index_process
    if params[:password] == "teamtwentyfour"
      redirect_to "http://www.naver.com"
    else
      render :text => "비밀번호가 틀렸습니다"
    end
  end
end
