class CreateDinners < ActiveRecord::Migration
  def change
    create_table :dinner do |t|
      t.string :date
    end
  end
end
