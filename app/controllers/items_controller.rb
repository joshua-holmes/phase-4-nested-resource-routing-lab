class ItemsController < ApplicationController

  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      render json: user.items, include: :user
    else
      render json: Item.all, include: :user
    end
  end
  def show
    item = Item.find(params[:id])
    render json: item
  end
  def create
    item = Item.create!(item_params)
    render json: item, status: 201
  end

  private

  def item_params
    params.permit(:price, :description, :name, :user_id)
  end

end
