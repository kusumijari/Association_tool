class CreateMatrices < ActiveRecord::Migration[5.1]
  def change
    create_table :matrices do |t|
      t.string :Drink1
      t.string :Drink2
      t.string :Value

      t.timestamps
    end
  end
end
