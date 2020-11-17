# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

City.destroy_all
Route.destroy_all
#Chofer.destroy_all

user = User.create! :name => 'John', :email => 'test@test.com', :password => 123456 , :password_confirmation => 123456

chofer = Chofer.create! :nombre => 'Jorge', apellido => 'Iess', :dni => 33333, :inicio_actividad => "Date.parse('2000-04-2')"
chofer = Chofer.create! :nombre => 'Alberto', apellido => 'Aninstein', :dni => 222222, :inicio_actividad => "Date.parse('1999-04-2')"


ciudad_1 = City.find_or_create_by(nombre: "La Plata")
ciudad_2 = City.find_or_create_by(nombre: "Cordoba")
ciudad_3 = City.find_or_create_by(nombre: "Rosario")
ciudad_4 = City.find_or_create_by(nombre: "Tandil")
ciudad_5 = City.find_or_create_by(nombre: "Bahia Blanca")
ciudad_6 = City.find_or_create_by(nombre: "Capital Federal")

Route.find_or_create_by(initial_city_id: 1, destination_city_id: 2);
Route.find_or_create_by(initial_city_id: 3, destination_city_id: 4);
Route.find_or_create_by(initial_city_id: 5, destination_city_id: 6);
Route.find_or_create_by(initial_city_id: 1, destination_city_id: 4);
Route.find_or_create_by(initial_city_id: 3, destination_city_id: 5);





