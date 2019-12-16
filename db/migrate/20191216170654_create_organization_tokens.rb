class CreateOrganizationTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :organization_tokens do |t|
      t.string :token
      t.references :organization, index: true
      t.string :email
      t.timestamps
    end
  end
end
