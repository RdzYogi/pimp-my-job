require 'faker'
Offer.destroy_all
Job.destroy_all
User.destroy_all

User.create!({ name: "John", email: "john@gmail.com", password: "123456" })
User.create!({ name: "Paul", email: "p@gmail.com", password: "123456" })
User.create!({ name: "Jim", email: "jim@gmail.com", password: "123456" })
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
