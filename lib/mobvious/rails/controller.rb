module Mobvious
module Rails
  module Controller
    def for_device_type(wanted_device_type)
      unless block_given?
        raise ArgumentError, "Device helper takes a block of code to execute for given device."
      end

      unless device_type
        raise "Mobvious device type not set. Did you add the Mobvious rack middleware?"
      end

      if wanted_device_type.to_sym == device_type
        yield
      else
        nil
      end
    end

    def device_type
      request.env['mobvious.device_type']
    end
  end
end
end
