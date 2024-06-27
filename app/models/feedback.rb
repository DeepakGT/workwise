class Feedback < ApplicationRecord
  belongs_to :feedback_by, class_name: :User
end
