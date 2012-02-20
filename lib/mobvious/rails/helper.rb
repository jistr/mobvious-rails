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
      else
        nil
      end
    end

    def device_type
      request.env['mobvious.device_type']
    end

    def mobvious_javascript
      script = <<-END
        <script type="text/javascript">
        if (window.Mobvious === undefined) {
          window.Mobvious = {};
        }
        window.Mobvious.device_type = '#{device_type.to_s}';
        </script>
      END
    end
  end
end
end
