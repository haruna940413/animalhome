class Enduser::PostsController < Enduser::Base
  before_action :authenticate_enduser! , only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.all.reverse_order
    @newcomment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.enduser_id = current_enduser.id
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to enduser_path(current_enduser.id)
    else
      @enduser = current_enduser
      render "new"
    end
  end

  # def show
  # end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿を更新しました"
      redirect_to enduser_path(current_enduser.id)
    else
      # render "edit"
      # flash[:notice] = "投稿の更新に失敗しました"
      flash[:danger] = @post.errors.full_messages
      redirect_to edit_post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to enduser_path(current_enduser.id)
  end

  private
  def post_params
    params.require(:post).permit(:post_image,:content)
  end
end