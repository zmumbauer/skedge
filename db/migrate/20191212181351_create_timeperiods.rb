class CreateTimeperiods < ActiveRecord::Migration[6.0]
  def change
    create_table :timeperiods do |t|
      t.integer :group
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
