# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Trip.destroy_all

Route.destroy_all
City.destroy_all
Chofer.destroy_all
User.destroy_all

Admin.destroy_all
Bus.destroy_all
Additional.destroy_all
 
user1 = User.create! :name => 'John', :email => 'test@test.com', :password => 123456 , :password_confirmation => 123456, :dni => 37125636
user2 = User.create! :name => 'Hernan', :email => 'hernan.k97@gmail.com', :password => 'asdasd123' , :password_confirmation => 'asdasd123', :dni => 25123987, date_of_birth: Date.parse("1997-01-05")

admin = Admin.create! :email => 'admin@admin.com', :password => 123456 , :password_confirmation => 123456

chofer1 = Chofer.create! :nombre => 'Jorge', :apellido => 'Iess', :dni => 33333, :inicio_actividad => "Date.parse('2000-04-2')"
chofer2 = Chofer.create! :nombre => 'Alberto', :apellido => 'Aninstein', :dni => 222222, :inicio_actividad => "Date.parse('1999-04-2')"

ciudad_1 = City.find_or_create_by(nombre: "La Plata")
ciudad_2 = City.find_or_create_by(nombre: "Cordoba")
ciudad_3 = City.find_or_create_by(nombre: "Rosario")
ciudad_4 = City.find_or_create_by(nombre: "Tandil")
ciudad_5 = City.find_or_create_by(nombre: "Bahia Blanca")
ciudad_6 = City.find_or_create_by(nombre: "Capital Federal")

Admin.create! :email => 'Pepe_El_admin@test.com', :password => "asd123" , :password_confirmation => "asd123"
Admin.create! :email => 'admin@test.com', :password => "asd123" , :password_confirmation => "asd123"
Admin.create! :email => 'Jorge_El_admin@test.com', :password => "asd123" , :password_confirmation => "asd123"
Admin.create! :email => 'Manu_El_admin@test.com', :password => "asd123" , :password_confirmation => "asd123"


ruta1 = Route.find_or_create_by(initial_city_id: ciudad_1.id, destination_city_id: ciudad_2.id, nombre: ciudad_1.nombre + ' - ' + ciudad_2.nombre, duracion: '10 hs');
ruta2 = Route.find_or_create_by(initial_city_id: ciudad_3.id, destination_city_id: ciudad_4.id, nombre: ciudad_3.nombre + ' - ' + ciudad_4.nombre, duracion: '5 hs');
ruta3 = Route.find_or_create_by(initial_city_id: ciudad_5.id, destination_city_id: ciudad_6.id, nombre: ciudad_5.nombre + ' - ' + ciudad_6.nombre, duracion: '7 hs');
ruta4 = Route.find_or_create_by(initial_city_id: ciudad_1.id, destination_city_id: ciudad_4.id, nombre: ciudad_1.nombre + ' - ' + ciudad_4.nombre, duracion: '8 hs');
ruta5 = Route.find_or_create_by(initial_city_id: ciudad_3.id, destination_city_id: ciudad_5.id, nombre: ciudad_3.nombre + ' - ' + ciudad_5.nombre, duracion: '11 hs');

Chofer.find_or_create_by(nombre: "Jorge", apellido: "Iess",dni: 25589319,inicio_actividad: Date.parse("2006-04-2") )
Chofer.find_or_create_by(nombre: "Juan", apellido: "Ortis",dni: 12654789,inicio_actividad: Date.parse("2015-06-25"))
Chofer.find_or_create_by(nombre: "Chavo", apellido: "Del Ocho",dni: 40654987,inicio_actividad: Date.parse("2023-05-3"))
Chofer.find_or_create_by(nombre: "Walter", apellido: "White",dni: 15369258,inicio_actividad: Date.parse("2000-07-7"))
Chofer.find_or_create_by(nombre: "Rust", apellido: "Cohle",dni: 29753951,inicio_actividad: Date.parse("2011-08-25"))
Chofer.find_or_create_by(nombre: "Pedro", apellido: "Ibañes",dni: 33453875,inicio_actividad: Date.parse("2003-05-12"))

combi1 = Bus.find_or_create_by(asientos: 30, tipo:"Cómoda", patente:"ASD 123")
combi2 = Bus.find_or_create_by(asientos: 15 , tipo:"Super-cómoda", patente:"DSA 321")
combi3 = Bus.find_or_create_by(asientos: 10 , tipo:"Cómoda", patente:"AAA 000")

Trip.find_or_create_by(horario: "2020-12-01 12:30:00", rate: 452, chofer_id:chofer1.id, bus_id: combi1.id, route_id:ruta2.id)
Trip.find_or_create_by(horario: "2020-11-30 12:30:00", rate: 321354, chofer_id:chofer2.id, bus_id: combi2.id, route_id:ruta1.id)
Trip.find_or_create_by(horario: "2020-12-01 12:30:00", rate: 651213, chofer_id:chofer1.id, bus_id: combi3.id, route_id:ruta3.id)
Trip.find_or_create_by(horario: "2020-12-04 12:30:00", rate: 8765, chofer_id:chofer2.id, bus_id: combi2.id, route_id:ruta5.id)
Trip.find_or_create_by(horario: "2020-12-05 12:30:00", rate: 64456, chofer_id:chofer1.id, bus_id: combi3.id, route_id:ruta3.id)
Trip.find_or_create_by(horario: "2020-12-30 12:30:00", rate: 32133, chofer_id:chofer2.id, bus_id: combi3.id, route_id:ruta4.id)
Trip.find_or_create_by(horario: "2020-12-31 12:30:00", rate: 56132, chofer_id:chofer1.id, bus_id: combi3.id, route_id:ruta5.id)
Trip.find_or_create_by(horario: "2020-11-31 12:30:00", rate: 1111, chofer_id:chofer2.id, bus_id: combi2.id, route_id:ruta4.id)


Additional.find_or_create_by(nombre: "Coca Cola", stock: 20, precio: 532)
Additional.find_or_create_by(nombre: "Hamburguesa", stock: 15, precio: 50)
Additional.find_or_create_by(nombre: "Alfajor", stock: 10, precio: 532)


