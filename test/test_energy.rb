# -*- encoding: utf-8 -*-
require 'helper'

Energy.config[:key] = '456'

class TestEnergy < Test::Unit::TestCase
  def test_001_automobile_trip_fuel_use
    assert (1.5..3).include?(Energy::AutomobileTrip.fuel_use)
    assert(Energy::AutomobileTrip.fuel_use(:make => 'Bentley') > Energy::AutomobileTrip.fuel_use(:make => 'Smart'))
  end
  
  def test_002_flight_fuel_use
    assert (18910..18920).include?(Energy::Flight.fuel_use)
    assert(Energy::Flight.fuel_use(:origin_airport => 'MSN', :destination_airport =>'IAH') > Energy::Flight.fuel_use(:origin_airport => 'MSN', :destination_airport =>'ORD'))
  end
  
  def test_003_rail_trip_fuel_use
    assert (1640..1642).include?(Energy::RailTrip.fuel_use(:distance => 400, :rail_class => 'intercity'))
    assert(Energy::RailTrip.fuel_use(:distance => 400) > Energy::RailTrip.fuel_use(:distance => 300))
  end
  
  def test_004_flight_meta_fuel_efficiency
    # american eagle's fuel efficiency is higher than continental's because we're not taking passengers into account
    assert(Energy::Flight.fuel_efficiency(:airline => 'american eagle') > Energy::Flight.fuel_efficiency(:airline => 'continental airlines'))
  end
end
