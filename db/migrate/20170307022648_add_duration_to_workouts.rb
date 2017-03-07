class AddDurationToWorkouts < ActiveRecord::Migration[5.0]
  def change
    add_column :workouts, :duration, :integer, null: false, default: 30
  end
end
