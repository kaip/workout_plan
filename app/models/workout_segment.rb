# Number of times doing a particular set
class WorkoutSegment < ApplicationRecord
  belongs_to :workout, inverse_of: :segments
  has_one :set, inverse_of: :segment
end
