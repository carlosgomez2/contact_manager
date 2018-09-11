Contact.destroy_all
Group.destroy_all
User.destroy_all

carlos = User.create(name: 'carlos gomez', email: 'carlos@gmail.com', password: 'password', password_confirmation: 'password')
jonh = User.create(name: 'jonh doe', email: 'jonhjonhz@gmail.com', password: 'password', password_confirmation: 'password')

puts '2 users has been created'

jonh_group_ids = []
carlos_group_ids = []

carlos_group_ids << Group.create(name: 'Client', user_id: carlos.id).id
carlos_group_ids << Group.create(name: 'Company', user_id: carlos.id).id
carlos_group_ids << Group.create(name: 'Employee', user_id: carlos.id).id

jonh_group_ids << Group.create(name: 'Family', user_id: jonh.id).id
jonh_group_ids << Group.create(name: 'Friend', user_id: jonh.id).id
jonh_group_ids << Group.create(name: 'School', user_id: jonh.id).id

puts "#{jonh_group_ids.count + carlos_group_ids.count} groups has been created"

19.times do
  Contact.create(
    name: Faker::Name.name,
    company: "#{Faker::Company.name} #{Faker::Company.suffix}",
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    group_id: carlos_group_ids[SecureRandom.random_number(0..(carlos_group_ids.count - 1))],
    user_id: carlos.id
  )
end

19.times do
  Contact.create(
    name: Faker::Name.name,
    company: "#{Faker::Company.name} #{Faker::Company.suffix}",
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    group_id: jonh_group_ids[SecureRandom.random_number(0..(jonh_group_ids.count - 1))],
    user_id: jonh.id
  )
end

puts "#{Contact.count} Contacts has been created"
