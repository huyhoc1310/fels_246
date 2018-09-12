Language.create!(name: "English")
Category.create!(name: "Sexual", description: "lololol")
User.create! name: 'John Doe',
             email: 'admin1@gmail.com',
             password: '123456',
             password_confirmation: '123456',
             role: "admin",
             confirmed_at: Time.now
