class CreateAttendances < ActiveRecord::Migration[8.0]
  def change
    create_table :attendances do |t|
      t.boolean :attended
      t.references :student, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
    add_index :attendances, [ :student_id, :lesson_id ], unique: true
  end
end
