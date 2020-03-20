# frozen_string_literal: true

# Implement validation in classes(valid! and valid? mathods) - check main
# attributes. Validation must be called from constructur and not create
# instance if something wrong.
# Implement train number regex check, that
# must be: any 3 numbers or letters than hypen(optional) and 2 numbers
# or letters.
# In user interface implement error catching(if user typed something wrong
# it should be re-typed).

require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'
require_relative 'station'

# Start point of program
class Main
  @@all_stations = []
  @@all_trains = []

  class << self
    def call
      info
    end

    def create_station
      station_name = station_name_from_user
      @@all_stations << Station.new(station_name)
    rescue StandardError => e
      puts e.message
      retry
    ensure
      puts "Successfully created station '#{station_name}'"
    end

    def create_train
      train_number = train_number_from_user
      puts 'Enter train type(cargo or passenger):'
      train_type = gets.chomp.to_sym
      @@all_trains << if train_type == :cargo
                        CargoTrain.new(train_number)
                      else
                        PassengerTrain.new(train_number)
                      end
    rescue StandardError => e
      puts e.message
      retry
    ensure
      puts "Successfully created #{train_type} train  ##{train_number}"
    end

    def add_carriage_to_train
      train_number = train_number_from_user
      needed_train = search_obj(@@all_trains, train_number, :train)
      puts 'Enter quantity of volume or passenger:'
      train_volume = gets.chomp.to_i
      if needed_train[0].nil?
        puts 'There is no such train'
      else
        index_of_train = index_of_obj(@@all_trains, needed_train[0])
        new_carriage = if needed_train[0].type == :cargo
                         CargoCarriage.new(train_volume)
                       else
                         PassengerCarriage.new(train_volume)
                       end
        @@all_trains[index_of_train].add_carriage(new_carriage)
        puts 'Successfully added carriage'
      end
    rescue StandardError => e
      puts e.message
      retry
    end

    def remove_carriage_from_train
      train_number = train_number_from_user
      needed_train = search_obj(@@all_trains, train_number, :train)
      if needed_train[0].nil?
        puts 'There is no such train'
      else
        index_of_train = index_of_obj(@@all_trains, needed_train[0])
        @@all_trains[index_of_train].remove_carriage
        puts 'Successfully removed carriage'
      end
    end

    def add_train_to_station
      station_name = station_name_from_user
      needed_station = search_obj(@@all_stations, station_name, :station)
      if needed_station[0].nil?
        puts 'There is no such station'
      else
        station_index = index_of_obj(@@all_stations, needed_station[0])
        train_number = train_number_from_user
        needed_train = search_obj(@@all_trains, train_number, :train)
        if needed_train[0].nil?
          puts 'There is no such train'
        else
          index_of_train = index_of_obj(@@all_trains, needed_train[0])
          @@all_stations[station_index].add_train(@@all_trains[index_of_train])
          puts 'Successfully added carriage to station'
        end
      end
    end

    def display_station_trains
      @@all_stations.each do |station|
        puts "---#{station.name}---"
        station.each do |train|
          puts "##{train.number} | type - #{train.type} | carriages - #{train.carriages}"
        end
      end
    end

    def display_train_carriages
      train_number = train_number_from_user
      needed_train = search_obj(@@all_trains, train_number, :train)
      if needed_train[0].nil?
        puts 'There is no such train'
      else
        index_of_train = index_of_obj(@@all_trains, needed_train[0])
        @@all_trains[index_of_train].each do |carriage|
          puts "##{carriage.number} | type - #{carriage.type} free places - #{carriage.free_places} | taken places - #{carriage.taken_places}"
        end
      end
    end

    def take_place_in_carriage
      train_number = train_number_from_user
      needed_train = search_obj(@@all_trains, train_number, :train)
      if needed_train[0].nil?
        puts 'There is no such train'
      else
        puts "Enter number of carriage:"
        carriage_number = gets.chomp.to_i
        index_of_train = index_of_obj(@@all_trains, needed_train[0])
        @@all_trains[index_of_train].each do |carriage|
          if carriage.number == carriage_number
            carriage.take_place
            puts 'Successfully done!'
            break
          end
          puts 'There is no such carriage!'
        end
      end
    end

    private

    def info
      puts '-----------------------------
      Select what you want to do:
      1 - Create station
      2 - Create train
      3 - Add carriage to train
      4 - Remove carriage from train
      5 - Add train to station
      6 - Display stations and trains in them
      7 - Display carriages in train
      8 - Take place in the passenger carraige or increase volume in cargo
      9 - Exit'
      action = gets.chomp.to_i
      call_action(action)
    end

    def call_action(action)
      case action
      when 1
        create_station
      when 2
        create_train
      when 3
        add_carriage_to_train
      when 4
        remove_carriage_from_train
      when 5
        add_train_to_station
      when 6
        display_station_trains
      when 7
        display_train_carriages
      when 8
        take_place_in_carriage
      else
        return
      end
      info
    end

    def train_number_from_user
      puts 'Enter train number(123-12):'
      gets.chomp
    end

    def station_name_from_user
      puts 'Enter station name:'
      gets.chomp
    end

    def search_obj(search_array, search_obj, obj_type)
      case obj_type
      when :train
        search_array.select { |train| train.number == search_obj }
      when :station
        search_array.select { |station| station.name == search_obj }
      end
    end

    def index_of_obj(search_array, obj)
      search_array.rindex(obj)
    end
  end
end

Main.call
