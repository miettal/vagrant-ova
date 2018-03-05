require "vagrant-ova/version"
require "vagrant-ova/plugin"

module VagrantPlugins
  module OVA
    def self.source_root
      @source_root ||= Pathname.new(File.expand_path('../../', __FILE__))
    end
  end
end
