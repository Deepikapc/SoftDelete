class AddColumnIsSoftDeleteToPost < ActiveRecord::Migration[5.0]
  def change
  	add_column :posts, :is_soft_delete, :boolean, default: false
  end
end
