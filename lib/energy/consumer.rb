require 'carbon'

module Energy
  class Consumer # :nodoc:
    include ::Carbon
    class << self
      private
      
      # Use CM1 to get an energy consumption estimate
      def estimate(k, attrs = {})
        attrs = attrs.symbolize_keys
        timeframe = attrs.delete(:timeframe) || ::Timeframe.this_year
        emitter_instance = new attrs
        emission_estimate = emitter_instance.emission_estimate(:timeframe => timeframe, :key => Config.instance[:key])
        emission_estimate.send k
      end
    end
  end
end
