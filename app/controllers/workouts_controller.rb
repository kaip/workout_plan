# frozen_string_literal: true
# Handles requests around workouts
class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.where(user_id: current_user.id).all
  end

  def new
    @workout = Workout.new
    2.times { @workout.cardio_exercises.build }
    8.times do
      exercise = @workout.strength_exercises.build
      5.times { exercise.sets.build }
    end
  end

  def create
    @workout = Workout.new(params.require(:workout)
                           .permit(:date,
                                   cardio_exercises: [:exercise, :minutes],
                                   strength_exercises: { exercise: [], sets: [:weight, :reps] }))
    @workout.user = current_user
    @workout.save!
    redirect_to :root
  end
end
