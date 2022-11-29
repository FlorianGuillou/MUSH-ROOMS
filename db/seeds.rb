puts 'Clear DB..'

Mushroom.destroy_all

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
    price: price.sample
  )
  mushroom.save!
end

puts 'Done!'

# seed users

User.destroy_all
puts 'Create data...'
User.create!(name: "Greedy", email: "greedy@smufrs.com", password: "12345678")
