class OrganizationTokensController < ApplicationController
  access business_manager: :all
  def create
    @token = OrganizationToken.new(token_params)
    @token.organization_id = current_user.organization.id
    if @token.save
      begin
        MemberMailer.invitation(@token).deliver
      rescue
        redirect_to members_path, danger: "Email not sent"
      end
      redirect_to members_path, success: "Invitation sent to #{@token.email}"
    else
      redirect_to members_path, danger: "Invitation could not be sent."
      @token.errors.full_messages.each do |this|
        flash[:danger] = "#{this}"
      end
    end

  end

  private

  def token_params
    params.require(:organization_token).permit(:email)
  end

end