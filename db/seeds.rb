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
Product.create(name: "Apelsin", my_type:'fruckt');
Product.create(name: "mandarin", my_type:'fruckt');
Product.create(name: "banan", my_type:'fruckt');

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

# create first user_role 'user' from rails console
# Role.create!(user_role: 'user');
Role.create!(user_role: 'admin');
Role.create!(user_role: 'guest');

Moderation.create(first_name:"Vlad", last_name:"Conik", reason: "cool things");
Moderation.create(first_name:"Vladic", last_name:"Slonik", reason: "cool things");

Category.create(category_name:'meeting');
Category.create(category_name:'interview');
Category.create(category_name:'conversation');

