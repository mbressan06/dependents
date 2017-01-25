# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@user = User.create(email: 'marcelo@ntzholding.com.br', password: '123abc@')
10.times do |i|
  Dependents.create(name: 'Dependents name', kinship_type: 'Filho', user_id: @user.id)
end
