# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
john = User.create(name: 'John', role: 'parent',  email: 'john@example.com', password: '11111111')
sally = User.create(name: 'Sally', role: 'parent', email: 'sally@example.com', password: '11111111')
User.create(
  name: 'Jack', 
  role: 'child', 
  email: 'jack@example.com', 
  password: '11111111', 
  position: 1, 
  target_points: 48, 
  pre_target_point_value: 16, 
  target_bonus: 832, 
  post_target_point_value: 18
)
User.create(
  name: 'Lucas', 
  role: 'child', 
  email: 'lucas@example.com', 
  password: '11111111', 
  position: 2, 
  target_points: 36, 
  pre_target_point_value: 16, 
  target_bonus: 324, 
  post_target_point_value: 18
)
User.create(
  name: 'Fleur', 
  role: 'child', 
  email: 'fleur@example.com', 
  password: '11111111', 
  position: 3, 
  target_points: 24, 
  pre_target_point_value: 16, 
  target_bonus: 216, 
  post_target_point_value: 18
)
User.create(
  name: 'Dash', 
  role: 'dashboard', 
  email: 'dashboard@example.com', 
  password: '11111111'
)

job_types = {
  4 => [
    'Set Dinner Table'
  ],

  5  => [
    'Put Clothes Away', 
    'Put Bins Out', 
    'Unload Dishwasher'
  ],

  7 => [
    'Green Waste', 'Hoover', 'Sweep Floor', 'Cardboard', 'Glass + Plastic'
  ],

  10 => [
    'Black Bin', 'Wash, Dry or Fold', 'Load Dishwasher'
  ]
}

job_types.each do |points, names|
  names.each do |name|
    JobType.create(name: name, points: points)
  end
end


AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?