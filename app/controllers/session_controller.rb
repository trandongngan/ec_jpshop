class SessionController < ApplicationController
  skip_before_action :auto_login!

  def create
    user = User.find_by(email: auth_params[:email])
    if user.authenticate(auth_params[:password])
      payload = {user_id: user.id}
      cookies[:login] = JsonWebToken.encode(payload)
      # render json: {jwt: cookies[:login]}
      redirect_to "/"
    else
    end
  end

  private
    def auth_params
      params.fetch(:auth, {}).permit(:email, :password)
    end
end
