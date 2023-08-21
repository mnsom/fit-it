User.destroy_all
Item.destroy_all

require "open-uri"

oscar = User.create!(email: "oscar@me.com", password: "secret", name: "Oscar")
minori = User.create!(email: "minori@me.com", password: "secret")


item1 = Item.create!(title: "table", d_length: 50, d_width: 90)
item1.photo.attach(io: File.open("app/assets/images/seed_item_pic/Table-icon-1.svg"),
                    filename: "Table-icon-1.svg",
                    content_type: 'image/svg')


item2 = Item.create!(title: "chair", d_length: 50, d_width: 50)
item2.photo.attach(io: File.open("app/assets/images/seed_item_pic/Chair-icon-1.svg"),
                    filename: "Chair-icon-1.svg",
                    content_type: 'image/svg')

item3 = Item.create!(title: "fridge", d_length: 60, d_width: 60)
item3.photo.attach(io: File.open("app/assets/images/seed_item_pic/Fridge-icon-1.svg"),
                    filename: "Fridge-icon-1.svg",
                    content_type: 'image/svg')

item4 = Item.create!(title: "bed", d_length: 200, d_width: 100)
item4.photo.attach(io: File.open("app/assets/images/seed_item_pic/Bed-icon-1.svg"),
                    filename: "Bed-icon-1.svg",
                    content_type: 'image/svg')

layout1 = Layout.create!(title: "Meguro", scale_ratio: 1.5, user: oscar)
layout1.photo.attach(io: File.open("app/assets/images/seed_item_pic/Meguro.jpg"),
                    filename: "Meguro.jpg",
                    content_type: 'image/jpg')
