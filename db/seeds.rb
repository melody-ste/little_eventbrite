puts "Nettoyage de la base de données..."
Attendance.destroy_all
Event.destroy_all
User.destroy_all

10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    email:      Faker::Internet.email(domain: 'yopmail.com'),
    encrypted_password: "fake_password", 
    description: Faker::Lorem.paragraph(sentence_count: 3)
  )
end

puts "Utilisateurs créés avec succès."

users = User.all

10.times do
  Event.create!(
    start_date: Faker::Time.forward(days: rand(1..30), period: :evening),
    duration: [30, 60, 90, 120].sample,
    title: Faker::Lorem.sentence(word_count: rand(2..6)),
    description: Faker::Lorem.paragraph_by_chars(number: rand(100..300)),
    price: rand(1..1000),
    location: Faker::Address.city,
    admin: users.sample
  )
end

puts "Événements créés avec succès."