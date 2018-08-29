Contact.destroy_all
Group.destroy_all

group_ids = []

group_ids << Group.create(name: "Client").id
group_ids << Group.create(name: "Family").id
group_ids << Group.create(name: "Friend").id

puts "#{group_ids.count} groups has been created"

20.times do
  Contact.create(
    name: Faker::Name.name,
    company: "#{Faker::Company.name} #{Faker::Company.suffix}",
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    group_id: group_ids[SecureRandom.random_number(0..(group_ids.count - 1))]
  )
end

puts "#{Contact.count} Contacts has been created"