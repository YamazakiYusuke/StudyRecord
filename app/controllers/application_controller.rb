class ApplicationController < ActionController::Base

  include SessionsHelper

  def authenticate_user
    unless logged_in?
      redirect_to new_session_path
    end
  end
end
