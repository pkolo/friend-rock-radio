class Admin::DashboardController < Admin::AdminController
  include Admin::SessionsHelper
  before_action :require_login

  def index
    @user = current_user
    @shows = @user.shows
  end

  private
    def require_login
      redirect_to admin_login_url unless logged_in?
    end
end
