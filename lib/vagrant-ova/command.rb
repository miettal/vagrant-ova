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

          date_str = DateTime.now.strftime("%Y%m%d%H%M")
          filename = machine.name + date_str + ".ova"

          run "VBoxManage modifyvm " + machine.id +  " --uartmode1 disconnected"
          run "VBoxManage sharedfolder remove " + machine.id + " --name vagrant"
          run "VBoxManage export " + machine.id + " --output " + filename
        end

        # Success, exit status 0
        0
      end
    end
  end
end
