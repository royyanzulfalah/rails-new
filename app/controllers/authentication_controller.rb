class AuthenticationController < ApplicationController
    skip_before_action :verify_authenticity_token

    def login 
        user = User.find_by(email: params[:email])
        if !user
            render json: {message: "Oops, masukkan email dengan benar."}, status: 401
        else
            if user.authenticate(params[:password])
                # secret_key = Rails.application.secrets.secret_key_base[0]
                # token = JWT.encode({
                #     user_id: user.id,
                #     email: user.email,
                # }, secret_key)
                # render json: {token: token}

                # token = JWT.encode(user, secret_key)
                render json: { message: "Berhasil Login" }, status: 200
            else
                render json: {message: "Oops, email atau kata sandi tidak benar."}, status: 401
            end 
        end
    end
end