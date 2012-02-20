if window.Mobvious == undefined
  window.Mobvious = {}

Mobvious.for_device_type = (wanted_device_type, fn) ->
  if Mobvious.device_type == wanted_device_type
    return fn()
