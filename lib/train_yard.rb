
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
  # this isn't pretty but it works!
  def sorted_cargo_list
    list = []
    @trains.each do |train|
      train.cargo.each do |cargo|
        list << cargo[0].type
      end
    end
    list.uniq.sort
  end

  def car_count(incoming_car)
    count = 0
    trains_containing(incoming_car).each do |train|
      count += train.cargo[incoming_car]
    end
    count
  end

  def total_inventory
    total = {}
    @trains.each do |train|
      train.cargo.each do |car, value|
        total[car] = car_count(car)
      end
    end
    total
  end
end
