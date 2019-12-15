class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.integer :zipcode
      t.string :name
      t.references :addressable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
