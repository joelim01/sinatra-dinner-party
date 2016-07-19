class Dish < ActiveRecord::Base
  has_many :dinner_dishes
  has_many :dinners, :through :dinner_dishes
  has_many :comments
end
