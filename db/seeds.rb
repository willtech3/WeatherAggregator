# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    City.create([{user_id: 1, name: 'Burnsville', zip_code: 55306},
                 {user_id: 1, name: 'Lakeville', zip_code: 55044},
                 {user_id: 1, name: 'Coconut Creek', zip_code:33066},
                 {user_id: 1, name: 'Plantation', zip_code: 33317}])