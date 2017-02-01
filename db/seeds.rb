# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# uncomment this for start
Visitor.create(first_name:"vlad", last_name:"hilko", reason: "cool things");
Visitor.create(first_name:"Nikita", last_name:"hilko", reason: "cool things");
Visitor.create(first_name:"Anthon", last_name:"hilko", reason: "cool things");


AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

# !!!! Before create another role, create user_role Role.create!(user_role: 'user'); from rails console
# Role.create!(user_role: 'user');
Role.create!(user_role: 'admin');
Role.create!(user_role: 'guest');


Category.create!(category_name:'meeting');
Category.create!(category_name:'interview');
Category.create!(category_name:'conversation');

