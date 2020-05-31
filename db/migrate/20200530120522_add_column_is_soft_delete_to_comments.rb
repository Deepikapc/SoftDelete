class AddColumnIsSoftDeleteToComments < ActiveRecord::Migration[5.0]
  def change
  	add_column :comments, :is_soft_delete, :boolean, default: false
  end
end
