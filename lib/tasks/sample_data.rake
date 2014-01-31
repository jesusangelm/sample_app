namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Jesus Marin",
                 email: "jam@jam.net.ve",
                password: "foopass",
                password_confirmation: "foopass")
    admin.toggle!(:admin)
    99.times do |n|
      name = Faker::Name.name
      email = "Ejemplo-#{n+1}@jam.net.ve"
      password = "password"
      User.create!(name: name,
                  email: email,
                  password: password,
                  password_confirmation: password)
    end
    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content)}
    end
  end
end
