# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create(
	name:"admin", 
	username:"admin", 
	email:"admin@gmail.com", 
	phone:"12345678", 
	active:true,
	password:"secret",
	password_confirmation:"secret",
	role:"admin"
	)

AdminUser.create(
	name:"finance", 
	username:"finance", 
	email:"finance@gmail.com", 
	phone:"12345678", 
	active:true,
	password:"secret",
	password_confirmation:"secret",
	role:"finance"
	)