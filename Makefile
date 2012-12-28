ifneq ($(KERNELRELEASE),)
	obj-m := hello.o

else
	# As far as the testing system is running the kernel
	# built from the source, the following line always
	# points to the kernel source directory, even, e.g.,
	# the place looks not that beautiful like this:
	# /home/hunter/projects/linux-3.6.10/linux-3.6.10

	KERNELDIR ?= /lib/modules/$(shell uname -r)/build
	PWD := $(shell pwd)

default:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

endif
