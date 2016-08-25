ZII_SRCDIR = /home/vivien/Code
ZII_HOST = steveo

#IPROUTE2_OVERRIDE_SRCDIR = $(ZII_SRCDIR)/iproute2
LINUX_OVERRIDE_SRCDIR = $(ZII_SRCDIR)/linux
LLDPD_OVERRIDE_SRCDIR = $(ZII_SRCDIR)/lldpd
MSTPD_OVERRIDE_SRCDIR = $(ZII_SRCDIR)/mstpd
TCPDUMP_OVERRIDE_SRCDIR = $(ZII_SRCDIR)/tcpdump

zii-upload-images:
	@$(call MESSAGE,"Uploading images to ${ZII_HOST}...")
	scp output/images/{uImage,vf610-zii-dev-rev-b.dtb} ${ZII_HOST}:/srv/tftp

zii-reboot:
	@$(call MESSAGE,"Rebooting target...")
	ssh ${ZII_HOST} /root/bin/relay pulse
	#sleep 30

zii: zii-upload-images zii-reboot
