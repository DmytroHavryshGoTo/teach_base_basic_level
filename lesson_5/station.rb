# frozen_string_literal: true

# Station class
class Station
  attr_reader :name
  @@stations = 0

  def initialize(name)
    @name = name
    @list_of_trains = []
    @@stations += 1
  end

  def self.all
    @@stations
  end

  def add_train(train)
    @list_of_trains << train
  end

  def display_all_trains
    @list_of_trains.each do |train|
      puts "Number - #{train.number}, type - #{train.type}"
    end
  end

  def display_trains_by_type
    list_by_types = {}
    @list_of_trains.each do |train|
      if list_by_types[train.type].nil?
        list_by_types[train.type] = 1
      else
        list_by_types[train.type] += 1
      end
    end
    list_by_types.each { |type, volume| puts "#{type} - #{volume}" }
  end

  def remove_train
    @list_of_trains.pop
  end
end
