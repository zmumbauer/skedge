class CreateSwapRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :swap_requests do |t|
      t.integer :requesting_user_id, default: nil
      t.integer :fulfilling_user_id, default: nil
      t.integer :status, default: 0
      t.integer :timeperiod_id, default: nil

      t.timestamps
    end
  end
end
