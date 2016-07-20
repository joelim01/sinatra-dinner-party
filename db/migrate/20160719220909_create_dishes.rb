class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :ingredients
      t.string :description
      t.string :imgurl
    end
  end
end
