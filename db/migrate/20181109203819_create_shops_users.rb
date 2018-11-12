class CreateShopsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :shops_users do |t|
      t.references :shop, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
