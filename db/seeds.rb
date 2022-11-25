require 'faker'
require "open-uri"

Offer.destroy_all
Job.destroy_all
User.destroy_all

fran = User.new({ name: "Fran", email: "fran@gmail.com", password: "123456" })
file = URI.open("https://avatars.githubusercontent.com/u/104527931?v=4")
fran.photo.attach(io: file, filename: "fran.jpg", content_type: "image/jpg")
fran.save!

vito = User.new({ name: "Vito", email: "vito@gmail.com", password: "123456" })
file = URI.open("https://avatars.githubusercontent.com/u/62178588?v=4")
vito.photo.attach(io: file, filename: "vito.jpg", content_type: "image/jpg")
vito.save!

jorrit = User.create!({ name: "Jorrit", email: "jorrit@gmail.com", password: "123456" })
file = URI.open("https://avatars.githubusercontent.com/u/101260772?v=4")
jorrit.photo.attach(io: file, filename: "jorrit.jpg", content_type: "image/jpg")
jorrit.save!

leo = User.create!({ name: "Leo", email: "leo@gmail.com", password: "123456" })
file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1666021133/yxhif62kivyl2678wt3z.jpg")
leo.photo.attach(io: file, filename: "leo.jpg", content_type: "image/jpg")
leo.save!

ganzo = User.create!({ name: "Ganzo", email: "ganzo@gmail.com", password: "123456" })
file = URI.open("https://avatars.githubusercontent.com/u/90385363?v=4")
ganzo.photo.attach(io: file, filename: "ganzo.jpg", content_type: "image/jpg")
ganzo.save!

arthur = User.create!({ name: "Arthur", email: "arthur@gmail.com", password: "123456" })
file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1666021133/yxhif62kivyl2678wt3z.jpg")
arthur.photo.attach(io: file, filename: "arthur.jpg", content_type: "image/jpg")
arthur.save!

Job.create!({ name: "Painting",
              description: "I need someone to paint my house",
              deadline: "2023-07-01",
              address: "Infantas 19, Madrid",
              user_id: vito.id,
              price: 300 })
sleep(1.2)

Job.create!({ name: "Bottle opener",
              description: "I need someone to open my bottle",
              deadline: "2023-07-01",
              address: "Rome, Italy",
              user_id: leo.id,
              price: 500 })
sleep(1.2)
Job.create!({ name: "Nail Art",
              description: "I need someone to paint my nails",
              deadline: "2023-02-04",
              address: "Gran via, Madrid",
              user_id: ganzo.id,
              price: 200 })
sleep(1.2)
Job.create!({ name: "Food stirrer",
              description: "I need someone to stir my food",
              deadline: "2023-09-11",
              address: "Paris, France",
              user_id: leo.id,
              price: 200 })
sleep(1.2)
Job.create!({ name: "Socks installation",
              description: "I need someone to help me put on my socks",
              deadline: "2023-03-12",
              address: "Munich, Germany",
              user_id: arthur.id,
              price: 4000 })
sleep(1.2)
Job.create!({ name: "Egg juggler",
              description: "I need someone to juggle my eggs",
              deadline: "2023-07-01",
              address: "Patras, Greece",
              user_id: leo.id,
              price: 5 })
sleep(1.2)
Job.create!({ name: "Fart Odor Judge",
              description: "I think my farts smell funny, and I need someone to tell me why",
              deadline: "2023-07-01",
              address: "Berlin, Germany",
              user_id: arthur.id,
              price: 3000 })
sleep(1.2)
Job.create!({ name: "Chick sexer",
              description: "Someone that can determine the sex of my chickens",
              deadline: "2023-02-01",
              address: "Damrak 66, Amsterdam",
              user_id: jorrit.id,
              price: 100 })
sleep(1.2)
Job.create!({ name: "Cow hunter",
              description: "I need someone that can hunt cows",
              deadline: "2023-08-01",
              address: "Ktena 1, Athens, Greece",
              user_id: leo.id,
              price: 300 })
sleep(1.2)

Job.create!({ name: "Need a teacher",
              description: "I need someone to teach me how to do a live code",
              deadline: "2023-07-01",
              address: "Doctor esquerdo 70, Madrid",
              user_id: ganzo.id,
              price: 500 })

job = Job.last

Offer.create!({ comment: "I can do it!!",
                bid: 600,
                user_id: jorrit.id,
                job_id: job.id })
Offer.create!({ comment: "Easy Peasy",
                bid: 400,
                user_id: leo.id,
                job_id: job.id })
Offer.create!({ comment: "Easy money, I'm in",
                bid: 650,
                user_id: arthur.id,
                job_id: job.id })
Offer.create!({ comment: "Sounds like an impossible task",
                bid: 1000,
                user_id: vito.id,
                job_id: job.id })
