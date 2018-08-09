class Api::V1::UserGenresController < ApplicationController
  def index
    user_genres = UserGenre.all
    render json: user_genres, status: 200
  end
end
