class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def show
    puts "--------ログここから-------"
    puts params[:id]
    puts "--------ログここまで--------"
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @comments = @post.comments
    @likes_count = Like.where(post_id: @post.id).count
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(
      name: params[:name],
      content: params[:content]
    )
    @post.user_id = @current_user.id
    if @post.save!
      redirect_to("/posts/index")
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
      redirect_to("/posts/index")
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
end

