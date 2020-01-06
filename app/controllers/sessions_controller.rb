class SessionsController < ApplicationController
  def new
    
  end
  def create
   user = User.find_by(email: params[:session][:email].downcase)
   if user && user.authenticate(params[:session][:password])
     session[:user_id] = user.id
     flash[:success] = "Logged in successfully"
     redirect_to users_path(user)
   else
     flash.now[:danger] = "User does not exist"
     render 'new'
   end
  end
  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged Out Successfully"
    redirect_to root_path
  end
end
