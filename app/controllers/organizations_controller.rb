class OrganizationsController < ApplicationController 
  access business_manager: :all
  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      redirect_to welcome_path(@organization.id)
    else
      render 'static_pages/landing_page'
      flash[:danger]= "Oh no! Something went wrong."
    end
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(param[:id])
    if @organization.update(organization_params)
      redirect_to organization_path, success: "#{@organization.name} updated successfully!"
    else
      render 'edit', danger: "Could not update #{@organization.name}!"
    end
  end

  def welcome
    @organization = Organization.find(params[:id])
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :description, :phone_number, :logo)
  end

end