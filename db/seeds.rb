# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


beirut = ParkingSpot.create(street_address: 'Hamra street lebanon', city:"beirut", number_of_spots: 2, description: "test", user_id: 3, country: "lebanon", price_cents: 3000)
paris = ParkingSpot.create(street_address: 'badaro street lebanon', city:"beirut", number_of_spots: 2, description: "test", user_id: 3, country: "lebanon", price_cents: 3000)
amsterdam = ParkingSpot.create(street_address: 'fanar lebanon', city:"beirut", number_of_spots: 2, description: "test", user_id: 3, country: "lebanon", price_cents: 3000)
berlin = ParkingSpot.create(street_address: 'jounieh lebanon', city:"beirut", number_of_spots: 2, description: "test", user_id: 3, country: "lebanon", price_cents: 3000)
london = ParkingSpot.create(street_address: 'byblos lebanon', city:"beirut", number_of_spots: 2, description: "test", user_id: 3, country: "lebanon", price_cents: 3000)
ny = ParkingSpot.create(street_address: 'bliss street lebanon', city:"beirut", number_of_spots: 2, description: "test", user_id: 3, country: "lebanon", price_cents: 3000)
singap = ParkingSpot.create(street_address: 'armenia street beirut lebanon', city:"beirut", number_of_spots: 2, description: "test", user_id: 3, country: "lebanon", price_cents: 3000)
brest = ParkingSpot.create(street_address: 'gouraud street beirut lebanon', city:"beirut", number_of_spots: 2, description: "test", user_id: 3, country: "lebanon", price_cents: 3000)
lemans = ParkingSpot.create(street_address: 'furn el chebek lebanon', city:"beirut", number_of_spots: 2, description: "test", user_id: 3, country: "lebanon", price_cents: 3000)

Booking.destroy_all
one = Booking.create(start_at: '08/01/2016' ,end_at: '09/01/2016', status: "pending", parking_spot_id: 12, user_id: 3)
one = Booking.create(start_at: '09/01/2016' ,end_at: '10/01/2016', status: "pending", parking_spot_id: 13, user_id: 3)
one = Booking.create(start_at: '10/01/2016' ,end_at: '11/01/2016', status: "pending", parking_spot_id: 14, user_id: 3)
one = Booking.create(start_at: '11/01/2016' ,end_at: '12/01/2016', status: "pending", parking_spot_id: 15, user_id: 2)
one = Booking.create(start_at: '12/01/2016' ,end_at: '12/02/2016', status: "pending", parking_spot_id: 16, user_id: 2)
one = Booking.create(start_at: '08/01/2017' ,end_at: '09/01/2017', status: "pending", parking_spot_id: 17, user_id: 1)
one = Booking.create(start_at: '09/01/2017' ,end_at: '10/01/2017', status: "pending", parking_spot_id: 18, user_id: 1)
one = Booking.create(start_at: '10/01/2017' ,end_at: '12/01/2017', status: "pending", parking_spot_id: 19, user_id: 1)
