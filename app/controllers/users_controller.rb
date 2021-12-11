class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token

    # Register
    def create 
        user = User.create(user_params)
        render json: user, status: :created
    end

    # Show user
    def show
        user = User.find(params[:id])
        # render :json => user, status: :ok
        render json: {
            data: user
        }, status: :ok
    rescue ActiveRecord::RecordNotFound => e
        render json:{
            message: e
        }, status: :not_found
    end

    # Update Profile
    def update_profile
            user = User.find(params[:id])
            user.update(update_profile_params)
    
            render :json => user, status: :ok
            rescue ActiveRecord::RecordNotFound => e
            render json:{
                message: e
            }, status: :not_found
    end

    # Update Password
    def update_profile
            user = User.find(params[:id])
            user.update(update_password_params)
    
            render :json => user, status: :ok
            rescue ActiveRecord::RecordNotFound => e
            render json:{
                message: e
            }, status: :not_found
    end

    private 
  
    def user_params
        params.permit(:full_name, :email, :password)
        # params.require(:users).permit(:full_name, :email, :password)
        # params.permit(:full_name, :email, :password, :phone, :birthdate, :gender, :ktpid, :profile_picture, :address)
    end
    def update_profile_params
        params.permit(:id, :full_name, :email, :password, :phone, :birthdate, :gender, :ktpid, :profile_picture, :address)
    end
    def update_password_params
        params.permit(:id, :full_name, :email, :password, :phone, :birthdate, :gender, :ktpid, :profile_picture, :address)
    end
 
end
