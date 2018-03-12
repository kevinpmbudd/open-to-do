class Api::ListsController < ApiController
  before_action :authenticated?

  def index
    @lists = List.where("user_id": params[:user_id])
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

  def update
    list = List.find_by_id(params[:id])
    if list.update(list_params)
      render json: {
        status: 200,
        message: "Successfully updated list.",
        list: list
      }
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      list = List.find(params[:id])
      list.destroy
      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render :json => {}, :status => :not_found
    end
  end

  private

  def list_params
    params.require(:list).permit(:title, :private)
  end
end
