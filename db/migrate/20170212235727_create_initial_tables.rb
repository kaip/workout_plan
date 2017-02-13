class CreateInitialTables < ActiveRecord::Migration[5.0]
  def change
    create_table :workouts do |t|
      t.column :date, :date, null: false
      t.column :user_id, :integer, null: false
    end
    create_table :workout_segments do |t|
      t.column :workout_id, :integer, null: false
      t.column :reps, :integer, null: false
      t.column :set_id, :integer, null: false
    end
    create_table :workout_sets do |t|
      t.column :reps, :integer, null: false
      t.column :exercise, :integer, null: false
    end
    create_table :exercises do |t|
      t.column :name, :string, null: false
      t.column :reps, :integer, null: false
      t.column :seconds, :integer
    end
  end
end
