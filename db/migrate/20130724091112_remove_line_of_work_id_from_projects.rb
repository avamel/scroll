class RemoveLineOfWorkIdFromProjects < ActiveRecord::Migration
  def up
    remove_column :projects, :line_of_work_id
  end

  def down
    add_column :projects, :line_of_work_id, :references
  end
end
