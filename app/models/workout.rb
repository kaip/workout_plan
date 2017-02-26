# frozen_string_literal: true
class Workout < ApplicationRecord
  belongs_to :user, inverse_of: :workouts
  has_many :cardio_exercises, inverse_of: :workout
  has_many :strength_exercises, inverse_of: :workout
end
