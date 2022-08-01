class SessionsController < ApplicationController
  
  # POST /login
  def create
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password]) # <-- What in the curriculum is even this?
      session[:user_id] = user.id
      render json: user, status: :created
    else
      render json: {error:{login: "Invalid username or password"}}, status: :unauthorized
    end
  end

  # DELETE /logout
  def destroy
    session.delete :user_id
    head :no_content
  end

end