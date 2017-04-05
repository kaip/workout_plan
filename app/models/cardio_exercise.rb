# frozen_string_literal: true
# A timed activity designed to improve cardiovascular health
class CardioExercise < ApplicationRecord
  belongs_to :workout, inverse_of: :cardio_exercises

  def self.exercise_names
    YAML.safe_load(File.open('config/cardio_exercises.yml')).sort
  end

  def to_s
    "#{minutes} minute #{exercise.downcase}"
  end
end
