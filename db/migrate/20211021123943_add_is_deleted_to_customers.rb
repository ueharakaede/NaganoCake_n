class AddIsDeletedToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :IsDeleted, :boolean
  end
end
