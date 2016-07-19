class CreateDinnerDishes < ActiveRecord::Migration
  def change
    create_table :dinner_dish do |t|
      t.integer :dinner_id
      t.integer :dish_id
    end
  end
end
