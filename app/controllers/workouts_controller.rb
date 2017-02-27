# frozen_string_literal: true
# Handles requests around workouts
class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.where(user_id: current_user.id).all
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.user = current_user
    @workout.save!
    redirect_to :root
  end

  def workout_params
    params.require(:workout)
          .permit(:date,
                  cardio_exercises_attributes: [:id, :exercise, :minutes, :_destroy],
                  strength_exercises_attributes:
                    [:id, :exercise, :_destroy, sets_attributes: [:id, :_destroy, :weight, :reps]])
  end
end
