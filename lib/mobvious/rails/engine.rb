module Mobvious
module Rails
  # Definition of this class makes this gem a Rails engine, enabling
  # providing assets that can be used in the application.
  class Engine < ::Rails::Engine
    initializer 'mobvious-rails.assets' do |config|
      ::Rails.application.config.assets.precompile.unshift 'mobvious-rails.js'
    end
  end
end
end
