class OrganizationsController < ApplicationController 

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      redirect_to welcome_path(@organization.id)
    else
      render 'static_pages/landing_page'
      flash[:danger]= "Oh no! Something went wrong."
    end
  end

  def update
  end

  def welcome
    @organization = Organization.find(params[:id])
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :description, :phone_number, :logo)
  end

end