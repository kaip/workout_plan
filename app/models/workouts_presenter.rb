class WorkoutsPresenter
  def initialize(workouts)
    @workouts = workouts
  end

  delegate :each, to: :@workouts

  def xp
    @workouts.sum(:duration)
  end

  def level
    remaining_xp = xp
    $levels.each do |level|
      remaining_xp -= level.xp_required
      break level if remaining_xp < 0
    end
  end
end
