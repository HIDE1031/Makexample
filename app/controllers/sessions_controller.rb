class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(name: session_params[:name])
    if user && user.authenticate(session_params[:password])
      redirect_to mypages_path, success: "ログインしました"
    else
      flash.now[:danger] = "ログイン情報に誤りがあります"
      render :new
    end
  end
  
  def destroy
    log_out
    redirect_to root_path, info: "ログアウトしました"
  end
  
  private
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  def session_params
    params.require(:session).permit(:name, :password)
  end
end
