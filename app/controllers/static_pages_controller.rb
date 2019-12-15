class StaticPagesController < ApplicationController

  def landing_page
    redirect_to home_path if current_user
    @organization = Organization.new
  end

  def home  
    redirect_to landing_page if !current_user
  end

  def typography_sample
  end
end
