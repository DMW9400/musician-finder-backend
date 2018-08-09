class Api::V1::AuthController < ApplicationController

  def login
    user = User.find_by(name: params[:username])
    if user && user.authenticate(params[:password])
      token = issue_token({ 'user_id': user.id })
      render json: {'token': token, 'user': user}
    else
      render json: {'error': 'Could not find or authenticate user'}, status: 401
    end
  end

  def active_user
    if !current_user.present?
      render json: {'error': 'There is no current user'}
    else
      render json: current_user, serializer: UserSerializer
    end
  end


end
