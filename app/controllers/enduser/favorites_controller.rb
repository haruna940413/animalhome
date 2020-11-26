class Enduser::FavoritesController < Enduser::Base
  before_action :set_post
  
  def create
   @favorite = Favorite.create(enduser_id: current_enduser_enduser.id, post_id: @post.id)
  end
  
  def destroy
   @favorite = Favorite.find_by(enduser_id: current_enduser_enduser.id, post_id: @post.id)
   @favorite.destroy
  end
  
  private
  def set_post
   @post = Post.find(params[:post_id])
  end
end
