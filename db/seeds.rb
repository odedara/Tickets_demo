# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#User.create(role_name: "Admin",email: "comp.manisha@gmail.com",password: "123456",password_confirmation: "123456", confirmed_at: Date.today,  )


User.first.update(status: true)