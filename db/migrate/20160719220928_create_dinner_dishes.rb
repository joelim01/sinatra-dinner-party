class CreateDinnerDishes < ActiveRecord::Migration
  def change
    create_table :dinner_dishes do |t|
      t.integer :dinner_id
      t.integer :dish_id
    end
  end
end
