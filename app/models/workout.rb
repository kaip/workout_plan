# frozen_string_literal: true
class Workout < ApplicationRecord
  belongs_to :user, inverse_of: :workouts
  has_many :cardio_exercises, inverse_of: :workout
  has_many :strength_exercises, inverse_of: :workout

  validates_presence_of :date

  accepts_nested_attributes_for :cardio_exercises, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :strength_exercises, reject_if: :all_blank, allow_destroy: true
end
