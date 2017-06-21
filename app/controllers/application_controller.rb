class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  # :nocov:
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:
      %i[
        first_name
        last_name
        cpf
        phone
        gender
        birth_date
        avatar
      ])

    devise_parameter_sanitizer.permit(:account_update, keys:
      %i[
        phone
        gender
        avatar
      ])
  end
end
