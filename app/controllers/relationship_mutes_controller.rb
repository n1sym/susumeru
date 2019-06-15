class RelationshipMutesController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find(params[:followed_id])
    current_user.mute(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = RelationshipMute.find(params[:id]).followed
    current_user.unmute(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end
