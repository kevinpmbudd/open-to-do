class Api::ListsController < ApiController
  before_action :authenticated?

  def index
    @lists = List.all
    render json: @lists, each_serializer: ListSerializer
  end

  def create
    list = List.new(list_params)
    list.user = User.find_by_id(params[:user_id])
    if list.save
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:title, :private)
  end
end
