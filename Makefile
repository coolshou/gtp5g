PWD := $(shell pwd)
KVER ?= $1
ifeq ($(KVER),)
	KVERSION := $(shell uname -r)
else
	KVERSION := $(KVER)
endif
INCLUDE_DIR = /usr/src/linux-headers-$(KVERSION)/
INSTALL_DIR = /lib/modules/$(KVERSION)/kernel/drivers/net/

CONFIG_MODULE_SIG=n
MODULE_NAME = gtp5g
obj-m := $(MODULE_NAME).o

all:
	make -C $(INCLUDE_DIR) M=$(PWD) modules
clean:
	make -C $(INCLUDE_DIR) M=$(PWD) clean

install:
	# modprobe udp_tunnel
	# insmod $(MODULE_NAME).ko
	@cp $(MODULE_NAME).ko $(INSTALL_DIR)
	@/sbin/depmod -a ${KVERSION}
uninstall:
	# rmmod $(MODULE_NAME)
	@rm $(INSTALL_DIR)$(MODULE_NAME).ko
	@/sbin/depmod -a ${KVERSION}
