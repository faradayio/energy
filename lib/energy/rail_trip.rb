module Energy
  class RailTrip < Consumer
    attr_accessor :distance
    attr_accessor :rail_class
    
    emit_as :rail_trip do
      provide :distance, :as => :distance_estimate
      provide :rail_class
    end
    
    def initialize(attrs = {}) # :nodoc:
      attrs = attrs.symbolize_keys
      @distance = attrs[:distance]
      @rail_class = attrs[:rail_class]
    end
    
    class << self
      # Estimate the diesel consumed by a rail trip given any of the following optional characteristics:
      # * <tt>distance</tt> - 500 (kilometres)
      # * <tt>rail_class</tt> - "intercity"
      # See http://carbon.brighterplanet.com/models/rail_trip for more details
      def fuel_use(attrs = {})
        estimate :diesel_consumed, attrs
      end
    end
  end
end
