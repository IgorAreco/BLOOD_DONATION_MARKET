Blood.destroy_all
User.destroy_all
user3 = User.create!(name: 'Namaria', email: 'namaria@aa', password: 1222222, blood_type: 'A+', age: 18, hepatitis: false, HIV: false)
user4 = User.create!(name: 'Julia', email: 'julia@aa', password: 1222222, blood_type: 'O-', age: 21, hepatitis: false, HIV: false)
user5 = User.create!(name: 'Amanda', email: 'amanda@aa', password: 1222222, blood_type: 'B-', age: 30, hepatitis: false, HIV: false)
user6 = User.create!(name: 'Padino', email: 'igor@aa', password: 1222222, blood_type: 'O-', age: 15, hepatitis: false, HIV: false)
user7 = User.create!(name: 'José', email: 'jose@aa', password: 1222222, blood_type: 'B+', age: 45, hepatitis: false, HIV: false)
user8 = User.create!(name: 'Jão', email: 'jao@aa', password: 1222222, blood_type: 'O-', age: 35, hepatitis: false, HIV: false)
user9 = User.create!(name: 'Maria', email: 'maria@aa', password: 1222222, blood_type: 'AB+', age: 29, hepatitis: false, HIV: false)
user10 = User.create!(name: 'Carlos', email: 'carlin@aa', password: 1222222, blood_type: 'A+', age: 25, hepatitis: false, HIV: false)
user11 = User.create!(name: 'Vitor', email: 'doidao7@aa', password: 1222222, blood_type: 'B-', age: 28, hepatitis: false, HIV: false)

Blood.create!(user: user3, quantity: 250, location: 'Belo Horizonte')
Blood.create!(user: user4, quantity: 250, location: 'Rio de Janeiro')
Blood.create!(user: user5, quantity: 350, location: 'Rio de Janeiro')
Blood.create!(user: user6, quantity: 250, location: 'São Paulo')
Blood.create!(user: user3, quantity: 450, location: 'Belo Horizonte')
Blood.create!(user: user8, quantity: 250, location: 'Rio de Janeiro')
Blood.create!(user: user3, quantity: 250, location: 'Belo Horizonte')
Blood.create!(user: user10, quantity: 350, location: 'Rio de Janeiro')
Blood.create!(user: user11, quantity: 450, location: 'São Paulo')

puts "#{User.count} Users created"
puts "#{Blood.count} Bloods created"


puts "seeds done"
