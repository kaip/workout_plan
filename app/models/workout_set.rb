# frozen_string_literal: true
class WorkoutSet < ApplicationRecord
  self.table_name = 'sets'
  belongs_to :strength_exercise

  def to_s
    "#{weight}x#{reps}"
  end
end
