# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#Chofer.destroy_all

user = User.create! :name => 'John', :email => 'test@test.com', :password => 123456 , :password_confirmation => 123456

chofer = Chofer.create! :nombre => 'Jorge', apellido => 'Iess', :dni => 33333, :inicio_actividad => "Date.parse('2000-04-2')"
chofer = Chofer.create! :nombre => 'Alberto', apellido => 'Aninstein', :dni => 222222, :inicio_actividad => "Date.parse('1999-04-2')"









