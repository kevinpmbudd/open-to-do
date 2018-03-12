class Api::UsersController < ApiController
  before_action :authenticated?

  def index
    @users = User.all
    render json: @users, each_serializer: UserSerializer
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      user = User.find(params[:id])
      if user.destroy
        render json: {
          status: 200,
          message: "User successfully deleted."
        }
      else
        render json: {
          status: 500,
          message: "User deletion unsuccessful. Try again."
        }
      end
    rescue ActiveRecord::RecordNotFound
      render :json => { message: "User not found" }, :status => :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
