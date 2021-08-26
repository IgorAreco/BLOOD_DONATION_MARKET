
Donation.delete_all
Blood.destroy_all
User.destroy_all
user3 = User.create!(name: 'Namaria', email: 'namaria@bloodblood.com', password: 1222222, CPF: '15656489732', address: 'Rua Girassol, 396, São Paulo' )
user4 = User.create!(name: 'Julia', email: 'julia@bloodblood.com', password: 1222222, CPF: '65932565123', address: 'Rua Dr. José Paulo, 103'  )
user5 = User.create!(name: 'Amanda', email: 'amanda@bloodblood.com', password: 1222222, CPF: '65986574215', address: 'Avenida Brigadeiro Faria Lima, 3183, São Paulo' )
user6 = User.create!(name: 'Padino', email: 'igor@bloodblood.com', password: 1222222, CPF: '36985214710', address: 'Rua Fortunato, 133 - Vila Buarque, São Paulo - SP'  )
user7 = User.create!(name: 'José', email: 'jose@bloodblood.com', password: 1222222, CPF: '35795124862', address: 'Rua Gomes de Carvalho, 1705, São Paulo'  )
user8 = User.create!(name: 'Jão', email: 'jao@bloodblood.com', password: 1222222, CPF: '35986214512', address: 'Rua Harmonia, 77, São Paulo'  )
user9 = User.create!(name: 'Maria', email: 'maria@bloodblood.com', password: 1222222, CPF: '32475698421', address: 'Avenida Rebouças, 955, São Paulo'  )
user10 = User.create!(name: 'Carlos', email: 'carlin@bloodblood.com', password: 1222222, CPF: '32485326915', address: 'Avenida Presidente Juscelino Kubitschek, 1444, São Paulo'  )
user11 = User.create!(name: 'Vitor', email: 'doidao7@bloodblood.com', password: 1222222, CPF: '123456789999', address: 'Rua Dr. José Paulo, 103'  )


20.times do
  user = User.all.sample
  Blood.create!(user: user, address: user.address, blood_type: Blood::BLOOD_TYPE.sample)
end

User.create!(name: 'HOSPITAL ALVORADA SANTO AMARO', email: 'alvoradasantoamaro@bloodblood.com', password: 1222222, CNPJ: '123456657999', address: 'Rua Barão do Rio Branco, 555, Santo Amaro' )
User.create!(name: 'HOSPITAL ALVORADA MOEMA', email: 'alvoradamoema@bloodblood.com', password: 1222222, CNPJ: '654456657999', address: 'Avenida Ministro Gabriel Resende Passos, 550, São Paulo' )
User.create!(name: 'HOSPITAL ALVORADA CHÁCARA FLORA', email: 'chacaraflora@bloodblood.com', password: 1222222, CNPJ: '654356657999', address: 'Rua Guilherme Asbahr Neto, 438, São Paulo' )
User.create!(name: 'HOSPITAL SÃO PAULO', email: 'hospsp@bloodblood.com', password: 1222222, CNPJ: '654356657912', address: 'Rua Napoleão de Barros, 715, São Paulo' )
User.create!(name: 'HOSPITAL SÃO PEDRO', email: 'hospitalsp@bloodblood.com', password: 1222222, CNPJ: '654256657912', address: 'Rua Joaquim Marra, 138, São Paulo' )

hospitals = User.where.not(CNPJ: nil)

hospitals.each do |hospital|
  3.times do
    Blood.create!(user: hospital, address: hospital.address, blood_type: Blood::BLOOD_TYPE.sample, offer: false, available: true)
  end
end

10.times do
  blood = Blood.where(available: true, offer: true).sample
  Donation.create!(blood: blood, user: hospitals.sample)
  blood.update(available: false)
end

puts "#{User.count} Users created"
puts "#{Blood.count} Bloods created"

puts "seeds done"


