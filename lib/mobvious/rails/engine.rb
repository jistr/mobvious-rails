module Mobvious
module Rails
  # Definition of this class makes this gem a Rails engine, enabling
  # providing assets that can be used in the application.
  class Engine < ::Rails::Engine
    if ::Rails.version >= '3.1'
      initializer 'mobvious-rails.assets' do |config|
        ::Rails.application.config.assets.precompile += %w( mobvious-rails.js )
      end
    end
  end
end
end
