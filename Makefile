ifneq ($(KERNELRELEASE),)
	obj-m := hello.o

else
	# this has to be directory where the running kernel
	# was built, i.e. where all the object files are,
	# so that they can be linked to
	#KERNELDIR ?= /lib/modules/$(shell uname -r)/build
	KERNELDIR ?= ~/projects/linux-3.6.10/linux-3.6.10
	PWD := $(shell pwd)

default:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

endif
