class User < ActiveRecord::Base
  has_many :comments
  has_many :reservations
  has_many :dinner_dishes
  has_many :dinners, through: :dinner_dishes
  has_many :dishes, through: :dinners
end
