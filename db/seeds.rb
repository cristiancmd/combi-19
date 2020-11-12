# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

City.destroy_all
Route.destroy_all
Chofer.destroy_all

ciudad_1 = City.find_or_create_by(nombre: "La Plata")
ciudad_2 = City.find_or_create_by(nombre: "Cordoba")
ciudad_3 = City.find_or_create_by(nombre: "Rosario")
ciudad_4 = City.find_or_create_by(nombre: "Tandil")
ciudad_5 = City.find_or_create_by(nombre: "Bahia Blanca")
ciudad_6 = City.find_or_create_by(nombre: "Capital Federal")

Route.find_or_create_by(inicio_city_id: ciudad_1, destino_city_id: ciudad_2)
Route.find_or_create_by(inicio_city_id: ciudad_3, destino_city_id: ciudad_4)
Route.find_or_create_by(inicio_city_id: ciudad_5, destino_city_id: ciudad_6)
Route.find_or_create_by(inicio_city_id: ciudad_1, destino_city_id: ciudad_6)
Route.find_or_create_by(inicio_city_id: ciudad_2, destino_city_id: ciudad_5)
Route.find_or_create_by(inicio_city_id: ciudad_3, destino_city_id: ciudad_4)
Route.find_or_create_by(inicio_city_id: ciudad_3, destino_city_id: ciudad_6)

Chofer.find_or_create_by(nombre: "Jorge", apellido: "Iess",dni: 25589319,inicio_actividad: Date.parse("2006-04-2") )
Chofer.find_or_create_by(nombre: "Juan", apellido: "Ortis",dni: 12654789,inicio_actividad: Date.parse("2015-06-25"))
Chofer.find_or_create_by(nombre: "Chavo", apellido: "Del Ocho",dni: 40654987,inicio_actividad: Date.parse("2023-05-3"))
Chofer.find_or_create_by(nombre: "Walter", apellido: "White",dni: 15369258,inicio_actividad: Date.parse("2000-07-7"))
Chofer.find_or_create_by(nombre: "Rust", apellido: "Cohle",dni: 29753951,inicio_actividad: Date.parse("2011-08-25"))
Chofer.find_or_create_by(nombre: "Pedro", apellido: "Ibañes",dni: 33453875,inicio_actividad: Date.parse("2003-05-12"))