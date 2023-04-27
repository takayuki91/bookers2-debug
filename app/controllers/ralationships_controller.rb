class RalationshipsController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    
  end
  
  def create
    follower = current_user.ralationships.build(followed_id: params[:user_id])
    follower.save
    redirect_to request.referrer
  end
  
  def destroy
    follower = current_user.ralationships.find_by(followed_id: params[:user_id])
    follower.destroy
    redirect_to request.referrer
  end


  
end
