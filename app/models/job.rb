class Job < ApplicationRecord
  belongs_to :job_category
  belongs_to :uploader, class_name: 'User'

  has_many :job_skills
  has_many :skills, through: :job_skills

  has_many :saved_items, as: :item
  has_many :likes, as: :likeable

  has_many :comments, as: :commentable
  has_many :views, as: :viewable

  validates :title, :description, presence: true

  enum job_type: { 'hourly': 'hourly', 'part_time': 'part_time', 'full_time': 'full_time' }
end
