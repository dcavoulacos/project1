class User::ParameterSanitizer < Devise::ParameterSanitizer
    private
    def sign_in
        default_params.permit(:username, :email, :password, :remember_me)
    end

    def sign_up
        default_params.permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
    end
end