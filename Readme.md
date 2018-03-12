# Vagrant-Docker-optimized-virtual-machine

You wanna dev with Linux, but have a Windows at your job ?
Docker for Windows 10 is to slow ?
You don't even have Windows 10, you use W7/8 ? And its boring ?!

I understand you !

This Project is for you. To help you !

You will be able to run Docker on every Windows from 7 to 10. Use Docker compose is easy.

And... this will be faster than Docker For Windows 10 official solution ! (that is just a simple VM based solution with Hyper-v...)

This VM will run Docker and permit you to code on your Windows 7/8/8.1/10 host.

## Requirements

* Terminal (babun or WSL recommended),
* VirtualBox,
* Vagrant.

## Installation
To install VM just go into this project vagrant directory, and run : 
```bash vagrant-install.sh```

Go drink a good coffee during 5-10 minutes while system install and configure your VM.

Once done, the install script will advert you that install is finished !

You can run dockerized app with faster and easier solution !

## TroubleShooting
### Proxy
If you use a proxy at job (or home) : Make sure you have configured proxy access on your host to permit the download of vagrant plugins, box, docker requirements.

### VirtualBox stability & vbguest...
VirtualBox permit to run VM, Vagrant permit to use it on command line, but it's frequent that you must uninstall & reinstall another version of virtualbox.

Yes VirtualBox is a bit unstable depending on version... Most of time you will have with it a vbguest error ! (tech. for sharing Windows folders)

So don't break your mind, its not your fault, no luck that's all ! Try again with another version !

## Usages
To run your VM, just run ```vagrant up``` in vagrant folder.

To connect to your VM just run ```vagrant ssh``` in vagrant folder. When connected you can do your linux jobs like use Docker :)

To shutdown your VM just run ```vagrant halt``` in vagrant folder.

Think to always shutdown your VM if you don't wanna break it !

## Explanation
All of this is possible with VirtualBox, Vagrant, yes, but but especially with [WinNFSd](https://github.com/winnfsd/winnfsd "WinNFSd") & it vagrant implementation plugin [Vagrant WinNFSd](https://github.com/winnfsd/vagrant-winnfsd "Vagrant WinNFSd") who speed up sharing time between Host (Windows) & guest (VM) ! Special Thanks to them !

It's trully time saving with apps like Symfony2/3/4 based App.

The Docker, docker-engine and docker-compose will be automatically installed on your VM.
YourCompany Docker containers can contact the mysql on VM, so it is open to external connections (Docker and his host, the VM, don't share the same network).

You can access to PhpMyAdmin of VM (wich is a LAMP stack) on _192.168.33.25_ in your Windows web browser.
When you run a docker container, your project is accessible on `192.168.33.25:<port-configurated>`

Simply make it accessible with your Windows host :
   ` In C:Windows\System32\drivers\etc\hosts`
    
    
    192.168.33.25 pma.vagrant.local
    192.168.33.25 <yourProject/Company>.local
## WSL Bonus
If you use WSL but wanna use this solution or Vagrant generally without use an instable LAMP on WSL (we cannot use Docker too T.T).

An very simple cheat to call Vagrant is to do this :
Add `C:\HashiCorp\Vagrant\bin` or your install directory of Vagrant on you Windows PATH var.

You can after this (and restart of WSL if open) call vagrant with `vagrant.exe` command.
The automatic SSH connection under `vagrant ssh` command doesn't work.

So for it in ZSH for example edit `~/.ssh/config`
and add :
    
    Host vagrant
            HostName 127.0.0.1
            Port 2222
            User vagrant
            IdentityFile /mnt/<your-disk-like-C-or-D>/<yourPathToThisProject>/vagrant/.vagrant/machines/default/virtualbox/private_key
    
And use `ssh vagrant` ;)

Be careful its work if the VM has already been started once !
## Conclusion
It's not as good as having a true Linux Computer. But It's better and more comfortable if you can't or don't want to leave Windows !

# Enjoy !
