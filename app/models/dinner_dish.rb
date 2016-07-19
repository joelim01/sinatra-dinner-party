class DinnerDish < ActiveRecord::Base
  belongs_to :dish
  belongs_to :dinner
end
