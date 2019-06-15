class LikesController < ApplicationController
  before_action :logged_in_user
  after_action :create_notifications, only: [:create]
  
  def create
    @micropost = Micropost.find(params[:micropost_id])
    if Like.find_by(user_id: current_user.id, 
                    micropost_id: params[:micropost_id]) == nil #重複チェック
      @like = Like.new(user_id: current_user.id,
                     micropost_id: params[:micropost_id])
      @like.save
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
    
  end
  
  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    @like = Like.find_by(user_id: current_user.id,
                         micropost_id: params[:micropost_id])
    @like.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end
  
    private
  
    def create_notifications
      return if @micropost.user_id == current_user.id
      Notification.create(user_id: @micropost.user_id,
                          notified_by_id: current_user.id,
                          micropost_id: @micropost.id,
                          notified_type: "お気に入り",
                          read: false,
                          like_id: @like.id)
    end
  
end