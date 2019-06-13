class LikesController < ApplicationController
  def create
    @current_user = User.find_by(id: session[:user_id])
    @micropost = Micropost.find(params[:micropost_id])
    @like = Like.new(user_id: @current_user.id,
                     micropost_id: params[:micropost_id])
    @like.save
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
    
  end
  
  def destroy
    @current_user = User.find_by(id: session[:user_id])
    @micropost = Micropost.find(params[:micropost_id])
    @like = Like.find_by(user_id: @current_user.id,
                         micropost_id: params[:micropost_id])
    @like.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end
  
end