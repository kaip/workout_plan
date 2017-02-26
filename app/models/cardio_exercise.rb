# frozen_string_literal: true
# A timed activity designed to improve cardiovascular health
class CardioExercise < ApplicationRecord
  belongs_to :workout, inverse_of: :cardio_exercises
end
