class User < ActiveRecord::Base
  has_secure_password
  has_many :comments
  has_many :reservations
  has_many :dinner_dishes
  has_many :dinners, through: :reservations
  has_many :dishes, through: :dinners
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :password
  validates_uniqueness_of :email
  validates_format_of :email, :with => /.+@.+\..+/i
end
