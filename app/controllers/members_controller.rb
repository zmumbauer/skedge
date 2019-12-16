class MembersController < ApplicationController
  access user: :all

  def index
    @members = current_user.organization.members
    @new_member = OrganizationToken.new
  end

end
