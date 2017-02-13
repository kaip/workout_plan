class WorkoutSet < ApplicationRecord
  belongs_to :exercise, inverse_of: :sets
  belongs_to :segment, inverse_of: :set
end
