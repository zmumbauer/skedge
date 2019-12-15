module DeviseWhitelist
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:first_name, :last_name, :phone_number)
    end
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number])
  end

end
