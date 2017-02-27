# frozen_string_literal: true
# A repeated set of weight movements designed to increase strength
class StrengthExercise < ApplicationRecord
  belongs_to :workout
  has_many :sets, class_name: WorkoutSet, inverse_of: :strength_exercise

  accepts_nested_attributes_for :sets, reject_if: :all_blank, allow_destroy: true

  def to_s
    "#{exercise}: #{sets.map(&:to_s).join(' ')}"
  end
end
