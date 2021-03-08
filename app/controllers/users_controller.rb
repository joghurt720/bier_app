class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :edit, :update, :logout]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :over_20?, except: [:verify_age, :verified]
  
  def index
    @users = User.all.order(created_at: :desc)
  end
  
  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      image_name: "user.png",
      password: params[:password]
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました　Los geht's!!"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end

def edit
  @user = User.find_by(id: params[:id])
end

def update
  @user = User.find(params[:id])
  
  # if params[:image]
  #   @user.image_name = "#{@user.id}.jpg"
  #   image = params[:image]
  #   File.binwrite("public/user_images/#{@user.image_name}", image.read)
  # end
  
  if @user.update(user_params)
    flash[:notice] = "ユーザー情報を編集しました"
    redirect_to user_path(@user)
  else
    render("users/edit")
  end
end

def destroy
  @user = User.find_by(id:params[:id])
  if @user.destroy
    session[:user_id] = nil
    redirect_to("/top")
  end
end

def login_form
end

def login
  @user = User.find_by(email: params[:email], password: params[:password])
  if @user 
    session[:user_id] = @user.id
    flash[:notice] = "ログインしました"
    redirect_to user_path(@user.id)
  else
    @error_message = "メールアドレスまたはパスワードが間違っています"
    @email = params[:email]
    @password = params[:password]
    render("login_form")
  end
end

def logout
  session[:user_id] = nil
  flash[:notice] = "ログアウトしました"
  redirect_to root_path
end

def ensure_correct_user
  if @current_user.id != params[:id].to_i
    flash[:notice] = "権限がありません"
    redirect_to posts_path
  end
end

def verify_age
  unless session[:over20].nil?
    redirect_to lands_top_path
  end
  if session[:original_path].nil?
     session[:original_path] = request.fullpath
  end
end

def verified
  session[:over20] = { value: "yes", expires: 1.minutes.since }
  redirect_to (session[:original_path] == "/users/verify_age") ? root_path : session[:original_path]
end

private 
def user_params
  params.require(:user).permit(:name, :image, :email)
end

end