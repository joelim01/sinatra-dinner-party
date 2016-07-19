class CreateComments < ActiveRecord::Migration
  def change
    create_table :comment do |t|
      t.integer :user_id
      t.integer :dinner_id
      t.integer :dish_id
      t.string :content
      t.string :date
    end
  end
end
