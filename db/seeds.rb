<<<<<<< HEAD
User.create(email: "J@gmail.com", password: "password", first_name: "James", last_name: "Ma", mobile: "123456")
User.create(email: "K@gmail.com", password: "password", first_name: "Kuan", last_name: "Lee", mobile: "654321")
Category.create(name: "music")
Subscription.create(name: "Netflix", payment_amount: 6, reminder: "time to go", user_id: 1, category_id: 1)
Subscription.create(name: "Spotify", payment_amount: 12, reminder: "right now", user_id: 2, category_id: 1)
=======
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

>>>>>>> 3bb1df78b3807b9b8374008192884bc5d77e68c1
