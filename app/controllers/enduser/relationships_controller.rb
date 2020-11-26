class Enduser::RelationshipsController < Enduser::Base
 before_action :authenticate_enduser_enduser! , only: [:create, :destroy]
 
 def index_following_user 
   @enduser  = Enduser.find(params[:id])  
   @endusers = @enduser.following_user
 end  

 def index_follower_user
   @enduser  = Enduser.find(params[:id])  
   @endusers = @enduser.follower_user
 end  

 def create
   @enduser = Enduser.find(params[:enduser_id])
   
   following = current_enduser_enduser.follow(@enduser.id)
   if following.save
     flash[:notice] = 'ユーザーをフォローしました'
     redirect_back fallback_location: @enduser
   else
     flash.now[:notice] = 'ユーザーのフォローに失敗しました'
     redirect_back fallback_location: @enduser
   end
 end

 def destroy
   @enduser = Enduser.find(params[:enduser_id])
   
   following = current_enduser_enduser.unfollow(@enduser.id)
   if following.destroy
     flash[:notice] = 'ユーザーのフォローを解除しました'
     redirect_back fallback_location: @enduser
   else
     flash.now[:notice] = 'ユーザーのフォロー解除に失敗しました'
     redirect_back fallback_location: @enduser
   end
 end

 private
 def relationship_params
    params.require(:relationship).permit(:followed_id)
 end

end
