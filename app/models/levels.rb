class Levels
  def initialize(config)
    @config = config
  end

  def each
    @config.map { |level_hash| OpenStruct.new(level_hash)}.each do |level|
      yield level
    end
  end
end
