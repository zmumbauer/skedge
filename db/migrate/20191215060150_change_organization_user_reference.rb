class ChangeOrganizationUserReference < ActiveRecord::Migration[6.0]
  def change
    remove_reference :organizations, :user
    add_reference :users, :organization, index: true
  end
end
