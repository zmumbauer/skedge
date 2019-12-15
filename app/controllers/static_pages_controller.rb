class StaticPagesController < ApplicationController

  def landing_page
    @organization = Organization.new
  end

  def home  
  end

  def typography_sample
  end
end
