class UsersController < ApplicationController
<<<<<<< HEAD
  before_action :authenticate_user, only: [:update]
=======

  before_action :authenticate_user, only: [:update]
  
>>>>>>> 8394d020bb6dd3139be5e687d3dc83aa6f810688
  def create
    user = User.new(user_params)
    if user.save
      render json: 'user created', status: :created
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
<<<<<<< HEAD
=======
  end

  def update
    if user_params[:email] == ''
      current_user.password = user_params[:password]
    else
      current_user.email = user_params[:email]
    end
    render json: current_user.email, status: :ok if current_user.save
>>>>>>> 8394d020bb6dd3139be5e687d3dc83aa6f810688
  end

  def update
    if user_params[:email] == ''
      current_user.password = user_params[:password]
    else
      current_user.email = user_params[:email]
    end
    render json: current_user.email, status: :ok if current_user.save
  end
<<<<<<< HEAD
  #   def create
#     User.create(user_params)
#     render json: 'user created', status: :ok
#   end

#   private

#   def user_params
#     params.require(:user).permit(:email, :password)
#   end
# end
=======
end
>>>>>>> 8394d020bb6dd3139be5e687d3dc83aa6f810688
