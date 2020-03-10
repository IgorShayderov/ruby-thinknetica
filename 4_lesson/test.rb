require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'carriage'
require_relative 'cargo_carriage'
require_relative 'passenger_carriage'
require_relative 'interface'

require 'minitest/autorun'

describe Route do
  before do
    station1 = Station.new("Moscow")
    station2 = Station.new("Kaliningrad")
    @route = Route.new(station1, station2)
  end

  describe "when add station to the route" do
    before do
      @station3 = Station.new("Svetlogors")

      @route.add_station(@station3)
    end
    it "should have station in intermediate_stations attribute." do
      @route.intermediate_stations.must_include(@station3)
    end
  end

    describe "when remove station from the route" do
    before do
      @station3 = Station.new("Svetlogors")
      @route.add_station(@station3)

      @route.remove_station(@station3)
    end
    it "should remove station from intermediate_stations attribute." do
      @route.intermediate_stations.must_be_empty
    end
  end

end
