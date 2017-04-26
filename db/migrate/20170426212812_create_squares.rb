class CreateSquares < ActiveRecord::Migration[5.0]
  def change
    create_table :squares do |t|
      t.string :square_id
      t.integer :square_type
      t.text :square_description
      t.string :color
      t.integer :school_id

      t.timestamps
    end
  end
end
