class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:first_name,
                                 :second_name,
                                 :phone,
                                 :email,
                                 :birthday,
                                 :gender,
                                 :city,
                                 :password,
                                 :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name,
                                 :second_name,
                                 :phone,
                                 :email,
                                 :birthday,
                                 :gender,
                                 :city,
                                 :password,
                                 :password_confirmation,
                                 :current_password)
  end
end