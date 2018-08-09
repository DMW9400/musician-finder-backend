class Api::V1::UserArtistsController < ApplicationController
  def index
    user_artists = UserArtist.all
    render json: user_artists, status: 200
  end
end
