class AddCategoryAndStatusToTimeperiods < ActiveRecord::Migration[6.0]
  def change
    add_column :timeperiods, :status, :integer, default: 0
    add_column :timeperiods, :kind, :integer, default: 0
  end
end
