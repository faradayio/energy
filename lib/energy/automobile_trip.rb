module Energy
  class AutomobileTrip < Consumer
    attr_accessor :make
    attr_accessor :model
    attr_accessor :distance
    
    emit_as :automobile_trip do
      provide :make
      provide :model
      provide :distance
    end
    
    def initialize(attrs = {}) # :nodoc:
      attrs = attrs.symbolize_keys
      @make = attrs[:make]
      @model = attrs[:model]
      @distance = attrs[:distance]
    end

    class << self
      # Estimate the fuel used by an automobile trip given any of the following optional characteristics:
      # * <tt>make</tt> - "nissan"
      # * <tt>model</tt> - "altima"
      # * <tt>distance</tt> - 500 (kilometres)
      # See http://carbon.brighterplanet.com/models/rail_trip for more details
      def fuel_use(attrs = {})
        estimate :fuel_use, attrs
      end
    end
  end
end
