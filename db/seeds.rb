# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |i|
  User.create(username: Faker::Internet.user_name, password: Faker::Internet.passsword, first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, street_address:Faker::Address.street_address, city:Faker::Address.city, state:Faker::Address.State, zip_code:Faker::Address.zip, email:Faker::Internet.email, phone:Faker::PhoneNumber.phone_number)
end

20.times do |i|
  Vendor.create(username: Faker::Internet.user_name, password: Faker::Internet.passsword, company_name:Faker::Company.name, street_address:Faker::Address.street_address, city:Faker::Address.city, state:Faker::Address.State, zip_code:Faker::Address.zip, email:Faker::Internet.email, phone:Faker::PhoneNumber.phone_number)

  Service.create(name:Faker::Job.field)
end

10.times do |i|
  service_vendor = ServiceVendor.new
  service_vendor.vendor = Vendor.all.sample
  service_vendor.service = Service.all.sample
  service_vendor.save
end

20.times do |i|
  post = Post.new(title:Service.all.sample.name, description:Faker::Pokemon.name, min_price:Faker::Number.decimal(2), max_price:Faker::Number.decimal(2))
  User.all.sample << post
  Service.all.sample << post
end

20.times do |i|
  response = Response.new(description:Faker::Pokemon.name, price_quote:Faker::Number.decimal(2))
  Post.all.sample << response
  Vendor.all.sample << response
end

20.times do |i|
  review = Review.new(description:Faker::Friends.quote, score:Faker::Number.between(0,10))
  User.all.sample << review
  Vendor.all.sample << review
end
