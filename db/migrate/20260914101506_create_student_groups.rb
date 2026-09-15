class CreateStudentGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :student_groups do |t|
      t.references :student, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
    add_index :student_groups, [ :student_id, :group_id ], unique: true
  end
end
