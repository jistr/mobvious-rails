require_relative '../../spec_helper'
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
      multiple_block_executed = false

      mobile_retval = @helper.for_device_type :mobile do
        mobile_block_executed = true
        :mobile_retval
      end
      mobile_block_executed.must_equal true
      mobile_retval.must_equal :mobile_retval

      desktop_retval = @helper.for_device_type :desktop do
        desktop_block_executed = true
        :desktop_retval
      end
      desktop_block_executed.must_equal false
      desktop_retval.must_equal nil

      multiple_retval = @helper.for_device_type :desktop, :tablet do
        multiple_block_executed = true
        :multiple_retval
      end
      multiple_block_executed.must_equal false
      multiple_retval.must_equal nil

      multiple_retval = @helper.for_device_type :desktop, :mobile do
        multiple_block_executed = true
        :multiple_retval
      end
      multiple_block_executed.must_equal true
      multiple_retval.must_equal :multiple_retval
    end

    it "returns current device type" do
      @helper.device_type.must_equal :mobile
    end

    it "generates javascript tag with device type" do
      device_type_assignment = /window.Mobvious.device_type = 'mobile';/
      @helper.mobvious_javascript.must_match device_type_assignment
      @helper.mobvious_javascript.must_be :'html_safe?'
    end
  end
end
end
end
