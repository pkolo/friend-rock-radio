module Admin::SessionsHelper
  def authorized?(user)
    logged_in? && current_user == user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    current_user != nil
  end

  def login
    session[:user_id] = @user.id
  end

  def logout
    session.clear
  end
end
