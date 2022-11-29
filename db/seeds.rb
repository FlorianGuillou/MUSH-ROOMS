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
    user_id: greedy.id
  )
  mushroom.save!
end

puts 'Done pour Mushroom!'
