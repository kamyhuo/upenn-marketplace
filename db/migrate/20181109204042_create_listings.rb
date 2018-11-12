class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :title
      t.decimal :price
      t.string :state
      t.text :description
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
