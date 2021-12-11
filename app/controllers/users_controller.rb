class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authorized, only: [:auto_login, :show, :update_profile, :update_password]

    # Register
    def create 
        user = User.create(user_params)
        
        if validate_presense_of :email
            user.valid?
            user.save
            token = encode_token({user_id: user.id})
            render json:{
                data: user,
                message: "Berhasil Terdaftar",
                token: token
            }, status: :created
            else
           render json: {message: 'Email sudah terdaftar.', errors: user.error}, status: :not_acceptable
           
        end
    end

    #Login
    def login
        user = User.find_by(email: params[:email])
    
        if user && user.authenticate(params[:password])
          token = encode_token({user_id: user.id})
          render json: {data: user, message: "Berhasil Login", token: token}, status: :ok
        else
          render json: {error: "Silahkan masukan email dan password dengan benar."}, status: :unauthorized
        end
    end

    # Show user
    def show
        user = User.find(params[:id])
        # token = encode_token({user_id: user.id})
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
            render json: {
                data: user,
                message: "Profile Berhasil Di Update"
            }, status: :ok

            rescue ActiveRecord::RecordNotFound => e
            render json:{
                message: e
            }, status: :not_found
    end

    # Update Password
    def update_password
            user = User.find(params[:id])
            user.update(update_password_params)
            render json: {
                data: user,
                message: "Password Berhasil Diubah"
            }, status: :ok

            rescue ActiveRecord::RecordNotFound => e
            render json:{
                message: e
            }, status: :not_found
    end

    # Auto Login
    def auto_login
        render json: @user
    end

    private 
  
    def user_params
        params.permit(:full_name, :email, :password)
    end
    def update_profile_params
        params.permit(:id, :full_name, :email, :password, :phone, :birthdate, :gender, :ktpid, :profile_picture, :address)
    end
    def update_password_params
        params.permit(:id, :email, :password)
    end
 
end
