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

  def destroy
    begin
      list = List.find(params[:id])
      if list.destroy
        render json: {
          status: 200,
          message: "List successfully deleted."
        }
      else
        render json: {
          status: 500,
          message: "List deletion unsuccessful. Try again."
        }
      end
    rescue ActiveRecord::RecordNotFound
      render :json => { message: "List not found"}, :status => :not_found
    end
  end

  private

  def list_params
    params.require(:list).permit(:title, :private)
  end
end
