# frozen_string_literal: true
# Handles requests around workouts
class WorkoutsController < ApplicationController
  def index
    @workouts = workouts
  end

  def new
    @workout = Workout.new
  end

  def create
    original_level = workouts.level
    @workout = Workout.new(workout_params)
    @workout.user = current_user
    @workout.save!
    if original_level != workouts.level
      @workouts = workouts
      @success = workouts.level.description
      return render :index
    end
    redirect_to :root
  end

  private

  def workouts
    WorkoutsPresenter.new(Workout.where(user_id: current_user.id).all)
  end

  def workout_params
    params.require(:workout)
          .permit(:date,
                  :duration,
                  cardio_exercises_attributes: [:id, :exercise, :minutes, :_destroy],
                  strength_exercises_attributes:
                    [:id, :exercise, :_destroy, sets_attributes: [:id, :_destroy, :weight, :reps]])
  end
end
