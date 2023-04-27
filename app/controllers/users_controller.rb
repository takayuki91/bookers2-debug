class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
    # current_user以外の全idを取ってくる
    @relationshipusers = User.where.not(id: current_user.id)
  end
  
  # あるユーザーがフォローしている人を全取得
  def followers
    user = User.find(params[:id])
    @users = user.followers
  end
  
  # あるユーザーがフォローされている人を全取得
  def followeds
    user = User.find(params[:id])
    @users = user.followeds
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user.id)
    end
  end
end
