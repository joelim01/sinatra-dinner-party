dinner_list = [Date.new(2016,7,7), Date.new(2016,7,14),Date.new(2016,7,28),Date.new(2016,8,4)]

dinner_list.each do |date|
  binding.pry
  Dinner.create(:date => date)
end

user_list = [
  [ "me", "me@me.com", "me" ],
  [ "you", "you@you.com", "you" ],
  [ "them", "them@them.com", "them" ]
]

user_list.each do |name, email, password|
  User.create(:name => name, :email => email, :password => password)
end
