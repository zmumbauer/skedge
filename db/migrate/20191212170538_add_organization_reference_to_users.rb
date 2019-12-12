class AddOrganizationReferenceToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :organizations, :user, index: true
  end
end
