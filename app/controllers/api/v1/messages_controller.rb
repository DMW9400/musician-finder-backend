class Api::V1::MessagesController < ApplicationController

  def index
    messages = Message.all
    render json: messages, status: 200
  end

  def create
    message = Message.create(message_params)

    render json: message, status: 201
  end

  def update
    @recipe.update(recipe_params)
    render json: @recipe, status: 200
  end

  def destroy
    recipeId = @recipe.id
    @recipe.destroy
    render json: {message:"Zap! Recipe deleted", recipeId:recipeId}
  end

  def show
    render json: @recipe, status: 200
  end

  private
  def message_params
    params.permit(:sender_id,:recipient_id,:message)
  end

end
