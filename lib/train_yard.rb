
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
  #helper method for total_inventory method, different from iteration 4 method
  def car_count(incoming_car)
    count = 0
    trains_containing(incoming_car).each do |train|
      count += train.cargo[incoming_car]
    end
    count
  end

  def total_inventory
    total = {}
    @trains.select do |train|
      train.cargo.select do |car, value|
        total[car] = car_count(car)
      end
    end
    total
  end

  def overflow_cars
    car_overflow = []
    @trains.each do |train|
      train.cargo.each do |car|
        car_overflow << car[0] if trains_containing(car[0]).length > 1 && total_inventory[car[0]] >= 10
      end
    end
    car_overflow.uniq
  end
  # I don't think i did this correctly, gave it a show though
  def unload(car, quantity)
    count = 0
    trains_containing(car).each do |train|
      count += train.weight
    end
    count >= quantity
  end
end
