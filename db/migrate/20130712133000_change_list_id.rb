class ChangeListId < ActiveRecord::Migration
  def change
    rename_column :tasks, :lists_id, :list_id
  end
end
