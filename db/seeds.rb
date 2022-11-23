require 'faker'
Job.destroy_all
User.destroy_all

User.create!({ name: "John", email: "john@gmail.com", password: "123456" })
User.create!({ name: "Paul", email: "p@gmail.com", password: "123456" })
User.create!({ name: "Jim", email: "jim@gmail.com", password: "123456" })

user = User.first.id

10.times do
  Job.create!({ description: Faker::Company.bs,
                name: Faker::Construction.subcontract_category,
                user_id: user,
                address: Faker::Address.full_address,
                deadline: Faker::Date.forward(days: rand(20..200)),
                price: rand(100...1000).to_i })
end
