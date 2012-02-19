module Mobvious
module Rails
  module ViewHelper
    def device(device_type)
      unless block_given?
        raise ArgumentError, "Device helper takes a block of content to render for given device."
      end

      current_device_type = request.env['mobvious.device_type']
      unless current_device_type
        raise "Mobvious device type not set. Did you add the Mobvious rack middleware?"
      end

      if device_type.to_sym == current_device_type
        yield
      end
      nil
    end
  end
end
end
