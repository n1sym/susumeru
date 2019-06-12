class LikesController < ApplicationController
  def create
    @current_user = User.find_by(id: session[:user_id])
    @like = Like.new(user_id: @current_user.id,
                     micropost_id: params[:micropost_id])
    @like.save
    
    redirect_to request.referrer || root_url
  end
  
  def destroy
    @current_user = User.find_by(id: session[:user_id])
    @like = Like.find_by(
      user_id: @current_user.id,
      micropost_id: params[:micropost_id])
      @like.destroy
      redirect_to request.referrer || root_url
  end
  
end