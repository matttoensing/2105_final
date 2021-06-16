
class TrainYard
  attr_reader :location, :trains

  def initialize(yard_info)
    @location = yard_info[:location]
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def types_of_trains
    types = @trains.map do |train|
      train.type
    end
    types.uniq.sort
  end

  def trains_containing(car)
    @trains.find_all do |train|
      train.cargo.include?(car)
    end
  end
end
