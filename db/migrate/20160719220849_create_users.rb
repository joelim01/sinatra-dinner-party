class CreateUsers < ActiveRecord::Migration
  def change
    create_table :user do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :role
    end
  end
end
