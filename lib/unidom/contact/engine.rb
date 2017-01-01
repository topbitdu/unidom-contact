module Unidom
  module Contact

    class Engine < ::Rails::Engine

      include Unidom::Common::EngineExtension

      isolate_namespace Unidom::Contact

      enable_initializer enum_enabled: false, migration_enabled: true

    end

  end
end
