class Api::V1::UserInstrumentsController < ApplicationController
  def index
    userinstruments = UserInstrument.all
    render json: userinstruments, status: 200
  end

end
