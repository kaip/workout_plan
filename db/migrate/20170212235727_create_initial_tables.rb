# frozen_string_literal: true
class CreateInitialTables < ActiveRecord::Migration[5.0]
  def change
    create_table :workouts do |t|
      t.column :date, :date, null: false
      t.column :user_id, :integer, null: false
    end
    create_table :cardio_exercises do |t|
      t.column :exercise, :string, null: false
      t.column :minutes, :integer, null: false
      t.column :workout_id, :integer, null: false
    end
    create_table :strength_exercises do |t|
      t.column :exercise, :string, null: false
      t.column :workout_id, :integer, null: false
    end
    create_table :sets do |t|
      t.column :reps, :integer, null: false
      t.column :weight, :string, null: false
      t.column :strength_exercise_id, :integer, null: false
    end
  end
end
