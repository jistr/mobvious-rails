describe 'Mobvious', ->
  beforeEach ->
    window.Mobvious = {} if window.Mobvious == undefined
    window.Mobvious.device_type = 'mobile'

  describe 'for_device_type', ->
    it 'should run only for the right device types', ->
      mobile_block_executed = false
      desktop_block_executed = false
      multiple_block_executed = false

      mobile_retval = Mobvious.for_device_type 'mobile', ->
        mobile_block_executed = true
        'mobile_retval'
      expect(mobile_block_executed).toEqual true
      expect(mobile_retval).toEqual 'mobile_retval'

      desktop_retval = Mobvious.for_device_type 'desktop', ->
        desktop_block_executed = true
        'desktop_retval'
      expect(desktop_block_executed).toEqual false
      expect(desktop_retval).toEqual null

      multiple_retval = Mobvious.for_device_type 'desktop', 'tablet', ->
        multiple_block_executed = true
        'multiple_retval'
      expect(multiple_block_executed).toEqual false
      expect(multiple_retval).toEqual null

      multiple_retval = Mobvious.for_device_type 'desktop', 'mobile', ->
        multiple_block_executed = true
        'multiple_retval'
      expect(multiple_block_executed).toEqual true
      expect(multiple_retval).toEqual 'multiple_retval'

    it 'should only run once', ->
      block_executed_times = 0

      multiple_retval = Mobvious.for_device_type 'desktop', 'mobile', ->
        block_executed_times += 1
        'multiple_retval'
      expect(block_executed_times).toEqual 1
      expect(multiple_retval).toEqual 'multiple_retval'
