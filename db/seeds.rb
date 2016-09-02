# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)


User.destroy_all
one = User.create!(password: "123456", password_confirmation: "123456", email: "elie@mail.com", first_name: "Elie", last_name: "Haddad")
two = User.create!(password: "123456", password_confirmation: "123456", email: "laura@mail.com", first_name: "Laura", last_name: "Khoury")

ParkingSpot.destroy_all
hamra = ParkingSpot.create!(latitude: 33.897749, longitude: 35.480433, street_address: 'Hamra Street ', city:"Beirut", number_of_spots: 2, description: "Awesome Parking space with security", user_id: User.last.id, country: "Lebanon", price: 30)
spears = ParkingSpot.create!(latitude: 33.894044, longitude: 35.492792, street_address: 'Spears Street ', city:"Beirut", number_of_spots: 1, description: "Alleway useful for small car", user_id: User.last.id, country: "Lebanon", price: 30)
gemayzeh = ParkingSpot.create!(latitude: 33.894977, longitude: 35.513896, street_address: 'Gemmayzeh Street ', city:"Beirut", number_of_spots: 3, description: "Big garage with 3 spaces", user_id: User.last.id, country: "Lebanon", price: 30)
gemayzeh2 = ParkingSpot.create!(latitude: 33.894959, longitude: 35.513896, street_address: 'Gemmayzeh Street ', city:"Beirut", number_of_spots: 1, description: "Awesome Parking space with security", user_id: User.last.id, country: "Lebanon", price: 30)
sassine = ParkingSpot.create!(latitude: 33.887621, longitude: 35.520376, street_address: 'Sassine place ', city:"Beirut", number_of_spots: 1, description: "Alleway useful for small car", user_id: User.last.id, country: "Lebanon", price: 30)
sodeco = ParkingSpot.create!(latitude: 33.886463, longitude: 35.508209, street_address: 'Sodeco Square Street ', city:"Beirut", number_of_spots: 2, description: "Big garage with 3 spaces", user_id: User.last.id, country: "Lebanon", price: 30)
manara = ParkingSpot.create!(latitude: 33.892562, longitude: 35.474982, street_address: 'Manara ', city:"Beirut", number_of_spots: 2, description: "Renting the place in front of my parking", user_id: User.last.id, country: "Lebanon", price: 30)
raouche = ParkingSpot.create!(latitude: 33.887574, longitude: 35.475755, street_address: 'Raouche ', city:"Beirut", number_of_spots: 2, description: "Awesome Parking space with security", user_id: User.last.id, country: "Lebanon", price: 30)
zb = ParkingSpot.create!(latitude: 33.900969, longitude: 35.497985, street_address: 'Zeytuna Bay ', city:"Beirut", number_of_spots: 2, description: "Renting the place in front of my parking", user_id: User.last.id, country: "Lebanon", price: 30)
antelias = ParkingSpot.create!(latitude: 33.913648, longitude: 35.564075, street_address: 'Antelias ', city:"Antelias", number_of_spots: 1, description: "Awesome Parking space with security", user_id: User.last.id, country: "Lebanon", price: 30)
fanar = ParkingSpot.create!(latitude: 33.880734, longitude: 35.576777, street_address: 'Fanar ', city:"Fanar", number_of_spots: 2, description: "Big garage with 3 spaces", user_id: User.last.id, country: "Lebanon", price: 30)
dbayeh = ParkingSpot.create!(latitude: 33.93416, longitude: 35.590425, street_address: 'Dbayeh Water front ', city:"Dbayeh", number_of_spots: 3, description: "Awesome Parking space with security", user_id: User.last.id, country: "Lebanon", price: 30)
dbayeh2 = ParkingSpot.create!(latitude: 33.936367, longitude: 35.593858, street_address: 'Dbayeh closed to Water front  ', city:"Dbayeh", number_of_spots: 1, description: "Big garage with 3 spaces", user_id: User.last.id, country: "Lebanon", price: 30)
kaslik = ParkingSpot.create!(latitude: 33.981004, longitude: 35.61832, street_address: 'Kaslik ', city:"Jounieh", number_of_spots: 2, description: "Awesome Parking space with security", user_id: User.last.id, country: "Lebanon", price: 30)
byblos = ParkingSpot.create!(latitude: 34.122875, longitude: 35.644584, street_address: 'Old port byblos ', city:"Jbeil", number_of_spots: 2, description: "Awesome Parking space with security", user_id: User.last.id, country: "Lebanon", price: 30)
byblos = ParkingSpot.create!(latitude: 34.120389, longitude: 35.648189, street_address: 'Jbeil main street ', city:"Jbeil", number_of_spots: 5, description: "Big garage with 3 spaces", user_id: User.last.id, country: "Lebanon", price: 30)

Booking.destroy_all
one = Booking.create!(start_at: '01/01/2016', end_at: '03/01/2016', status: "paid", parking_spot: ParkingSpot.all.sample , user_id: User.first.id, total_price: 30)
one = Booking.create!(start_at: '09/01/2016', end_at: '10/01/2016', status: "paid", parking_spot: ParkingSpot.all.sample, user_id: User.first.id, total_price: 30)
one = Booking.create!(start_at: '11/09/2016', end_at: '15/01/2016', status: "paid", parking_spot: ParkingSpot.all.sample, user_id: User.first.id, total_price: 30)
one = Booking.create!(start_at: '11/02/2016', end_at: '12/03/2016', status: "paid", parking_spot: ParkingSpot.all.sample, user_id: User.first.id, total_price: 30)
one = Booking.create!(start_at: '12/08/2016', end_at: '12/02/2016', status: "paid", parking_spot: ParkingSpot.all.sample, user_id: User.first.id, total_price: 30)
one = Booking.create!(start_at: '08/01/2017', end_at: '09/01/2017', status: "pending", parking_spot: ParkingSpot.all.sample, user_id: User.first.id, total_price: 30)
one = Booking.create!(start_at: '09/01/2017', end_at: '10/01/2017', status: "pending", parking_spot: ParkingSpot.all.sample, user_id: User.first.id, total_price: 30)
one = Booking.create!(start_at: '10/01/2017', end_at: '12/01/2017', status: "pending", parking_spot: ParkingSpot.all.sample, user_id: User.first.id, total_price: 30)

