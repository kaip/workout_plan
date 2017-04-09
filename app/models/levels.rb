# frozen_string_literal: true
class Levels
  def initialize(config)
    @config = config
  end

  def each
    levels.each do |level|
      yield level
    end
  end

  def threshold_crossed(original_xp, new_xp)
    if levels_advanced(original_xp, new_xp).present?
      levels_advanced(original_xp, new_xp).last.description
    elsif content_breaks(original_xp, new_xp, level(new_xp)).present?
      content_breaks(original_xp, new_xp, level(new_xp)).last['content']
    end
  end

  def level_xp(xp)
    xp - level(xp).xp_required
  end

  def level(xp)
    levels.select do |level|
      xp >= level.xp_required
    end.last
  end

  def next_level(xp)
    levels.select do |level|
      xp < level.xp_required
    end.first
  end

  private

  def levels
    xp_so_far = 0
    @config.map do |level_hash|
      level_hash['xp_required'] += xp_so_far
      xp_so_far = level_hash['xp_required']
      OpenStruct.new(level_hash)
    end
  end

  def levels_advanced(original_xp, new_xp)
    levels.select do |level|
      original_xp < level.xp_required && new_xp >= level.xp_required
    end
  end

  def content_breaks(original_xp, new_xp, level)
    level.breaks.select do |content_hash|
      original_xp <= content_hash['xp_required'] && new_xp >= content_hash['xp_required']
    end
  end
end
