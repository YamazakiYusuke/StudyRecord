class SessionsController < ApplicationController
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to study_times_path, notice: "ログインしました！"
    else
      flash.now[:danger] = "ログイン失敗"
      redirect_to new_session_path
    end
  end
  
  def destroy
    session.delete(:user_id)
    flash[:notice] = "ログアウトしました"
    redirect_to new_session_path
  end
end
