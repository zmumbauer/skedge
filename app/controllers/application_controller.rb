class ApplicationController < ActionController::Base
  helper_method :current_organization
  include DeviseWhitelist

  add_flash_types :danger, :info, :warning, :success

   def current_organization
    if current_user
      current_user.organization
    else
      nil
    end
  end

end
