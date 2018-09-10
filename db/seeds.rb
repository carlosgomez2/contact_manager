Contact.destroy_all
Group.destroy_all
User.destroy_all

users_ids = []
users_ids << User.create(name: "carlos gomez", email: "carlos@gmail.com", password: "password", password_confirmation: "password").id
users_ids << User.create(name: "jonh doe", email: "jonhjonhz@gmail.com", password: "password", password_confirmation: "password").id

puts "#{users_ids.count} users has been created"

group_ids = []

group_ids << Group.create(name: "Client", user_id: users_ids[1]).id
group_ids << Group.create(name: "Company", user_id: users_ids[1]).id
group_ids << Group.create(name: "Family", user_id: users_ids[0]).id
group_ids << Group.create(name: "Friend", user_id: users_ids[0]).id


puts "#{group_ids.count} groups has been created"

19.times do
  Contact.create(
    name: Faker::Name.name,
    company: "#{Faker::Company.name} #{Faker::Company.suffix}",
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    group_id: group_ids[SecureRandom.random_number(0..(group_ids.count - 1))],
    user_id: users_ids[SecureRandom.random_number(0..(users_ids.count - 1))]
  )
end

puts "#{Contact.count} Contacts has been created"