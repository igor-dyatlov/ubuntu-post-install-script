# Ubuntu Post Install Script
This project provides a set of shell scripts to be run after a fresh install of an Ubuntu(-based) OS. It will install your favourite applications, set your preferred settings, etc.

## Thanks
Thanks to [Sam Hewitt] (https://github.com/snwh) for the script [based](https://github.com/snwh/ubuntu-post-install).

## Usage
Run in the console for install tool Git:
    
Optionally, you can add a third-party repository `sudo add-apt-repository ppa:git-core/ppa` to install a newer version

    sudo apt-get update
    sudo apt-get install git

Run in the console:

    git clone https://github.com/igor-dyatlov/ubuntu-post-install-script.git
    
Alternatively you can [download](https://github.com/igor-dyatlov/ubuntu-post-install-script/archive/master.zip) this repository.

Select the folder `English` or `Russian`:

    cd English/

Run from source folder:

    ./start.sh

## Note 
The included [preferences](English/functions/configure) and [lists of packages](English/data) are those of the original author, you will have to change them to suit yourself.

### Features
 - Update system [update](English/functions/update)
 - Cleaning system [cleanup](English/functions/cleanup)
 - Configure system [configure](English/functions/configure)
 - Upgrading the kernel [kernel](English/functions/kernel)
 - Install the program in two steps [lists of packages](English/data)
 - Speed Up system [speedup](English/functions/speedup)
 - Support for [Russian](Russian) localization

## Screenshots

<a href="https://play.google.com/store/apps/details?id=ru.igor.dyatlov.appbox.free" target="_blank">
  <img
       src="" height="60" src="" height="60" src="" height="60" src="" height="60" src="" height="60"/>
</a>

![Image](https://github.com/igor-dyatlov/ubuntu-post-install-script/blob/master/Screenshot/Screenshot_1.png)

### Donation
https://www.paypal.me/IgorDyatlov 

### License
All files in this project are under the [LICENSE.md](LICENSE.md) license unless otherwise stated in the file or by a dependency's license file.
