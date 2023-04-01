# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "destroying motos "
Moto.destroy_all
puts "destroting users"
User.destroy_all

puts "Creating users"

PASSWORD = 123_456

user1 = User.create!(
  # name: "Afafe S",
  email: "afafe@test.com",
  password: PASSWORD
)

user2 = User.create!(
  # name: "Ghizlane A",
  email: "ghizlane@test.com",
  password: PASSWORD
)

user3 = User.create!(
  # name: "Sanaa S",
  email: "sanaa@test.com",
  password: PASSWORD
)

user4 = User.create!(
  # name: "Malik R",
  email: "malik@test.com",
  password: PASSWORD
)

user5 = User.create!(
  # name: "Aklim B",
  email: "aklim@test.com",
  password: PASSWORD
)

puts "Creating motos"

moto1 = Moto.create!(
  user: user1,
  description: "Powerful bike with a smooth ride and great handling.",
  price: 2500.00,
  brand: "Harley-Davidson",
  color: "Black",
  year: 2018,
  mileage: 5000,
  photo: "https://example.com/bike.jpg",
  title: "Harley-Davidson Street Bob",
  city: "New York"
)

moto2 = Moto.create!(
  user: user2,
  description: "Lightweight bike perfect for city commuting.",
  price: 1500.00,
  brand: "Honda",
  color: "Red",
  year: 2020,
  mileage: 1000,
  photo: "https://example.com/bike2.jpg",
  title: "Honda CB300R",
  city: "Los Angeles"
)

moto3 = Moto.create!(
  user: user3,
  description: "Comfortable and stylish bike for long-distance touring.",
  price: 8000.00,
  brand: "BMW",
  color: "Blue",
  year: 2017,
  mileage: 1500.00,
  city: "Chicago"
)

moto4 = Moto.create!(
  user: user4,
  description: "Aggressive and powerful bike with a sporty design.",
  price: 5000.00,
  brand: "Ducati",
  color: "Yellow",
  year: 2019,
  mileage: 8000,
  photo: "https://example.com/bike4.jpg",
  title: "Ducati Monster 821",
  city: "San Francisco"
)

moto5 = Moto.create!(
  user: user5,
  description: "Classic cruiser bike with a retro look and feel.",
  price: 3000.00,
  brand: "Indian",
  color: "Silver",
  year: 2015,
  mileage: 1200.00,
  photo: "https://example.com/bike5.jpg",
  title: "Indian Scout Sixty",
  city: "Miami"
)

puts "seeds planted 😊"
