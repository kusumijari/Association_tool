class CreateAssociationTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :association_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
