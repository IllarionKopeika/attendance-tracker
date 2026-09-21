class CreateLessons < ActiveRecord::Migration[8.0]
  def change
    create_table :lessons do |t|
      t.integer :teaching_method
      t.datetime :given_at
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
