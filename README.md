# gtp5g - 5G compatible GTP kernel module
gtp5g is a customized Linux kernel module gtp5g to handle packet by PFCP IEs such as PDR and FAR.
For detailed information, please reference to 3GPP specification TS 29.281 and TS 29.244.

## Notice
Due to the evolution of Linux kernel, this module would not work with every kernel version.
Please run this module with kernel version `5.0.0-23-generic` or upper than `5.4` (Ubuntu 20.04).

Please check the [libgtp5gnl](https://github.com/PrinzOwO/libgtp5gnl) version is the same as gtp5g,
because the type translating between libgtp5gnl and gtp5g had been changed.

## Usage
### Compile
```
make clean && make
```

### Install kernel module
Install the module to the system and load automatically at boot
```
sudo make install
```

### Remove kernel module
Remove the kernel module from the system
```
sudo make uninstall
```

## Change Log
### v0.2.0
+ Changed to host type between gtp5g and libgtp5gnl
+ Supported forwarding policy feature, but need to set ip rule and ip route with Linux mark by self
+ Fixed bugs about "any" and "assigned" in SDF filter
### v0.1.0
+ First version
+ Supported packet matching about UE IP, TEID and SDF filter
+ Auto process packet by PDR/FAR