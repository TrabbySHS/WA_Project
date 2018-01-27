class AddGroupToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :group, :integer
  end
end
