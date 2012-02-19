require 'spec_helper'
require 'mobvious/rails/view_helper'

module Mobvious
module Rails
class ViewHelperSpec < MiniTest::Spec
  describe ViewHelper do
    before do
      @helper = Object.new
      @request = mock 'request'
      @env = mock 'env'
      @env.stubs('[]').with('mobvious.device_type').returns(:mobile)
      @request.stubs(:env).returns(@env)

      mock_request = @request
      @helper.extend ViewHelper
      @helper.define_singleton_method(:request) do
        mock_request
      end
    end

    it "runs the provided block only for corresponding device type" do
      mobile_block_executed = false
      desktop_block_executed = false

      @helper.device :mobile do
        mobile_block_executed = true
      end
      @helper.device :desktop do
        desktop_block_executed = true
      end

      mobile_block_executed.must_equal true
      desktop_block_executed.must_equal false
    end
  end
end
end
end
