User.destroy_all
Item.destroy_all
Icon.destroy_all

require "open-uri"

puts "Creating seeds..."

oscar = User.create!(email: "oscar@me.com", password: "secret", name: "Oscar")
oscar.photo.attach(io: File.open("app/assets/images/seed_item_pic/oscar.png"),
                    filename: "oscar.png",
                    content_type: 'image/png')

minori = User.create!(email: "minori@me.com", password: "secret")
minori.photo.attach(io: File.open("app/assets/images/seed_item_pic/minori.png"),
                    filename: "minori.png",
                    content_type: 'image/png')


table = Icon.create!(name: "Table")
table.photo.attach(io: File.open("app/assets/images/seed_item_pic/Table-icon-1.svg"),
                    filename: "Table-icon-1.svg",
                    content_type: 'image/svg')
Item.create!(title: "table", d_length: 50, d_width: 90, icon: table)

chair = Icon.create!(name: "Chair")
chair.photo.attach(io: File.open("app/assets/images/seed_item_pic/Chair-icon-1.svg"),
                    filename: "Chair-icon-1.svg",
                    content_type: 'image/svg')
Item.create!(title: "chair", d_length: 50, d_width: 50, icon: chair)

fridge = Icon.create!(name: "Fridge")
fridge.photo.attach(io: File.open("app/assets/images/seed_item_pic/Fridge-icon-1.svg"),
                    filename: "Fridge-icon-1.svg",
                    content_type: 'image/svg')
Item.create!(title: "fridge", d_length: 60, d_width: 60, icon: fridge)

bed = Icon.create!(name: "Bed")
bed.photo.attach(io: File.open("app/assets/images/seed_item_pic/Bed-icon-1.svg"),
                    filename: "Bed-icon-1.svg",
                    content_type: 'image/svg')
Item.create!(title: "bed", d_length: 200, d_width: 100, icon: bed)

layout1 = Layout.create!(title: "Meguro", scale_ratio: 1.5, user: oscar)
layout1.photo.attach(io: File.open("app/assets/images/seed_item_pic/Meguro.jpg"),
                    filename: "Meguro.jpg",
                    content_type: 'image/jpg')

puts "Created #{User.count} users, #{Icon.count} icons,  #{Item.count} items, and #{Layout.count} layouts :)"
