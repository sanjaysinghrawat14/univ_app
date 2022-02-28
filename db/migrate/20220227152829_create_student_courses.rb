class CreateStudentCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :student_courses do |t|
       t.integer :student_id, foreign_key: true
       t.integer :course_id, foreign_key: true
      t.timestamps
    end
  end
end
