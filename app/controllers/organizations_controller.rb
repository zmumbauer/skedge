class OrganizationsController < ApplicationController 

  def create
    @organization = Organization.new(organization_params)
  end

  def update
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :description, :phone_number, :logo)
  end

end