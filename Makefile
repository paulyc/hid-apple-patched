
#LINUX_HEADER_DIR ?= /usr/src/linux-headers-$(shell uname -r)
LINUX_HEADER_DIR ?= /lib/modules/$(shell uname -r)/build

#ccflags-y += -I /lib/modules/$(shell uname -r)/build/include/config/keyboard

obj-$(CONFIG_HID_APPLE)			+= hid-apple.o
#obj-$(CONFIG_KEYBOARD_APPLESPI)	+= applespi.o

all:
	make -C $(LINUX_HEADER_DIR) M=$(CURDIR) modules

clean:
	make -C $(LINUX_HEADER_DIR) M=$(CURDIR) clean

install:
	make -C $(LINUX_HEADER_DIR) M=$(CURDIR) modules_install
