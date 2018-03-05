module VagrantPlugins
  module OVA
    class Plugin < Vagrant.plugin('2')
      name 'OVA'
      description <<-DESC
        This plugin output *.ova.
      DESC

      command(:ova) do
        setup_i18n
        require_relative 'command'
        Command
      end

      def self.setup_i18n
        I18n.load_path << File.expand_path('../../../locales/en.yml', __FILE__)
        I18n.reload!
      end
    end
  end
end
