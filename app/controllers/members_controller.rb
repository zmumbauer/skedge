class MembersController < ApplicationController
  access user: :all

  def index
    @members = current_user.organization.members
  end

  def update

  end

  def edit

  end

end
