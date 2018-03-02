class UsersController < ApplicationController
before_action :require_login, except: [:new, :create, :show]
  
  def new
    if session[:user_id]
        redirect_to '/groups'
    else
      render "new"
    end
  end

  def show
    @groups = Group.show_page
  end


  def create
    @user = User.new(user_params)
    if @user.valid?
        @user.save
        session[:user_id] = @user.id
        redirect_to '/groups'
    else
        flash[:error]= @user.errors.full_messages
        redirect_to :back
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name,:last_name,:email,:password, :password_confirmation)
  end
end
