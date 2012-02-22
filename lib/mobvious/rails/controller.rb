module Mobvious
module Rails
  # A module holding Rails controller extensions.
  #
  # Just put `include Mobvious::Rails::Controller` into your `ApplicationController`.
  module Controller
    # Executes a block of code only when a request was made by a given client device type.
    #
    # Example:
    #
    #     for_device_type :mobile do
    #       logger.info "This gets executed only for mobile phones."
    #     end
    #
    # @param wanted_device_type a symbol identifying a device type
    # @yield a block to execute if the specified device type matches device type of the
    #   current request
    # @return value that the yielded block returns, or nil if it didn't get executed
    def for_device_type(*wanted_device_types)
      unless block_given?
        raise ArgumentError, "Device helper takes a block of code to execute for given device."
      end

      unless device_type
        raise "Mobvious device type not set. Did you add the Mobvious rack middleware?"
      end

      if wanted_device_types.include? device_type
        yield
      else
        nil
      end
    end

    # @return [Symbol] device type for current request
    def device_type
      request.env['mobvious.device_type']
    end
  end
end
end
