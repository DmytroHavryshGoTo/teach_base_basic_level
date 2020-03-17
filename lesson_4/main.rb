# frozen_string_literal: true

# Divide classes into different files. Now trains can be cargo or passenger
# and the can recieve only cargo carriage for cargo train etc.
# When adding a carriage to a train, the carriage object must be stored
# in the array in train
# Create main.rb which will allow user to: create stations, create trains,
# add carriages to train, remove carriages from train, add train to stations,
# display all staions and trains in them

require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'
require_relative 'station'

all_stations = []
all_trains = []

def search_obj(search_array, search_obj, obj_type)
  if obj_type == :train
    search_array.select { |train| train.number == search_obj }
  else
    search_array.select { |station| station.name == search_obj }
  end
end

def get_index_of_obj(search_array, obj)
  search_array.rindex(obj)
end

loop do
  puts '-----------------------------
  Select what you want to do:
  1 - Create station
  2 - Create train
  3 - Add carriage to train
  4 - Remove carriage from train
  5 - Add train to station
  6 - Display stations and trains in them
  7 - Exit'
  action = gets.chomp.to_i

  case action
  when 1
    puts 'Enter station name:'
    station_name = gets.chomp
    all_stations << Station.new(station_name)
    puts "Successfully created station '#{station_name}'"
  when 2
    puts 'Enter train number:'
    train_number = gets.chomp.to_i
    puts 'Enter train type(cargo or passenger):'
    train_type = gets.chomp.to_sym
    all_trains << if train_type == :cargo
                    CargoTrain.new(train_number)
                  else
                    PassengerTrain.new(train_number)
                  end
    puts "Successfully created #{train_type} train  ##{train_number}"
  when 3
    puts 'Enter train number:'
    train_number = gets.chomp.to_i
    needed_train = search_obj(all_trains, train_number, :train)
    if needed_train[0].nil?
      puts 'There is no such train'
    else
      index_of_train = get_index_of_obj(all_trains, needed_train[0])
      new_carriage = if needed_train[0].type == :cargo
                       CargoCarriage.new
                     else
                       PassengerCarriage.new
                     end
      all_trains[index_of_train].add_carriage(new_carriage)
      puts 'Successfully added carriage'
    end
  when 4
    puts 'Enter train number:'
    train_number = gets.chomp.to_i
    needed_train = search_obj(all_trains, train_number, :train)
    if needed_train[0].nil?
      puts 'There is no such train'
    else
      index_of_train = get_index_of_obj(all_trains, needed_train[0])
      all_trains[index_of_train].remove_carriage
      puts 'Successfully removed carriage'
    end
  when 5
    puts 'Enter station name:'
    station_name = gets.chomp
    needed_station = search_obj(all_stations, station_name, :station)
    if needed_station[0].nil?
      puts 'There is no such station'
    else
      station_index = get_index_of_obj(all_stations, needed_station[0])
      puts 'Enter train number:'
      train_number = gets.chomp.to_i
      needed_train = search_obj(all_trains, train_number, :train)
      if needed_train[0].nil?
        puts 'There is no such train'
      else
        index_of_train = get_index_of_obj(all_trains, needed_train[0])
        all_stations[station_index].add_train(all_trains[index_of_train])
        puts 'Successfully added carriage to station'
      end
    end
  when 6
    all_stations.each do |station|
      puts "---#{station.name}---"
      station.display_all_trains
    end
  else
    break
  end
end
