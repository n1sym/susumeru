class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 10)
     
    end
  end

  def about
  end
  
  def contact
  end
  
  def index
    if params[:q]
      @micropost_items = Micropost.search_by_keyword(params[:q])
                        .paginate(page: params[:page], per_page: 10)
    elsif params[:id]
       @micropost_items =  Micropost.where("category = '#{params[:id]}'")
                          .paginate(page: params[:page], per_page: 10)
    else                    
      @micropost_items = Micropost.all.paginate(page: params[:page], per_page: 10)
    end
  end
  
  

end
