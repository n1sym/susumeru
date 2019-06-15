class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]
  before_action :correct_user,   only: :destroy

  def new
    @micropost = current_user.microposts.build if logged_in?
    @user = current_user
  end
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "投稿が完了しました!"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def edit
    @micropost = Micropost.find(params[:id])
    
  end
  
  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update_attributes(micropost_params)
      flash[:success] = "更新しました"
      redirect_to root_url
    else
      render "edit"
    end
  end
  
  def destroy
    @micropost.destroy
    flash[:success] = "削除しました"
    redirect_to request.referrer || root_url
  end
  
  private

    def micropost_params
      params.require(:micropost).permit(:content, :title, :category, :author, :genre, :genre2, :genre3, :url)
    end
    
    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
