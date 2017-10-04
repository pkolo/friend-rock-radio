class Admin::SessionsController < Admin::AdminController
  include Admin::SessionsHelper

  def new
  end

  def create
    @user = User.find_by(name: session_params[:name]).try(:authenticate, session_params[:password])
    if @user
      login
      redirect_to admin_url
    else
      @errors = ["Email/password does not match"]
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url
  end

  private

    def session_params
      params.require(:session).permit(:name, :password)
    end
end
