class CreateDinners < ActiveRecord::Migration
  def change
    create_table :dinners do |t|
      t.string :date
    end
  end
end
