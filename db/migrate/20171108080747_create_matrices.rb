class CreateMatrices < ActiveRecord::Migration[5.1]
  def change
    create_table :matrices do |t|
      t.integer :Row_no
      t.integer :Col_no
      t.integer :Value

      t.timestamps
    end
  end
end
