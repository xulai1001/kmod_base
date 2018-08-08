KDIR = /lib/modules/$(shell uname -r)/build
SRCDIR = /usr/src/kernels/$(shell uname -r)/
PWD = $(shell pwd)
MODNAME = kmod_base

obj-m :=  $(MODNAME).o

modules:
	make -C $(KDIR) M=$(PWD) modules
    
clean:
	rm -rf *.o .depend .*.cmd *.ko *.mod.c .tmp_versions Module* modules*
    
load:
	insmod $(MODNAME).ko
	dmesg | tail -n 10
    
unload:
	rmmod $(MODNAME)
	dmesg | tail -n 10
	
sign:
	$(SRCDIR)/scripts/sign-file sha512 sign/signing_key.priv sign/signing_key.x509 $(MODNAME).ko
    
default: modules
.PHONY: clean

