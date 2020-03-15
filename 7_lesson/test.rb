require './modules/module_manufacturer'
require './modules/module_instance_counter'
require './modules/module_validation'
require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'carriage'
require_relative 'cargo_carriage'
require_relative 'passenger_carriage'
require_relative 'interface'

describe Route do
  before do
    station1 = Station.new("Moscow")
    station2 = Station.new("Kaliningrad")
    @route = Route.new(station1, station2)
    @station3 = Station.new("Svetlogors")
  end

  describe "when add station to the route" do
    before do
      @route.add_station(@station3)
    end

    it "should have station in intermediate_stations attribute." do
      expect(@route.intermediate_stations).to include(@station3)
    end
  end

  describe "when remove station from the route" do
    before do
      @route.add_station(@station3)

      @route.remove_station(@station3)
    end

    it "should remove station from intermediate_stations attribute." do
      expect(@route.intermediate_stations).to be_empty
    end
  end

  describe "when call list of all stations" do
    before do
      @route.add_station(@station3)
    end

    it "should return list of all stations including start,end and intermediate" do
      station_list = @route.stations_list

      expect(station_list).to include(@station3)
      # expect(station_list).to include(@station2)
      # expect(station_list).to include(@station1)
    end
  end

end
