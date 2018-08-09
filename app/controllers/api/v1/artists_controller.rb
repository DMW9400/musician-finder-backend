class Api::V1::ArtistsController < ApplicationController
      def index
        artists = Artist.all
        render json: artists, status: 200
      end
end
