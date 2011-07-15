require 'singleton'
module Energy
  class Config < ::Hash # :nodoc:
    include ::Singleton
  end
end
