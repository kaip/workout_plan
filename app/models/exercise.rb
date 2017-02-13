# A type of exercise, pushups for example
class Exercise < ApplicationRecord
  has_many :sets, inverse_of: :exercise
end
