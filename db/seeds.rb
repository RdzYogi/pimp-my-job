require 'faker'
Job.destroy_all
User.destroy_all

User.create!({ name: "John", email: "john@gmail.com", password: "123456" })
User.create!({ name: "Paul", email: "paul@gmail.com", password: "123456" })
User.create!({ name: "Jim", email: "jim@gmail.com", password: "123456" })


user = User.first.id

10.times do
  Job.create!({ description: Faker::Company.bs, user_id: user, price: rand(100...1000).to_i })
end
