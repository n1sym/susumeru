class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 10)
     
    end
  end

  def create
    Notification.where("user_id = #{current_user.id}").update_all "read = 'true'"
    redirect_to "/notification"
  end
  
  def notification
    mute_ids = "SELECT followed_id FROM relationship_mutes WHERE follower_id = #{current_user.id}"
    @notifications = Notification.where("user_id = '#{current_user.id}'").where("NOT notified_by_id IN (#{mute_ids})").paginate(page: params[:page], per_page: 20)
  end
  
  def about
  end
  
  def contact
  end
  
  def mute_index
    @users = current_user.muting.paginate(page: params[:page], per_page: 20)
  end
  
  def index
    if current_user != nil
      mute_ids = "SELECT followed_id FROM relationship_mutes WHERE follower_id = #{current_user.id}"
    else
      mute_ids = nil
    end
    if params[:q]
      @micropost_items = Micropost.search_by_keyword(params[:q]).where("NOT user_id IN (#{mute_ids})")
                        .paginate(page: params[:page], per_page: 10)
    elsif params[:id]
       @micropost_items =  Micropost.where("category = '#{params[:id]}'").where("NOT user_id IN (#{mute_ids})")
                          .paginate(page: params[:page], per_page: 10)
    else                    
      @micropost_items = Micropost.where("NOT user_id IN (#{mute_ids})").paginate(page: params[:page], per_page: 10)
    end
  end
  
  

end
