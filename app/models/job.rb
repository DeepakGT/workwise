class Job < ApplicationRecord
  belongs_to :job_category
  belongs_to :uploader, class_name: 'User'

  enum job_type: { 'hourly': 'hourly', 'part_time': 'part_time', 'full_time': 'full_time' }
end
