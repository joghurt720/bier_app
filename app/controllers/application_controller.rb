class ApplicationController < ActionController::Base
  before_action :set_current_user
  
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    end
  end

  def forbid_login_user
    if @current_user
      flash[:noice] = "You are already here!"
      redirect_to("/posts/index")
    end
  end

  def over_20?
    if session[:over20].nil?
      session[:original_path] = request.fullpath
      redirect_to users_verify_age_path, alert: "You have to verify age."
    end
  end

end
