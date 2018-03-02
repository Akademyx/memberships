class SessionsController < ApplicationController
  def create
      flash[:error] ||= []
      @user = User.find_by(email:params[:email])
      if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to "/groups"
      else
          flash[:error].push("Invalid Email/Password")
          redirect_to "/main"
      end
  end

  def destroy
      reset_session
      redirect_to "/main"
  end
end
