module VagrantPlugins
  module OVA
    class OVAError < Vagrant::Errors::VagrantError
      error_namespace("vagrant-ova.errors")
    end

    class Command < Vagrant.plugin("2", :command)
      include Vagrant::Util::SafePuts

      def self.synopsis
        "output *.ova"
      end

      def execute
        opts = OptionParser.new do |o|
          o.banner = "Usage: vagrant ova"
        end

        argv = parse_options(opts)
        return if !argv

        with_target_vms(argv) do |machine|
          if machine.state.id == :running
            raise OVAError.new :vm_is_running
          elsif machine.provider_name != :virtualbox
            raise OVAError.new :provider_not_supported
          end

          system "VBoxManage modifyvm " + machine.id +  " --uartmode1 disconnected"
          system "VBoxManage sharedfolder remove " + machine.id + " --name vagrant"
          system "VBoxManage export " + machine.id + " --output " + machine.name.id2name + ".ova"
        end

        # Success, exit status 0
        0
      end
    end
  end
end
