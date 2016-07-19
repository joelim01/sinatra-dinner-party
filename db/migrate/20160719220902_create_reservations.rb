class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservation do |t|
      t.integer :user_id
      t.integer :dinner
    end
  end
end
