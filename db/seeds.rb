puts 'Clear DB..'

Mushroom.destroy_all
User.destroy_all

puts 'Create data...'
greedy = User.create!(name: "Greedy", email: "greedy@smufrs.com", password: "12345678", avatar: "smurf.png")
grand = User.create!(name: "Grand", email: "grand@smufrs.com", password: "12345678", avatar: "smurf.png")
puts "Done user"

puts 'Create data...'
name = ['Weird', 'Amazing', 'Awesome', 'Dark', 'Death']
category = ['chapeau', 'boule', 'etoile']
color = ['rouge', 'marron', 'bleu', 'violet']
price = [*(10..100)]

5.times do
  mushroom = Mushroom.new(
    name: name.sample,
    category: category.sample,
    color: color.sample,
    price: price.sample,
    user_id: greedy.id,
    photo_url: "champignon.jpg",
    address: "Champignon derrière le menhir",
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
  )
  mushroom.save!
end

puts 'Done pour Mushroom!'
