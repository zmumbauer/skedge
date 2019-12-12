class AddTimeperiodReferenceToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :timeperiod, index: true
  end
end
