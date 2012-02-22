if window.Mobvious == undefined
  window.Mobvious = {}

Mobvious.for_device_type = (args...) ->
  callback_fn = args[args.length - 1]
  wanted_device_types = args[0..(args.length - 2)]

  for wanted_device_type in wanted_device_types
    return callback_fn() if Mobvious.device_type == wanted_device_type

  null
