# frozen_string_literal: true
# Handles requests around workouts
class WorkoutsController < ApplicationController
  before_action :authenticate_user!
  def index
    @workouts = workouts
    @success = $levels.level(0).description if current_user.created_at.today?
  end

  def new
    @workout = Workout.new
  end

  def create
    original_xp = workouts.total_xp
    @workout = Workout.new(workout_params)
    @workout.user = current_user
    @workout.save!
    @success = $levels.threshold_crossed(original_xp, workouts.total_xp)
    if @success.present?
      @workouts = workouts
      return render :index
    end
    redirect_to :root
  end

  def edit
    @workout = Workout.find(params[:id])
    render :new
  end

  def update
    original_xp = workouts.total_xp
    @workout = Workout.find(params[:id])
    @workout.update_attributes!(workout_params)
    @success = $levels.threshold_crossed(original_xp, workouts.total_xp)
    if @success.present?
      @workouts = workouts
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
