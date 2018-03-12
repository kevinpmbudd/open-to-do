class Api::ItemsController < ApiController
  before_action :authenticated?

  def create
    item = Item.new(item_params)
    item.list = List.find_by_id(params[:list_id])
    if item.save
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    item = Item.find_by_id(params[:id])
    if item.update(item_params)
      render json: {
        status: 200,
        message: "Successfully updated item.",
        item: item
      }
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:description, :completed)
  end
end
