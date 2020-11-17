# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Route.destroy_all
City.destroy_all
Chofer.destroy_all
User.destroy_all

user = User.create! :name => 'John', :email => 'test@test.com', :password => 123456 , :password_confirmation => 123456
user = User.create! :name => 'Hernan', :email => 'hernan.k97@gmail.com', :password => 'asdasd123' , :password_confirmation => 'asdasd123'

chofer = Chofer.create! :nombre => 'Jorge', :apellido => 'Iess', :dni => 33333, :inicio_actividad => "Date.parse('2000-04-2')"
chofer = Chofer.create! :nombre => 'Alberto', :apellido => 'Aninstein', :dni => 222222, :inicio_actividad => "Date.parse('1999-04-2')"

ciudad_1 = City.find_or_create_by(nombre: "La Plata")
ciudad_2 = City.find_or_create_by(nombre: "Cordoba")
ciudad_3 = City.find_or_create_by(nombre: "Rosario")
ciudad_4 = City.find_or_create_by(nombre: "Tandil")
ciudad_5 = City.find_or_create_by(nombre: "Bahia Blanca")
ciudad_6 = City.find_or_create_by(nombre: "Capital Federal")

Route.find_or_create_by(initial_city_id: 1, destination_city_id: 2, nombre: ciudad_1.nombre + ' - ' + ciudad_2.nombre, duracion: '10 hs');
Route.find_or_create_by(initial_city_id: 3, destination_city_id: 4, nombre: ciudad_3.nombre + ' - ' + ciudad_4.nombre, duracion: '5 hs');
Route.find_or_create_by(initial_city_id: 5, destination_city_id: 6, nombre: ciudad_5.nombre + ' - ' + ciudad_6.nombre, duracion: '7 hs');
Route.find_or_create_by(initial_city_id: 1, destination_city_id: 4, nombre: ciudad_1.nombre + ' - ' + ciudad_4.nombre, duracion: '8 hs');
Route.find_or_create_by(initial_city_id: 3, destination_city_id: 5, nombre: ciudad_3.nombre + ' - ' + ciudad_5.nombre, duracion: '11 hs');

Chofer.find_or_create_by(nombre: "Jorge", apellido: "Iess",dni: 25589319,inicio_actividad: Date.parse("2006-04-2") )
Chofer.find_or_create_by(nombre: "Juan", apellido: "Ortis",dni: 12654789,inicio_actividad: Date.parse("2015-06-25"))
Chofer.find_or_create_by(nombre: "Chavo", apellido: "Del Ocho",dni: 40654987,inicio_actividad: Date.parse("2023-05-3"))
Chofer.find_or_create_by(nombre: "Walter", apellido: "White",dni: 15369258,inicio_actividad: Date.parse("2000-07-7"))
Chofer.find_or_create_by(nombre: "Rust", apellido: "Cohle",dni: 29753951,inicio_actividad: Date.parse("2011-08-25"))
Chofer.find_or_create_by(nombre: "Pedro", apellido: "Ibañes",dni: 33453875,inicio_actividad: Date.parse("2003-05-12"))







