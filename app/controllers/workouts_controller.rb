# Handles requests around workouts
class WorkoutsController < ApplicationController
  def index
  end

  def new
    @workout = Workout.new
  end
end
