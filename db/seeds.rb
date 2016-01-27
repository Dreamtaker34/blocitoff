include Faker

4.times do
  User.create!(
  username: Faker::Internet.user_name,
  email: Faker::Internet.safe_email,
  password: Faker::Internet.password,
  )
end

User.create!(
  username: "test",
  email: "test@example.com",
  password: "helloworld"
  )


users = User.all

puts "#{users.sample[:id]}"

100.times do
  item = Item.create!(
    name: Faker::Lorem.sentence(4),
    user_id: users.sample[:id],
  )

  item.update_attribute(:created_at, rand(1.days .. 8.days).ago)


end
items = Item.all

@user = users.sample

puts "Created #{User.count} users."
puts "Created #{Item.count} To-Do's."
puts "#{@user.username} has to do #{@user.items.first.name}"
