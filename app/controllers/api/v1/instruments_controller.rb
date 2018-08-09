class Api::V1::InstrumentsController < ApplicationController
    def index
      instruments = Instrument.all
      render json: instruments, status: 200
    end
end
