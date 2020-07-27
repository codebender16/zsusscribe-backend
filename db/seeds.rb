# User sample data
User.destroy_all
puts 'destorying users'
Category.destroy_all
puts 'destorying category'
Subscription.destroy_all
puts 'destorying subscriptions'

user_1 = User.create(email: "j@gmail.com", password: "password", first_name: "James", last_name: "Ma", mobile: "123456")
user_2 = User.create(email: "k@gmail.com", password: "password", first_name: "Kuan", last_name: "Lee", mobile: "654321")

# Category sample data

categories = ['entertainment', 'finances', 'music', 'leisure', 'games', 'fitness']

category_items = categories.map do |category|
  Category.create(name: category)
end

# User-created subscriptions sample data

reminder = ['week', 'month', 'quarter','year']
services = ['Netflix', 'Spotify', 'Cosic', 'Steezy', 'MyFitnessPal', 'Audible', 'K-Pop', 'Duolingo', 'Memrise']

5.times do 
  Subscription.create(
    name: services.sample,
    payment_amount: rand(1..50), 
    payment_date: Date.new(2020, 9, 29),
    reminder: "every #{reminder.sample}",
    user_id: [user_1.id, user_2.id].sample,
    category_id: rand(1..5)
  )
end