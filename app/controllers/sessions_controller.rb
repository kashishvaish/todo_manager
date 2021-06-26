class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render plain: "Successfully Signed-in"
    else
      render plain: "Invalid password."
    end
  end
end
