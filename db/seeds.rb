Item.destroy_all
User.destroy_all
Icon.destroy_all

require "open-uri"

puts "Creating s..."

oscar = User.create!(email: "oscar@me.com", password: "secret", name: "Oscar")
oscar.photo.attach(io: File.open("app/assets/images/seed_item_pic/oscar.png"),
                    filename: "oscar.png",
                    content_type: 'image/png')

minori = User.create!(email: "minori@me.com", password: "secret")
minori.photo.attach(io: File.open("app/assets/images/seed_item_pic/minori.png"),
                    filename: "minori.png",
                    content_type: 'image/png')

                    puts "creating icons"

table = Icon.create!(name: "Table")
table.photo.attach(io: File.open("app/assets/images/seed_item_pic/table.svg"),
                    filename: "table.svg",
                    content_type: 'image/svg')
                    puts "icon created"
                    puts "creating table..."
Item.create!(title: "table", d_length: 50, d_width: 90, icon: table)

puts "table created"
chair1 = Icon.create!(name: "Chair1")
chair1.photo.attach(io: File.open("app/assets/images/seed_item_pic/Chair1.svg"),
                    filename: "Chair1.svg",
                    content_type: 'image/svg')
Item.create!(title: "chair", d_length: 50, d_width: 50, icon: chair1)

fridge = Icon.create!(name: "Fridge")
fridge.photo.attach(io: File.open("app/assets/images/seed_item_pic/Fridge.svg"),
                    filename: "Fridge.svg",
                    content_type: 'image/svg')
Item.create!(title: "fridge", d_length: 60, d_width: 60, icon: fridge)

single_bed = Icon.create!(name: "Single bed")
single_bed.photo.attach(io: File.open("app/assets/images/seed_item_pic/Single-bed.svg"),
                    filename: "Single-bed.svg",
                    content_type: 'image/svg')
Item.create!(title: "bed", d_length: 200, d_width: 100, icon: single_bed)

double_bed = Icon.create!(name: "Double bed")
double_bed.photo.attach(io: File.open("app/assets/images/seed_item_pic/Double-bed.svg"),
                    filename: "Double-bed.svg",
                    content_type: 'image/svg')

round_table = Icon.create!(name: "Round table")
round_table.photo.attach(io: File.open("app/assets/images/seed_item_pic/Round-table.svg"),
                    filename: "Round-table.svg",
                    content_type: 'image/svg')

coffee_table = Icon.create!(name: "Coffee table")
coffee_table.photo.attach(io: File.open("app/assets/images/seed_item_pic/Coffee-table.svg"),
                    filename: "Coffee-table.svg",
                    content_type: 'image/svg')

kotatsu = Icon.create!(name: "Kotatsu")
kotatsu.photo.attach(io: File.open("app/assets/images/seed_item_pic/Kotatsu.svg"),
                    filename: "Kotatsu.svg",
                    content_type: 'image/svg')

plant1 = Icon.create!(name: "Plant1")
plant1.photo.attach(io: File.open("app/assets/images/seed_item_pic/Plant1.svg"),
                    filename: "Plant1.svg",
                    content_type: 'image/svg')

plant2 = Icon.create!(name: "Plant2")
plant2.photo.attach(io: File.open("app/assets/images/seed_item_pic/Plant2.svg"),
                    filename: "Plant2.svg",
                    content_type: 'image/svg')

tv = Icon.create!(name: "TV")
tv.photo.attach(io: File.open("app/assets/images/seed_item_pic/TV.svg"),
                    filename: "TV.svg",
                    content_type: 'image/svg')

book_shelf = Icon.create!(name: "Book shelf")
book_shelf.photo.attach(io: File.open("app/assets/images/seed_item_pic/Book-shelf.svg"),
                    filename: "Book-shelf.svg",
                    content_type: 'image/svg')

chair2 = Icon.create!(name: "Chair2")
chair2.photo.attach(io: File.open("app/assets/images/seed_item_pic/Chair2.svg"),
                    filename: "Chair2.svg",
                    content_type: 'image/svg')

