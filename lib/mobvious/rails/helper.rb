module Mobvious
module Rails
  module Helper
    def device(wanted_device_type)
      unless block_given?
        raise ArgumentError, "Device helper takes a block of content to render for given device."
      end

      unless device_type
        raise "Mobvious device type not set. Did you add the Mobvious rack middleware?"
      end

      if wanted_device_type.to_sym == device_type
        yield
      end
      nil
    end

    def device_type
      request.env['mobvious.device_type']
    end
  end
end
end
