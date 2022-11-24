require 'faker'
require "open-uri"

Offer.destroy_all
Job.destroy_all
User.destroy_all

fran = User.new({ name: "John", email: "john@gmail.com", password: "123456" })
file = URI.open("https://avatars.githubusercontent.com/u/104527931?v=4")
fran.photo.attach(io: file, filename: "fran.jpg", content_type: "image/jpg")
fran.save!

vito = User.new({ name: "Paul", email: "p@gmail.com", password: "123456" })
file = URI.open("https://avatars.githubusercontent.com/u/62178588?v=4")
vito.photo.attach(io: file, filename: "vito.jpg", content_type: "image/jpg")
vito.save!

sil = User.create!({ name: "Jim", email: "jim@gmail.com", password: "123456" })


cities = %i[Paris London Berlin Madrid Barcelona]

user = User.first.id

10.times do
  Job.create!({ description: Faker::Company.bs,
                name: Faker::Construction.subcontract_category,
                user_id: user,
                address: cities.sample,
                deadline: Faker::Date.forward(days: rand(20..200)),
                price: rand(100...1000).to_i })
  sleep(1.5)
end
user = User.second.id
job = Job.first.id
2.times do
  Offer.create!({ comment: Faker::Company.bs,
                  bid: rand(100...1000).to_i,
                  user_id: user,
                  job_id: job })
end
