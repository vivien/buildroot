################################################################################
#
# mstpd
#
################################################################################

MSTPD_VERSION = 61
MSTPD_SITE = svn://svn.code.sf.net/p/mstpd/code/trunk
MSTPD_LICENSE = GPLv2
MSTPD_LICENSE_FILES = LICENSE

define MSTPD_BUILD_CMDS
	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
endef

define MSTPD_INSTALL_TARGET_CMDS
	$(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
endef

$(eval $(generic-package))
