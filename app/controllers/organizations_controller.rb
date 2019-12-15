class OrganizationsController < ApplicationController 

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      redirect_to welcome_page_path, success: "Welcome to Skedge!"
    else
      render 'static_pages/landing_page', danger: "Oh no! Something went wrong."
    end
  end

  def update
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :description, :phone_number, :logo)
  end

end