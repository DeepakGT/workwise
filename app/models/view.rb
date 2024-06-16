class View < ApplicationRecord
  belongs_to :viewable, polymorphic: true
  belongs_to :user
end
