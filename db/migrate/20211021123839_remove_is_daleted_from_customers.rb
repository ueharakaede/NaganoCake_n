class RemoveIsDaletedFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :IsDareted, :boolean
  end
end
