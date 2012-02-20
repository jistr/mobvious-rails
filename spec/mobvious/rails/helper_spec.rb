require 'spec_helper'
require 'mobvious/rails/helper'

module Mobvious
module Rails
class HelperSpec < MiniTest::Spec
  describe Helper do
    before do
      @env = mock 'env'
      @env.stubs('[]').with('mobvious.device_type').returns(:mobile)

      @request = mock 'request'
      @request.stubs(:env).returns(@env)
      mock_request = @request

      @helper = Object.new
      @helper.extend Helper
      @helper.define_singleton_method(:request) do
        mock_request
      end
    end

    it "runs the provided block only for corresponding device type" do
      mobile_block_executed = false
      desktop_block_executed = false

      mobile_retval = @helper.device :mobile do
        mobile_block_executed = true
        :mobile_retval
      end
      mobile_block_executed.must_equal true
      mobile_retval.must_equal :mobile_retval

      desktop_retval = @helper.device :desktop do
        desktop_block_executed = true
        :desktop_retval
      end
      desktop_block_executed.must_equal false
      desktop_retval.must_equal nil
    end

    it "returns current device type" do
      @helper.device_type.must_equal :mobile
    end

    it "generates javascript tag with device type" do
      device_type_assignment = /window.Mobvious.device_type = 'mobile';/
      @helper.mobvious_javascript.must_match device_type_assignment
    end
  end
end
end
end
