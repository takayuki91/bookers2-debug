class SearchesController < ApplicationController
  
  before_action :authenticate_user!
  
  def  search
    @range = params[:range]
    # 検索ワードをビューで表示するため
    @search_keyword = params[:word]
    
    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @books = Book.looks(params[:search], params[:word])
    end
    
  end
end
