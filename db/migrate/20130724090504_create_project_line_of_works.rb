class CreateProjectLineOfWorks < ActiveRecord::Migration
  def change
    create_table :project_line_of_works do |t|
      t.references :project
      t.references :line_of_work

      t.timestamps
    end
    add_index :project_line_of_works, :project_id
    add_index :project_line_of_works, :line_of_work_id
  end
end
