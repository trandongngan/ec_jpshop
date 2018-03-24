class MyController < ApplicationController
  def login
  end

  def register
  end

  def create
    permitted_params = params.fetch(:user, {}).permit(:email, :username, :password, :password_confirmation)
    @user = User.new(permitted_params)

    if @user.save
      cookies[:login] = JsonWebToken.encode({user_id: @user.id})
      redirect_to "/"
    else
      render action: :register
    end
  rescue => e
  end
end
