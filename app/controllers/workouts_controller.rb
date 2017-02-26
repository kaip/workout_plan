# frozen_string_literal: true
# Handles requests around workouts
class WorkoutsController < ApplicationController
  def new
    @workout = Workout.new
    2.times { @workout.cardio_exercises.build }
    8.times do
      exercise = @workout.strength_exercises.build
      5.times { exercise.sets.build }
    end
  end
end
