# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# !!!! Before create another role, create user_role Role.create!(user_role: 'user'); from rails console
# Role.create!(user_role: 'user');
Role.create!(user_role: 'admin');
Role.create!(user_role: 'guest');

User.create!(email: 'admin@tut.by', username: "Motador",
 password: 'password', password_confirmation: 'password',
 role_id: Role.find_by(user_role: 'admin').id);



Visitor.create(first_name:"Pitter", last_name:"hilko",
 reason: "cool things", state: 'acception', user_id: User.find_by(email: 'admin@tut.by').id);
Visitor.create(first_name:"Nikita", last_name:"hilko",
 reason: "cool things", state: 'acception', user_id: User.find_by(email: 'admin@tut.by').id);
Visitor.create(first_name:"Anthon", last_name:"hilko",
 reason: "cool things", state: 'acception', user_id: User.find_by(email: 'admin@tut.by').id);


CategoryVisitor.create(category: 'interview', visitor_id: Visitor.find_by(first_name: 'Pitter').id)
CategoryVisitor.create(category: 'interview', visitor_id: Visitor.find_by(first_name: 'Nikita').id)
CategoryVisitor.create(category: 'conversation', visitor_id: Visitor.find_by(first_name: 'Anthon').id)


AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')




Category.create!(category_name:'meeting');
Category.create!(category_name:'interview');
Category.create!(category_name:'conversation');
Category.create!(category_name:'another');

