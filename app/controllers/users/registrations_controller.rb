# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    if params[:invite_token]
      @token = OrganizationToken.find_by(token: params[:invite_token])
      if @token.valid?
        @organization = Organization.find(@token.organization_id)
        params[:organization_id] = @organization.id
      else
        redirect_to root_path, danger: "Token has expired, ask your manager to reinvite you."
        return
      end
    elsif params[:organization_id]
     @organization = Organization.find(params[:organization_id])
   else
    redirect_to root_path, danger: "Something went wrong"
    return
  end

  super
end

  # POST /resource
  def create
    @organization = Organization.find(params[:user][:organization_id])
    super
    OrganizationToken.find_by_email(resource.email).expire
    if @organization.members.count == 1
      resource.roles=([:business_manager])
      resource.save
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
