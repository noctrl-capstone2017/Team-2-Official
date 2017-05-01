class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string :user_name
      t.string :teacher_icon_name
      t.string :teacher_name
      t.string :teacher_email
      t.boolean :admin_powers
      t.boolean :analysis_powers
      t.text :teacher_description
      t.string :color
      t.integer :school_id
      t.string :teacher_password
      t.string :teacher_password_confirmation

      t.timestamps
    end
  end
end
