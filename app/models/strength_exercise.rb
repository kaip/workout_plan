# frozen_string_literal: true
# A repeated set of weight movements designed to increase strength
class StrengthExercise < ApplicationRecord
  belongs_to :workout
  has_many :sets, class_name: WorkoutSet, inverse_of: :strength_exercise
end
