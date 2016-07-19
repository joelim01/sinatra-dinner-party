class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :dinner
  belongs_to :dish
end
