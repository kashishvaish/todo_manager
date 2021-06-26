class UsersController < ApplicationController
  def new
    render "users/new"
  end

  def index
    render plain: User.order(:id).map { |user| user.to_pleasant_string }.join("\n")
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_pleasant_string
  end

  def create
    User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
    redirect_to "/"
  end

  def check
    email = params[:email]
    password = params[:password]
    user = User.where(email: email, password: password).first
    response_text = user ? "true" : "false"
    render plain: response_text
  end
end
