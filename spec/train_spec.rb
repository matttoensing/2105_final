require 'rspec'
require './lib/car'
require './lib/train'

RSpec.describe Train do
  it 'exists' do
    train1 = Train.new({name: 'Thomas', type: 'Tank'})

    expect(train1).to be_an_instance_of(Train)
  end

  it 'has attributes' do
    train1 = Train.new({name: 'Thomas', type: 'Tank'})

    expect(train1.name).to eq('Thomas')
    expect(train1.type).to eq('Tank')
    expect(train1.cargo).to eq({})
  end

  it 'can count the number of cars' do
    car1 = Car.new({type: 'Mail', weight: 5})
    train1 = Train.new({name: 'Thomas', type: 'Tank'})

    expect(train1.count_cars(car1)).to eq(0)
  end

  it 'can add cars and then count them' do
    car1 = Car.new({type: 'Mail', weight: 5})
    car2 = Car.new({type: 'Passengers', weight: 1})
    train1 = Train.new({name: 'Thomas', type: 'Tank'})

    train1.add_cars(car1, 2)

    expected = {car1 => 2}

    expect(train1.cargo).to eq(expected)
    expect(train1.count_cars(car1)).to eq(2)

    train1.add_cars(car1, 3)

    expected2 = expected = {car1 => 5}

    expect(train1.cargo).to eq(expected2)
    expect(train1.count_cars(car1)).to eq(5)

    train1.add_cars(car2, 10)

    expected3 = {
      car1 => 5,
      car2 => 10
    }

  expect(train1.cargo).to eq(expected3)
  end

  it 'can add the weight of the train after cars added' do
    car1 = Car.new({type: 'Mail', weight: 5})
    car2 = Car.new({type: 'Passengers', weight: 1})
    train1 = Train.new({name: 'Thomas', type: 'Tank'})

    train1.add_cars(car1, 5)
    train1.add_cars(car2, 2)

    expect(train1.weight).to eq(27)
  end
end
