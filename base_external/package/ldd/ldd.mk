##############################################################
#
# LDD package – builds misc-modules and scull from assignment-7 repo
#
##############################################################

LDD_VERSION = '285ba10d33405409220d4c3611277bb683a52a78'
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-eduardgrueso.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

# Submodules
LDD_MODULE_SUBDIRS = scull misc-modules

LDD_LICENCE = GPL-2.0
LDD_DEPENDENCIES = linux

# build submodule
define LDD_BUILD_CMDS

       $(MAKE)  -C $(LINUX_DIR) \
                 M=$(@D) \
                 MODULE_SUBDIRS="$(addprefix $(@D)/, $(LDD_MODULE_SUBDIRS))" \
                 $(LINUX_MAKE_FLAGS) modules
endef

# Install all built files
define LDD_INSTALL_TARGET_CMDS

         $(MAKE) -C $(LINUX_DIR) \
                 M=$(@D) \
                 MODULE_SUBDIRS="$(addprefix $(@D)/, $(LDD_MODULE_SUBDIRS))" \
                 $(LINUX_MAKE_FLAGS)  \
                 INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
endef


$(eval $(kernel-module))
$(eval $(generic-package))