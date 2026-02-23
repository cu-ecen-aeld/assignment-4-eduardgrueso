##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_CHAR_DRIVER_VERSION = '02dbfbc64324f7f92b84b2b6a97859692382f8dd'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_CHAR_DRIVER_SITE = 'git@github.com:cu-ecen-aeld/assignment-8-eduardgrueso.git'
AESD_CHAR_DRIVER_SITE_METHOD = git
AESD_CHAR_DRIVER_GIT_SUBMODULES = YES
AESD_CHAR_DRIVER_MODULE_SUBDIRS = aesd-char-driver/
AESD_CHAR_DRIVER_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

AESD_CHAR_DRIVER_DEPENDENCIES = linux

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_CHAR_DRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))
