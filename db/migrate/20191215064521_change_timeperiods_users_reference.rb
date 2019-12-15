class ChangeTimeperiodsUsersReference < ActiveRecord::Migration[6.0]
  def change
    remove_reference :users, :timeperiod
    add_reference :timeperiods, :user, index: true
  end
end
