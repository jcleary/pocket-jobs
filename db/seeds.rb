# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
john = User.create(name: 'John', child: false, email: 'john@example.com', password: '11111111')
sally = User.create(name: 'Sally', child: false, email: 'sally@example.com', password: '11111111')
User.create(
  name: 'Jack', 
  child: true, 
  email: 'jack@example.com', 
  password: '11111111', 
  position: 1, 
  target_jobs: 48, 
  pre_target_point_value: 14, 
  target_bonus: 800, 
  post_target_point_value: 17
)
User.create(
  name: 'Lucas', 
  child: true, 
  email: 'lucas@example.com', 
  password: '11111111', 
  position: 2, 
  target_jobs: 36, 
  pre_target_point_value: 14, 
  target_bonus: 300, 
  post_target_point_value: 17
)
User.create(
  name: 'Fleur', 
  child: true, 
  email: 'fleur@example.com', 
  password: '11111111', 
  position: 3, 
  target_jobs: 24, 
  pre_target_point_value: 14, 
  target_bonus: 200, 
  post_target_point_value: 17
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

job_types.each do |value, names|
  names.each do |name|
    JobType.create(name: name, value: value)
  end
end


