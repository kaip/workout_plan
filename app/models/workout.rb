class Workout < ApplicationRecord
  belongs_to :user, inverse_of: :workouts
  has_many :segments, class_name: WorkoutSegment, inverse_of: :workout
end
