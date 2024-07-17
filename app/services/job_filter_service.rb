module JobFilterService
  class << self
    def call(q, filters, jobs)
      return jobs if q.blank? && filters.blank?

      jobs = process_search_query(q, jobs) if q.present?
      jobs = process_filters(filters, jobs) if filters.present?
      jobs
    end

    private

    def process_search_query(q, jobs)
      jobs.where('title ILIKE ? OR description ILIKE ?', "%#{q}%", "%#{q}%")
    end

    def process_filters(filters, jobs)
      filters.each do |key, value|
        case key
        when 'skills'
          jobs = jobs.joins(:skills).where(skills: { id: value })
        when 'availability'
          jobs = jobs.where(job_type: value)
        when 'job_types'
          jobs = jobs.where(job_type: value)
        when 'pay_rate_hourly'
          min, max = value.split(',').map(&:to_i)
          jobs = jobs.where(hourly_price: min..max)
        when 'pay_rate_monthly'
          min, max = value.split(',').map(&:to_i)
          jobs = jobs.where(monthly_salary: min..max)
        when 'experience'
          jobs = jobs.where(experience: value)
        when 'countries'
          jobs = jobs.joins(:uploader).where(users: { country: value })
        else
          # Handle unexpected filters or log them
        end
      end
      jobs
    end
  end
end
