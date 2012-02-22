module Mobvious
module Rails
  # A module holding Rails view helper extensions.
  #
  # Just put `include Mobvious::Rails::Helper` into your `ApplicationHelper`.
  module Helper
    # Executes a block of code only when a request was made by a given client device type.
    #
    # Example:
    #
    #     <% for_device_type :mobile do %>
    #       <p>This gets rendered only on mobile phones.</p>
    #     <% end %>
    #
    # @param wanted_device_type a symbol identifying a device type
    # @yield a block to execute if the specified device type matches device type of the
    #   current request
    # @return value that the yielded block returns, or nil if it didn't get executed
    def for_device_type(*wanted_device_types)
      unless block_given?
        raise ArgumentError, "Device helper takes a block of content to render for given device."
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

    # Forms a `<script>` tag setting JavaScript variable `window.Mobvious.device_type`
    # to a string holding current request's device type. You can then use
    # `Mobvious.device_type` in all your JavaScripts to get this value.
    #
    # Example:
    #
    #     <head>
    #       <%= mobvious_javascript %>
    #
    #       <script type="text/javascript">
    #         alert(Mobvious.device_type); // this will print 'mobile' or 'desktop' or similar
    #       </script>
    #     </head>
    #
    # @return [String] script tag that sets Mobvious variables (returned string is html_safe)
    def mobvious_javascript
      <<-END.html_safe
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
