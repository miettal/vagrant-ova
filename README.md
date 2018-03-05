# vagrant-ova

## how to install

    $ git clone https://github.com/miettal/vagrant-ova.git
    $ cd vagrant-ova
    $ rake build
    $ vagrant plugin install ./pkg/vagrant-ova-[version].gem

## how to use
    $ cd path-to-vagrantfile-directory
    $ ls
    Vagrantfile
    $ vagrant up # if you didnt create VM yet
    $ vagrant halt # if you didnt shutdown VM yet
    $ vagrant ova
    0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
    Successfully exported 1 machine(s).
    $ ls
    Vagrantfile  vm-name.ova
