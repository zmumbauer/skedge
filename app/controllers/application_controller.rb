class ApplicationController < ActionController::Base
  include DeviseWhitelist

  add_flash_types :danger, :info, :warning, :success
end
