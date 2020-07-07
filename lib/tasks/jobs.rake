namespace :jobs do
  desc 'Payday - bank all jobs'
  task bank_points: :environment do
    User.children.each(&:bank_points)
  end

  task nudge: :environment do
    User.children.each do |child|
      recent_jobs = child.jobs.includes(:job_type).where('created_at >= ?', 7.days.ago.beginning_of_day)
      recent_job_points = recent_jobs.inject(0) { |sum, job| sum + job.job_type.points }
      daily_average = recent_jobs.count.to_f / 7
      inf = Float::INFINITY

      rating =
        case daily_average
        when 0..0.5 then 'Seriously?'
        when 0.5..0.8 then 'Not awful'
        when 0.8..1.3 then 'On the right track'
        when 1.3..2.0 then 'Great'
        when 2.0..inf then 'WOW!'
        end

      message = "Hi #{child.name}, can you do a few jobs now? " \
        "\n\nOver the past 7 days you've completed #{recent_jobs.count} jobs (#{recent_job_points.floor} points). " \
        "That's around #{daily_average.round(1)} jobs per day." \
        "\n\nRating: #{rating}"
      puts message
      child.send_sms(message)
    end
  end
end