pet_sofa = Icon.create!(name: "Pet sofa")
pet_sofa.photo.attach(io: File.open("app/assets/images/seed_item_pic/Pet-sofa.svg"),
                    filename: "Pet-sofa.svg",
                    content_type: 'image/svg')

cat_tower = Icon.create!(name: "Cat tower")
cat_tower.photo.attach(io: File.open("app/assets/images/seed_item_pic/Cat-tower.svg"),
                    filename: "Cat-tower.svg",
                    content_type: 'image/svg')

round_trash_can = Icon.create!(name: "Trash can")
round_trash_can.photo.attach(io: File.open("app/assets/images/seed_item_pic/Round-trashcan.svg"),
                    filename: "Round-trashcan.svg",
                    content_type: 'image/svg')

mirror = Icon.create!(name: "Mirror")
mirror.photo.attach(io: File.open("app/assets/images/seed_item_pic/Mirror.svg"),
                    filename: "Mirror.svg",
                    content_type: 'image/svg')

light = Icon.create!(name: "Light")
light.photo.attach(io: File.open("app/assets/images/seed_item_pic/Light.svg"),
                    filename: "Light.svg",
                    content_type: 'image/svg')

square_trash_can = Icon.create!(name: "Square trash can")
square_trash_can.photo.attach(io: File.open("app/assets/images/seed_item_pic/Square-trashcan.svg"),
                    filename: "Square-trashcan.svg",
                    content_type: 'image/svg')

storage_box = Icon.create!(name: "Storage box")
storage_box.photo.attach(io: File.open("app/assets/images/seed_item_pic/Storagebox.svg"),
                    filename: "Storagebox.svg",
                    content_type: 'image/svg')

microwave = Icon.create!(name: "Microwave")
microwave.photo.attach(io: File.open("app/assets/images/seed_item_pic/Microwave.svg"),
                    filename: "Microwave.svg",
                    content_type: 'image/svg')

work_desk = Icon.create!(name: "Work_desk")
work_desk.photo.attach(io: File.open("app/assets/images/seed_item_pic/Work-desk.svg"),
                    filename: "Work-desk.svg",
                    content_type: 'image/svg')

rug = Icon.create!(name: "Rug")
rug.photo.attach(io: File.open("app/assets/images/seed_item_pic/Rug.svg"),
                    filename: "Rug.svg",
                    content_type: 'image/svg')

shelf = Icon.create!(name: "Shelf")
shelf.photo.attach(io: File.open("app/assets/images/seed_item_pic/Shelf.svg"),
                    filename: "Shelf.svg",
                    content_type: 'image/svg')

work_chair = Icon.create!(name: "Work chair")
work_chair.photo.attach(io: File.open("app/assets/images/seed_item_pic/Work-chair.svg"),
                    filename: "Work-chair.svg",
                    content_type: 'image/svg')

yogibo = Icon.create!(name: "Yogibo")
yogibo.photo.attach(io: File.open("app/assets/images/seed_item_pic/Yogibo.svg"),
                    filename: "Yogibo.svg",
                    content_type: 'image/svg')

single_sofa = Icon.create!(name: "Single sofa")
single_sofa.photo.attach(io: File.open("app/assets/images/seed_item_pic/Single-sofa.svg"),
                    filename: "Single-sofa.svg",
                    content_type: 'image/svg')

sofa = Icon.create!(name: "Sofa")
sofa.photo.attach(io: File.open("app/assets/images/seed_item_pic/Sofa.svg"),
                    filename: "Sofa.svg",
                    content_type: 'image/svg')

layout1 = Layout.create!(title: "Meguro", scale_ratio: 1.5, user: oscar)
layout1.photo.attach(io: File.open("app/assets/images/seed_item_pic/Meguro.jpg"),
                    filename: "Meguro.jpg",
                    content_type: 'image/jpg')


puts "Created #{User.count} users, #{Icon.count} icons,  #{Item.count} items, and #{Layout.count} layouts :)"
