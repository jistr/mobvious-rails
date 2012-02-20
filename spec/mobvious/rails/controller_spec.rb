require 'spec_helper'
require 'mobvious/rails/controller'

module Mobvious
module Rails
class ControllerSpec < MiniTest::Spec
  describe Controller do
    before do
      @env = mock 'env'
      @env.stubs('[]').with('mobvious.device_type').returns(:mobile)

      @request = mock 'request'
      @request.stubs(:env).returns(@env)
      mock_request = @request

      @controller = Object.new
      @controller.extend Controller
      @controller.define_singleton_method(:request) do
        mock_request
      end
    end

    it "runs the provided block only for corresponding device type" do
      mobile_block_executed = false
      desktop_block_executed = false

      mobile_retval = @controller.for_device_type :mobile do
        mobile_block_executed = true
        :mobile_retval
      end
      mobile_block_executed.must_equal true
      mobile_retval.must_equal :mobile_retval

      desktop_retval = @controller.for_device_type :desktop do
        desktop_block_executed = true
        :desktop_retval
      end
      desktop_block_executed.must_equal false
      desktop_retval.must_equal nil
    end

    it "returns current device type" do
      @controller.device_type.must_equal :mobile
    end
  end
end
end
end
