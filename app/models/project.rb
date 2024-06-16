class Project < ApplicationRecord
  belongs_to :category

  has_many :project_skills
  has_many :skills, through: :project_skills

  has_many :saved_items, as: :item
  has_many :likes, as: :likeable

  has_many :comments, as: :commentable
  has_many :views, as: :viewable

  validates :title, :description, presence: true
end
