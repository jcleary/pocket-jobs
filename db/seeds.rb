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
jack = User.create(name: 'Jack', child: true, email: 'jack@example.com', password: '11111111', position: 1, target_jobs: 8, pre_target_point_value: 1, target_bonus: 8, post_target_point_value: 1 )
lucas = User.create(name: 'Lucas', child: true, email: 'lucas@example.com', password: '11111111', position: 2, target_jobs: 6, pre_target_point_value: 1, target_bonus: 3, post_target_point_value: 1 )
fleur = User.create(name: 'Fleur', child: true, email: 'fleur@example.com', password: '11111111', position: 3, target_jobs: 4, pre_target_point_value: 1, target_bonus: 2, post_target_point_value: 1 )

load_dw = JobType.create(name: 'Load dishwasher', value: 1)
empty_dw = JobType.create(name: 'Empty dishwasher', value: 1)
food = JobType.create(name: 'Food Recycling', value: 1)
recycling = JobType.create(name: 'Cardboard/glass Recycling', value: 1)
washing_machine = JobType.create(name: 'Washing machine', value: 1)
dryer = JobType.create(name: 'Dryer', value: 1)
laundry = JobType.create(name: 'Laundry to room', value: 1)
bin = JobType.create(name: 'Bin', value: 1)
table = JobType.create(name: 'Lay table', value: 1)

Job.create(user: jack, job_type: empty_dw)
Job.create(user: lucas, job_type: table)
Job.create(user: lucas, job_type: dryer)

