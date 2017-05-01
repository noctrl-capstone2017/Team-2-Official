class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :student_icon_name
      t.string :student_contact_info
      t.text :student_description
      t.string :student_icon
      t.string :color
      t.integer :school_id
      t.string :student_name

      t.timestamps
    end
  end
end
