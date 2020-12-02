class Enduser::CommentsController < Enduser::Base
  before_action :authenticate_enduser! , only: [:create, :destroy]
  before_action :correct_enduser, only: [:destroy]
  before_action :set_post
  
  def create
    @newcomment = Comment.new
    @comment = Comment.new(comment_params)
    @comment.enduser_id = current_enduser.id
    @comment.post_id = @post.id
    @comment.save
    #その投稿への全コメント取得
    @comments = @post.comments
  end

  def destroy
    @comment = Comment.find_by(id: params[:id], enduser_id: current_enduser.id)
    @comment.destroy
    @comments = @post.comments
    @newcomment = Comment.new
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end

   def correct_enduser
     @comment = Comment.find(params[:id])
     if current_enduser.id != @comment.enduser_id
      redirect_to posts_path
     end
   end

  def set_post
    @post = Post.find(params[:post_id])
  end

end
