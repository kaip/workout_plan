# frozen_string_literal: true
require 'rails_helper'

describe 'log workout', type: :feature do
  it 'displays data on index page' do
    # Given a logged in user
    user = User.create!(email: 'alana@gmail.com', password: 'ewokrock')
    login_as(user, scope: :user)

    # When a user enters their workout
    visit '/workouts/new'
    fill_in 'workout[date]', with: '02/12/2017'
    within '#cardio' do
      within '#cardio_exercise_1' do
        fill_in 'Exercise', with: 'Mile run'
        fill_in 'Minutes', with: '7'
      end
      within '#cardio_exercise_2' do
        fill_in 'Exercise', with: 'Mile walk'
        fill_in 'Minutes', with: '15'
      end
      within '#strength_exercise_1' do
        fill_in 'Exercise', with: 'Squats'
        within '#working_set_1' do
          fill_in 'Weight', with: '145'
          fill_in 'Reps', with: '5'
        end
        within '#working_set_2' do
          fill_in 'Weight', with: '145'
          fill_in 'Reps', with: '7'
        end
        within '#working_set_3' do
          fill_in 'Weight', with: '150'
          fill_in 'Reps', with: '7'
        end
        within '#working_set_4' do
          fill_in 'Weight', with: '165'
          fill_in 'Reps', with: '7'
        end
        within '#working_set_5' do
          fill_in 'Weight', with: '180'
          fill_in 'Reps', with: '2'
        end
      end
      within '#strength_exercise_2' do
        fill_in 'Exercise', with: 'Chest press'
        within '#working_set_1' do
          fill_in 'Weight', with: '100'
          fill_in 'Reps', with: '5'
        end
        within '#working_set_2' do
          fill_in 'Weight', with: '110'
          fill_in 'Reps', with: '7'
        end
        within '#working_set_3' do
          fill_in 'Weight', with: '120'
          fill_in 'Reps', with: '7'
        end
        within '#working_set_4' do
          fill_in 'Weight', with: '135'
          fill_in 'Reps', with: '7'
        end
        within '#working_set_5' do
          fill_in 'Weight', with: '150'
          fill_in 'Reps', with: '2'
        end
      end
    end

    # Then it shows up on their index page
    expect(current_url).to eq '/workouts'
    expect(text).to include('2017-02-12')
    expect(text).to include('Mile run')
    expect(text).to include('7 minutes')
    expect(text).to include('Mile walk')
    expect(text).to include('15 minutes')
    expect(text).to include('Squats')
    expect(text).to include('180x2')
    expect(text).to include('Chess press')
    expect(text).to include('150x2')
  end
end
