module Energy
  class Flight < Consumer
    attr_accessor :airline
    attr_accessor :aircraft
    attr_accessor :origin_airport
    attr_accessor :destination_airport
    attr_accessor :segments_per_trip
    
    emit_as :flight do
      provide :airline
      provide :aircraft
      provide :origin_airport
      provide :destination_airport
      provide :segments_per_trip
    end
    
    def initialize(attrs = {}) # :nodoc:
      attrs = attrs.symbolize_keys
      @airline = attrs[:airline]
      @aircraft = attrs[:aircraft]
      @origin_airport = attrs[:origin_airport]
      @destination_airport = attrs[:destination_airport]
      @segments_per_trip = attrs[:segments_per_trip] || 1
    end
    
    class << self
      # Estimate the fuel used by a flight given any of the following optional characteristics:
      # * <tt>airline</tt> - "american eagle"
      # * <tt>aircraft</tt> - "b747"
      # * <tt>origin_airport</tt> - "msn"
      # * <tt>destination_airport</tt> - "iah"
      # * <tt>segments_per_trip</tt> - 1 (defaults to 1 to force calculation as a one-segment trip)
      # See http://carbon.brighterplanet.com/models/flight for more details
      def fuel_use(attrs = {})
        estimate :fuel_use, attrs
      end

      # Estimate the fuel efficiency (length / volume, not taking into account passengers) of a flight given any of the following optional characteristics:
      # * <tt>airline</tt> - "american eagle"
      # * <tt>aircraft</tt> - "b747"
      # * <tt>origin_airport</tt> - "msn"
      # * <tt>destination_airport</tt> - "iah"
      # * <tt>segments_per_trip</tt> - 1 (defaults to 1 to force calculation as a one-segment trip)
      # See http://carbon.brighterplanet.com/models/flight for more details      
      def fuel_efficiency(attrs = {})
        d = estimate(:distance, attrs)
        f = estimate(:fuel_use, attrs)
        d / f
      end
    end
  end
end
