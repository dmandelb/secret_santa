# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
dev = User.create(name: "Devin",email: "dmandelb@example.com",password: "password")
group = Group.new(name: "Unders 2016")
group.admin = dev
group.save
robin = User.create(name: "Robin",email: "rwane@example.com",password: "password")
val = User.create(name: "Valerie",email: "vwane@example.com",password: "password")
mike = User.create(name: "Mike",email: "mnotaro@example.com",password: "password")
alex =  User.create(name: "Alex",email: "avoreis@example.com",password: "password")
alaina = User.create(name: "Alaina",email: "awilling@example.com",password: "password")
shannon = User.create(name: "Shannon",email: "swilling@example.com",password: "password")
tj = User.create(name: "Thomas",email: "tj@example.com",password: "password")
scott = User.create(name: "Scott",email: "slichtor@example.com",password: "password")
r1 = Relationship.create(shipper_a_id: robin.id, shipper_b_id: mike.id)
r2 = Relationship.create(shipper_a_id: val.id, shipper_b_id: alex.id)
s2 = Relationship.create(shipper_a_id: robin.id, shipper_b_id: val.id)
s1 = Relationship.create(shipper_a_id: alaina.id, shipper_b_id: shannon.id)
r3 = Relationship.create(shipper_a_id: alaina.id, shipper_b_id: tj.id)
r4 = Relationship.create(shipper_a_id: shannon.id, shipper_b_id: scott.id)

g1 = GroupsUser.create(group_id: group.id, user_id: dev.id)
g2 = GroupsUser.create(group_id: group.id, user_id: robin.id)
g3 = GroupsUser.create(group_id: group.id, user_id: val.id)
g4 = GroupsUser.create(group_id: group.id, user_id: mike.id)
g5 = GroupsUser.create(group_id: group.id, user_id: alex.id)
g6 = GroupsUser.create(group_id: group.id, user_id: alaina.id)
g7 = GroupsUser.create(group_id: group.id, user_id: shannon.id)
g8 = GroupsUser.create(group_id: group.id, user_id: tj.id)
g9 = GroupsUser.create(group_id: group.id, user_id: scott.id)











