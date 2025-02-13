class PostsController < ApplicationController
  before_action :authenticate_user

  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post=Post.new(post_params)
    @post.user_id = @current_user.id
    if @post.save!
      redirect_to posts_path
    else
      render("posts/new")
    end
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to posts_path
    else
      render("posts/edit")
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.destroy
     flash[:notice] = "投稿を削除しました"
     redirect_to("/posts/index")
   end
  end

  private 
def post_params
  params.require(:post).permit(:bier_id, :content, :evaluation)
end
end

