require 'faker'

names = ['Carl', 'Wright', 'Audrey', 'Cameron', 'Trevor',	'Burgess', 'Wanda',	'Edmunds', 'Carol',	'Henderson', 'Michael',	'King', 'Warren', 'Burgess' 'Brandon', 'Berry', 'Adam',	'Short', 'Heather',	'Clarkson', 'Samantha',	'Churchill']
cities = [{city: 'Mesa', state: 'Arizona'},{city: 'Anaheim', state: 'California'},{city: 'Atlanta', state: 'Georgia'},{city: 'Reno', state: 'Nevada'},{city: 'Toledo', state: 'Ohio'}]
avatars = Unsplash::Photo.search('face', 1, 100)

# SEEDING Users
puts "Creating Admin User"
u_admin = User.create(
                username:   'admin', 
                email:      'admin@email.com',
                first_name: 'Administrator',
                last_name:  'Site',
                address:    '123 Street Av.',
                city:       'Salt Lake City',
                state:      'UT',
                zipcode:    '84010',
                phone:      '801 150-090',
                admin:      true,
                password:   '123456',
    password_confirmation:  '123456',
)
puts "Creating Tester User"
u_tester = User.create(
    username:   'tester', 
    email:      'tester@email.com',
    first_name: 'Tester',
    last_name:  'Site Tester',
    address:    '123 Street Av.',
    city:       'Salt Lake City',
    state:      'UT',
    zipcode:    '84010',
    phone:      '801 150-090',
    admin:      true,
    password:   '123456',
password_confirmation:  '123456'
)
u_admin_image = URI.parse(avatars.sample.urls.regular).open
u_tester_image = URI.parse(avatars.sample.urls.regular).open
u_admin.avatar.attach(io: u_admin_image, filename: "avatar.jpg")
u_tester.avatar.attach(io: u_tester_image, filename: "avatar.jpg")

puts "Creating Users"
10.times do |i|
    name = names.sample
    last_name = names.sample
    email = "#{name}.#{last_name}@email.com"
    city = cities.sample
    image = URI.parse(avatars.sample.urls.regular).open

    print "User(#{i}): #{name} #{last_name} - #{email}".ljust(80) + "\r"
    $stdout.flush
    
    user = User.create(
        username:   "#{name}.#{last_name}#{rand(10..99)}",
        email:      email,
        first_name: name,
        last_name:  last_name,
        address:    Faker::Address.street_address ,
        city:       city[:city],
        state:      city[:state],
        zipcode:    Faker::Address.zip_code,
        phone:      Faker::PhoneNumber.cell_phone ,
        admin:      false,
        password:   '123456',
    password_confirmation:  '123456',
    )

    user.avatar.attach(io: image, filename: "avatar.jpg")
end

puts "Users Done".ljust(80)