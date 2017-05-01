class CreateSchools < ActiveRecord::Migration[5.0]
  def change
    create_table :schools do |t|
      t.string :school_icon_name
      t.string :school_name
      t.string :school_email
      t.string :school_website
      t.text :school_description
      t.string :color

      t.timestamps
    end
  end
end
