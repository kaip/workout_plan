class WorkoutsPresenter
  def initialize(workouts)
    @workouts = workouts
  end

  delegate :each, to: :@workouts

  def total_xp
    @workouts.sum(:duration)
  end

  def xp
    $levels.level_xp(total_xp)
  end

  def next_level
    $levels.next_level(total_xp)
  end

  def level
    $levels.level(total_xp)
  end
end
