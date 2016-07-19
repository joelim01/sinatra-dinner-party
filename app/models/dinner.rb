class Dinner < ActiveRecord::Base
  has_many :dinner_dishes
  has_many :dishes, through: :dinner_dishes
  has_many :comments
  has_many :reservations
end
