class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
     
    end
  end

  def about
  end
  
  def contact
  end
  
  def index
    if params[:q]
      @micropost_items = Micropost.search_by_keyword(params[:q])
                        .paginate(page: params[:page])
    else                    
      @micropost_items = Micropost.all.paginate(page: params[:page])
    end
  end
  
  def novel
     @novel_items = Micropost.where("category = 'novel'")
                          .paginate(page: params[:page])
  end
  
  def comic
     @comic_items = Micropost.where("category = 'comic'")
                          .paginate(page: params[:page])
  end
  
  def web_novel
     @web_novel_items = Micropost.where("category = 'web_novel'")
                          .paginate(page: params[:page])
  end
  
  def web_comic
     @web_comic_items = Micropost.where("category = 'web_comic'")
                          .paginate(page: params[:page])
  end
  
  def anime
     @anime_items = Micropost.where("category = 'anime'")
                          .paginate(page: params[:page])
  end
  
  def movie
     @movie_items = Micropost.where("category = 'movie'")
                          .paginate(page: params[:page])
  end

end
