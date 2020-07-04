namespace :jobs do
  desc 'Payday - bank all jobs'
  task :bank_points do
    User.children.each(&:bank_points)
  end
end