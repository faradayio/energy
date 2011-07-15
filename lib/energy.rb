require "energy/version"
require 'active_support/core_ext'

module Energy
  autoload :AutomobileTrip, 'energy/automobile_trip'
  autoload :Config, 'energy/config'
  autoload :Consumer, 'energy/consumer'
  autoload :Flight, 'energy/flight'
  autoload :RailTrip, 'energy/rail_trip'
  
  # Set configuration variables like
  #
  #     Energy.config[:key] = '456'
  #
  # You can get your key at http://keys.brighterplanet.com
  def self.config
    Config.instance
  end
end
