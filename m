Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E30C184799
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 10:37:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvHMQ-0000hI-Ke; Wed, 07 Aug 2019 08:31:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DvAo=WD=bt.com=tony.nguyen@srs-us1.protection.inumbo.net>)
 id 1hvHLp-0000dv-Op
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 08:31:17 +0000
X-Inumbo-ID: b7a9a16f-b8ed-11e9-8980-bc764e045a96
Received: from smtpe1.intersmtp.com (unknown [213.121.35.72])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b7a9a16f-b8ed-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 08:31:14 +0000 (UTC)
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 BWP09926077.bt.com (10.36.82.108) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 09:30:51 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 7 Aug 2019 09:31:09 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 7 Aug 2019
 09:31:09 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v6 15/26] build: Correct non-common
 common-obj-* to obj-*
Thread-Index: AQHVTPp2fql1698oXk26QyWmjOBfjA==
Date: Wed, 7 Aug 2019 08:31:09 +0000
Message-ID: <1565166668830.25608@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.44]
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 07 Aug 2019 08:31:48 +0000
Subject: [Xen-devel] [Qemu-devel] [PATCH v6 15/26] build: Correct non-common
 common-obj-* to obj-*
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 cohuck@redhat.com, sagark@eecs.berkeley.edu, david@redhat.com,
 jasowang@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 i.mitsyanko@gmail.com, keith.busch@intel.com, jcmvbkbc@gmail.com,
 frederic.konrad@adacore.com, dmitry.fleytman@gmail.com, kraxel@redhat.com,
 edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn, pburton@wavecomp.com,
 xiaoguangrong.eric@gmail.com, peter.chubb@nicta.com.au, philmd@redhat.com,
 robh@kernel.org, hare@suse.com, sstabellini@kernel.org, berto@igalia.com,
 chouteau@adacore.com, qemu-block@nongnu.org, arikalo@wavecomp.com,
 jslaby@suse.cz, deller@gmx.de, mst@redhat.com, magnus.damm@gmail.com,
 jcd@tribudubois.net, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 mreitz@redhat.com, hpoussin@reactos.org, joel@jms.id.au,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 david@gibson.dropbear.id.au, lersek@redhat.com, green@moxielogic.com,
 atar4qemu@gmail.com, antonynpavlov@gmail.com, marex@denx.de, jiri@resnulli.us,
 ehabkost@redhat.com, minyard@acm.org, qemu-s390x@nongnu.org, sw@weilnetz.de,
 alistair@alistair23.me, yuval.shaia@oracle.com, b.galvani@gmail.com,
 eric.auger@redhat.com, alex.williamson@redhat.com, qemu-arm@nongnu.org,
 jan.kiszka@web.de, clg@kaod.org, stefanha@redhat.com,
 marcandre.lureau@redhat.com, shorne@gmail.com, jsnow@redhat.com,
 rth@twiddle.net, kwolf@redhat.com, qemu-riscv@nongnu.org, proljc@gmail.com,
 pbonzini@redhat.com, andrew@aj.id.au, kbastian@mail.uni-paderborn.de,
 crwulff@gmail.com, laurent@vivier.eu, Andrew.Baumann@microsoft.com,
 sundeep.lkml@gmail.com, andrew.smirnov@gmail.com, michael@walle.cc,
 paul.durrant@citrix.com, qemu-ppc@nongnu.org, huth@tuxfamily.org,
 amarkovic@wavecomp.com, imammedo@redhat.com, aurelien@aurel32.net,
 stefanb@linux.ibm.com
Content-Type: multipart/mixed; boundary="===============6081151666295021508=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6081151666295021508==
Content-Language: en-AU
Content-Type: multipart/alternative;
	boundary="_000_156516666883025608btcom_"

--_000_156516666883025608btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Preparation for replacing device_endian with MemOp.

Device realizing code with MemorRegionOps endianness as
DEVICE_NATIVE_ENDIAN is not common code.

Corrected devices were identified by making the declaration of
DEVICE_NATIVE_ENDIAN conditional upon NEED_CPU_H and then listing
what failed to compile.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 hw/audio/Makefile.objs    | 11 ++++++-----
 hw/block/Makefile.objs    |  8 ++++----
 hw/char/Makefile.objs     | 22 +++++++++++-----------
 hw/core/Makefile.objs     |  2 +-
 hw/display/Makefile.objs  | 10 +++++-----
 hw/dma/Makefile.objs      | 18 +++++++++---------
 hw/gpio/Makefile.objs     |  6 +++---
 hw/i2c/Makefile.objs      |  8 ++++----
 hw/input/Makefile.objs    |  4 ++--
 hw/intc/Makefile.objs     | 19 ++++++++++---------
 hw/ipack/Makefile.objs    |  2 +-
 hw/isa/Makefile.objs      |  2 +-
 hw/misc/Makefile.objs     | 18 +++++++++---------
 hw/net/Makefile.objs      | 14 +++++++-------
 hw/pci-host/Makefile.objs |  6 +++---
 hw/scsi/Makefile.objs     |  2 +-
 hw/sd/Makefile.objs       |  2 +-
 hw/ssi/Makefile.objs      | 10 +++++-----
 hw/timer/Makefile.objs    | 39 ++++++++++++++++++++-------------------
 hw/virtio/Makefile.objs   |  2 +-
 20 files changed, 104 insertions(+), 101 deletions(-)

diff --git a/hw/audio/Makefile.objs b/hw/audio/Makefile.objs
index 63db383..40b26c6 100644
--- a/hw/audio/Makefile.objs
+++ b/hw/audio/Makefile.objs
@@ -5,14 +5,15 @@ common-obj-$(CONFIG_AC97) +=3D ac97.o
 common-obj-$(CONFIG_ADLIB) +=3D fmopl.o adlib.o
 common-obj-$(CONFIG_GUS) +=3D gus.o gusemu_hal.o gusemu_mixer.o
 common-obj-$(CONFIG_CS4231A) +=3D cs4231a.o
-common-obj-$(CONFIG_HDA) +=3D intel-hda.o hda-codec.o
+common-obj-$(CONFIG_HDA) +=3D hda-codec.o
+obj-$(CONFIG_HDA) +=3D intel-hda.o

 common-obj-$(CONFIG_PCSPK) +=3D pcspk.o
 common-obj-$(CONFIG_WM8750) +=3D wm8750.o
-common-obj-$(CONFIG_PL041) +=3D pl041.o lm4549.o
+obj-$(CONFIG_PL041) +=3D pl041.o lm4549.o

-common-obj-$(CONFIG_CS4231) +=3D cs4231.o
-common-obj-$(CONFIG_MARVELL_88W8618) +=3D marvell_88w8618.o
-common-obj-$(CONFIG_MILKYMIST) +=3D milkymist-ac97.o
+obj-$(CONFIG_CS4231) +=3D cs4231.o
+obj-$(CONFIG_MARVELL_88W8618) +=3D marvell_88w8618.o
+obj-$(CONFIG_MILKYMIST) +=3D milkymist-ac97.o

 common-obj-y +=3D soundhw.o
diff --git a/hw/block/Makefile.objs b/hw/block/Makefile.objs
index f5f643f..9098cda 100644
--- a/hw/block/Makefile.objs
+++ b/hw/block/Makefile.objs
@@ -1,12 +1,12 @@
 common-obj-y +=3D block.o cdrom.o hd-geometry.o
-common-obj-$(CONFIG_FDC) +=3D fdc.o
+obj-$(CONFIG_FDC) +=3D fdc.o
 common-obj-$(CONFIG_SSI_M25P80) +=3D m25p80.o
 common-obj-$(CONFIG_NAND) +=3D nand.o
-common-obj-$(CONFIG_PFLASH_CFI01) +=3D pflash_cfi01.o
-common-obj-$(CONFIG_PFLASH_CFI02) +=3D pflash_cfi02.o
+obj-$(CONFIG_PFLASH_CFI01) +=3D pflash_cfi01.o
+obj-$(CONFIG_PFLASH_CFI02) +=3D pflash_cfi02.o
 common-obj-$(CONFIG_XEN) +=3D xen-block.o
 common-obj-$(CONFIG_ECC) +=3D ecc.o
-common-obj-$(CONFIG_ONENAND) +=3D onenand.o
+obj-$(CONFIG_ONENAND) +=3D onenand.o
 common-obj-$(CONFIG_NVME_PCI) +=3D nvme.o

 obj-$(CONFIG_SH4) +=3D tc58128.o
diff --git a/hw/char/Makefile.objs b/hw/char/Makefile.objs
index 02d8a66..af3e76a 100644
--- a/hw/char/Makefile.objs
+++ b/hw/char/Makefile.objs
@@ -1,17 +1,17 @@
 common-obj-$(CONFIG_IPACK) +=3D ipoctal232.o
-common-obj-$(CONFIG_ESCC) +=3D escc.o
+obj-$(CONFIG_ESCC) +=3D escc.o
 common-obj-$(CONFIG_NRF51_SOC) +=3D nrf51_uart.o
-common-obj-$(CONFIG_PARALLEL) +=3D parallel.o
+obj-$(CONFIG_PARALLEL) +=3D parallel.o
 common-obj-$(CONFIG_ISA_BUS) +=3D parallel-isa.o
-common-obj-$(CONFIG_PL011) +=3D pl011.o
-common-obj-$(CONFIG_SERIAL) +=3D serial.o
+obj-$(CONFIG_PL011) +=3D pl011.o
+obj-$(CONFIG_SERIAL) +=3D serial.o
 common-obj-$(CONFIG_SERIAL_ISA) +=3D serial-isa.o
 common-obj-$(CONFIG_SERIAL_PCI) +=3D serial-pci.o
 common-obj-$(CONFIG_SERIAL_PCI_MULTI) +=3D serial-pci-multi.o
 common-obj-$(CONFIG_VIRTIO_SERIAL) +=3D virtio-console.o
-common-obj-$(CONFIG_XILINX) +=3D xilinx_uartlite.o
+obj-$(CONFIG_XILINX) +=3D xilinx_uartlite.o
 common-obj-$(CONFIG_XEN) +=3D xen_console.o
-common-obj-$(CONFIG_CADENCE) +=3D cadence_uart.o
+obj-$(CONFIG_CADENCE) +=3D cadence_uart.o

 obj-$(CONFIG_EXYNOS4) +=3D exynos4210_uart.o
 obj-$(CONFIG_COLDFIRE) +=3D mcf_uart.o
@@ -23,13 +23,13 @@ obj-$(CONFIG_STM32F2XX_USART) +=3D stm32f2xx_usart.o
 obj-$(CONFIG_RASPI) +=3D bcm2835_aux.o

 common-obj-$(CONFIG_CMSDK_APB_UART) +=3D cmsdk-apb-uart.o
-common-obj-$(CONFIG_ETRAXFS) +=3D etraxfs_ser.o
+obj-$(CONFIG_ETRAXFS) +=3D etraxfs_ser.o
 common-obj-$(CONFIG_ISA_DEBUG) +=3D debugcon.o
-common-obj-$(CONFIG_GRLIB) +=3D grlib_apbuart.o
-common-obj-$(CONFIG_IMX) +=3D imx_serial.o
+obj-$(CONFIG_GRLIB) +=3D grlib_apbuart.o
+obj-$(CONFIG_IMX) +=3D imx_serial.o
 common-obj-$(CONFIG_LM32) +=3D lm32_juart.o
-common-obj-$(CONFIG_LM32) +=3D lm32_uart.o
-common-obj-$(CONFIG_MILKYMIST) +=3D milkymist-uart.o
+obj-$(CONFIG_LM32) +=3D lm32_uart.o
+obj-$(CONFIG_MILKYMIST) +=3D milkymist-uart.o
 common-obj-$(CONFIG_SCLPCONSOLE) +=3D sclpconsole.o sclpconsole-lm.o

 obj-$(CONFIG_VIRTIO) +=3D virtio-serial-bus.o
diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index f8481d9..1b336c6 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -9,7 +9,7 @@ common-obj-y +=3D hotplug.o
 common-obj-$(CONFIG_SOFTMMU) +=3D nmi.o
 common-obj-$(CONFIG_SOFTMMU) +=3D vm-change-state-handler.o

-common-obj-$(CONFIG_EMPTY_SLOT) +=3D empty_slot.o
+obj-$(CONFIG_EMPTY_SLOT) +=3D empty_slot.o
 common-obj-$(CONFIG_XILINX_AXI) +=3D stream.o
 common-obj-$(CONFIG_PTIMER) +=3D ptimer.o
 common-obj-$(CONFIG_SOFTMMU) +=3D sysbus.o
diff --git a/hw/display/Makefile.objs b/hw/display/Makefile.objs
index a64998f..53c3efb 100644
--- a/hw/display/Makefile.objs
+++ b/hw/display/Makefile.objs
@@ -8,8 +8,8 @@ common-obj-$(CONFIG_ADS7846) +=3D ads7846.o
 common-obj-$(CONFIG_VGA_CIRRUS) +=3D cirrus_vga.o
 common-obj-$(call land,$(CONFIG_VGA_CIRRUS),$(CONFIG_VGA_ISA))+=3Dcirrus_v=
ga_isa.o
 common-obj-$(CONFIG_G364FB) +=3D g364fb.o
-common-obj-$(CONFIG_JAZZ_LED) +=3D jazz_led.o
-common-obj-$(CONFIG_PL110) +=3D pl110.o
+obj-$(CONFIG_JAZZ_LED) +=3D jazz_led.o
+obj-$(CONFIG_PL110) +=3D pl110.o
 common-obj-$(CONFIG_SII9022) +=3D sii9022.o
 common-obj-$(CONFIG_SSD0303) +=3D ssd0303.o
 common-obj-$(CONFIG_SSD0323) +=3D ssd0323.o
@@ -17,15 +17,15 @@ common-obj-$(CONFIG_XEN) +=3D xenfb.o

 common-obj-$(CONFIG_VGA_PCI) +=3D vga-pci.o
 common-obj-$(CONFIG_VGA_ISA) +=3D vga-isa.o
-common-obj-$(CONFIG_VGA_ISA_MM) +=3D vga-isa-mm.o
+obj-$(CONFIG_VGA_ISA_MM) +=3D vga-isa-mm.o
 common-obj-$(CONFIG_VMWARE_VGA) +=3D vmware_vga.o
 common-obj-$(CONFIG_BOCHS_DISPLAY) +=3D bochs-display.o

 common-obj-$(CONFIG_BLIZZARD) +=3D blizzard.o
-common-obj-$(CONFIG_EXYNOS4) +=3D exynos4210_fimd.o
+obj-$(CONFIG_EXYNOS4) +=3D exynos4210_fimd.o
 common-obj-$(CONFIG_FRAMEBUFFER) +=3D framebuffer.o
 obj-$(CONFIG_MILKYMIST) +=3D milkymist-vgafb.o
-common-obj-$(CONFIG_ZAURUS) +=3D tc6393xb.o
+obj-$(CONFIG_ZAURUS) +=3D tc6393xb.o

 obj-$(CONFIG_MILKYMIST_TMU2) +=3D milkymist-tmu2.o
 milkymist-tmu2.o-cflags :=3D $(X11_CFLAGS) $(OPENGL_CFLAGS)
diff --git a/hw/dma/Makefile.objs b/hw/dma/Makefile.objs
index 8b39f9c..7e17776 100644
--- a/hw/dma/Makefile.objs
+++ b/hw/dma/Makefile.objs
@@ -1,17 +1,17 @@
-common-obj-$(CONFIG_PUV3) +=3D puv3_dma.o
-common-obj-$(CONFIG_RC4030) +=3D rc4030.o
-common-obj-$(CONFIG_PL080) +=3D pl080.o
-common-obj-$(CONFIG_PL330) +=3D pl330.o
+obj-$(CONFIG_PUV3) +=3D puv3_dma.o
+obj-$(CONFIG_RC4030) +=3D rc4030.o
+obj-$(CONFIG_PL080) +=3D pl080.o
+obj-$(CONFIG_PL330) +=3D pl330.o
 common-obj-$(CONFIG_I82374) +=3D i82374.o
-common-obj-$(CONFIG_I8257) +=3D i8257.o
-common-obj-$(CONFIG_XILINX_AXI) +=3D xilinx_axidma.o
+obj-$(CONFIG_I8257) +=3D i8257.o
+obj-$(CONFIG_XILINX_AXI) +=3D xilinx_axidma.o
 common-obj-$(CONFIG_ZYNQ_DEVCFG) +=3D xlnx-zynq-devcfg.o
-common-obj-$(CONFIG_ETRAXFS) +=3D etraxfs_dma.o
-common-obj-$(CONFIG_STP2000) +=3D sparc32_dma.o
+obj-$(CONFIG_ETRAXFS) +=3D etraxfs_dma.o
+obj-$(CONFIG_STP2000) +=3D sparc32_dma.o
 obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx_dpdma.o
 obj-$(CONFIG_XLNX_ZYNQMP_ARM) +=3D xlnx_dpdma.o
 common-obj-$(CONFIG_XLNX_ZYNQMP_ARM) +=3D xlnx-zdma.o

 obj-$(CONFIG_OMAP) +=3D omap_dma.o soc_dma.o
 obj-$(CONFIG_PXA2XX) +=3D pxa2xx_dma.o
-common-obj-$(CONFIG_RASPI) +=3D bcm2835_dma.o
+obj-$(CONFIG_RASPI) +=3D bcm2835_dma.o
diff --git a/hw/gpio/Makefile.objs b/hw/gpio/Makefile.objs
index e5da0cb..9d297fd 100644
--- a/hw/gpio/Makefile.objs
+++ b/hw/gpio/Makefile.objs
@@ -1,7 +1,7 @@
 common-obj-$(CONFIG_MAX7310) +=3D max7310.o
-common-obj-$(CONFIG_PL061) +=3D pl061.o
-common-obj-$(CONFIG_PUV3) +=3D puv3_gpio.o
-common-obj-$(CONFIG_ZAURUS) +=3D zaurus.o
+obj-$(CONFIG_PL061) +=3D pl061.o
+obj-$(CONFIG_PUV3) +=3D puv3_gpio.o
+obj-$(CONFIG_ZAURUS) +=3D zaurus.o
 common-obj-$(CONFIG_E500) +=3D mpc8xxx.o
 common-obj-$(CONFIG_GPIO_KEY) +=3D gpio_key.o

diff --git a/hw/i2c/Makefile.objs b/hw/i2c/Makefile.objs
index d7073a4..9c8839c 100644
--- a/hw/i2c/Makefile.objs
+++ b/hw/i2c/Makefile.objs
@@ -1,13 +1,13 @@
 common-obj-$(CONFIG_I2C) +=3D core.o smbus_slave.o smbus_master.o
 common-obj-$(CONFIG_SMBUS_EEPROM) +=3D smbus_eeprom.o
-common-obj-$(CONFIG_VERSATILE_I2C) +=3D versatile_i2c.o
+obj-$(CONFIG_VERSATILE_I2C) +=3D versatile_i2c.o
 common-obj-$(CONFIG_ACPI_X86_ICH) +=3D smbus_ich9.o
 common-obj-$(CONFIG_ACPI_SMBUS) +=3D pm_smbus.o
 common-obj-$(CONFIG_BITBANG_I2C) +=3D bitbang_i2c.o
-common-obj-$(CONFIG_EXYNOS4) +=3D exynos4210_i2c.o
-common-obj-$(CONFIG_IMX_I2C) +=3D imx_i2c.o
+obj-$(CONFIG_EXYNOS4) +=3D exynos4210_i2c.o
+obj-$(CONFIG_IMX_I2C) +=3D imx_i2c.o
 common-obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_i2c.o
 common-obj-$(CONFIG_NRF51_SOC) +=3D microbit_i2c.o
-common-obj-$(CONFIG_MPC_I2C) +=3D mpc_i2c.o
+obj-$(CONFIG_MPC_I2C) +=3D mpc_i2c.o
 obj-$(CONFIG_OMAP) +=3D omap_i2c.o
 obj-$(CONFIG_PPC4XX) +=3D ppc4xx_i2c.o
diff --git a/hw/input/Makefile.objs b/hw/input/Makefile.objs
index a1bc502..e096cc5 100644
--- a/hw/input/Makefile.objs
+++ b/hw/input/Makefile.objs
@@ -1,8 +1,8 @@
 common-obj-$(CONFIG_ADB) +=3D adb.o adb-mouse.o adb-kbd.o
 common-obj-y +=3D hid.o
 common-obj-$(CONFIG_LM832X) +=3D lm832x.o
-common-obj-$(CONFIG_PCKBD) +=3D pckbd.o
-common-obj-$(CONFIG_PL050) +=3D pl050.o
+obj-$(CONFIG_PCKBD) +=3D pckbd.o
+obj-$(CONFIG_PL050) +=3D pl050.o
 common-obj-$(CONFIG_PS2) +=3D ps2.o
 common-obj-$(CONFIG_STELLARIS_INPUT) +=3D stellaris_input.o
 common-obj-$(CONFIG_TSC2005) +=3D tsc2005.o
diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
index 03019b9..6d7ba84 100644
--- a/hw/intc/Makefile.objs
+++ b/hw/intc/Makefile.objs
@@ -1,24 +1,25 @@
 common-obj-$(CONFIG_HEATHROW_PIC) +=3D heathrow_pic.o
 common-obj-$(CONFIG_I8259) +=3D i8259_common.o i8259.o
-common-obj-$(CONFIG_PL190) +=3D pl190.o
-common-obj-$(CONFIG_PUV3) +=3D puv3_intc.o
-common-obj-$(CONFIG_XILINX) +=3D xilinx_intc.o
+obj-$(CONFIG_PL190) +=3D pl190.o
+obj-$(CONFIG_PUV3) +=3D puv3_intc.o
+obj-$(CONFIG_XILINX) +=3D xilinx_intc.o
 common-obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-pmu-iomod-intc.o
 common-obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-zynqmp-ipi.o
-common-obj-$(CONFIG_ETRAXFS) +=3D etraxfs_pic.o
-common-obj-$(CONFIG_IMX) +=3D imx_avic.o imx_gpcv2.o
+obj-$(CONFIG_ETRAXFS) +=3D etraxfs_pic.o
+obj-$(CONFIG_IMX) +=3D imx_avic.o
+obj-$(CONFIG_IMX) +=3D imx_gpcv2.o
 common-obj-$(CONFIG_LM32) +=3D lm32_pic.o
 common-obj-$(CONFIG_REALVIEW) +=3D realview_gic.o
-common-obj-$(CONFIG_SLAVIO) +=3D slavio_intctl.o
+obj-$(CONFIG_SLAVIO) +=3D slavio_intctl.o
 common-obj-$(CONFIG_IOAPIC) +=3D ioapic_common.o
 common-obj-$(CONFIG_ARM_GIC) +=3D arm_gic_common.o
-common-obj-$(CONFIG_ARM_GIC) +=3D arm_gic.o
+obj-$(CONFIG_ARM_GIC) +=3D arm_gic.o
 common-obj-$(CONFIG_ARM_GIC) +=3D arm_gicv2m.o
 common-obj-$(CONFIG_ARM_GIC) +=3D arm_gicv3_common.o
-common-obj-$(CONFIG_ARM_GIC) +=3D arm_gicv3.o
+obj-$(CONFIG_ARM_GIC) +=3D arm_gicv3.o
 common-obj-$(CONFIG_ARM_GIC) +=3D arm_gicv3_dist.o
 common-obj-$(CONFIG_ARM_GIC) +=3D arm_gicv3_redist.o
-common-obj-$(CONFIG_ARM_GIC) +=3D arm_gicv3_its_common.o
+obj-$(CONFIG_ARM_GIC) +=3D arm_gicv3_its_common.o
 common-obj-$(CONFIG_OPENPIC) +=3D openpic.o
 common-obj-y +=3D intc.o

diff --git a/hw/ipack/Makefile.objs b/hw/ipack/Makefile.objs
index 8b9bdcb..a7c5485 100644
--- a/hw/ipack/Makefile.objs
+++ b/hw/ipack/Makefile.objs
@@ -1,2 +1,2 @@
 common-obj-$(CONFIG_IPACK) +=3D ipack.o
-common-obj-$(CONFIG_IPACK) +=3D tpci200.o
+obj-$(CONFIG_IPACK) +=3D tpci200.o
diff --git a/hw/isa/Makefile.objs b/hw/isa/Makefile.objs
index 9e106df..898b504 100644
--- a/hw/isa/Makefile.objs
+++ b/hw/isa/Makefile.objs
@@ -4,7 +4,7 @@ common-obj-$(CONFIG_APM) +=3D apm.o
 common-obj-$(CONFIG_I82378) +=3D i82378.o
 common-obj-$(CONFIG_PC87312) +=3D pc87312.o
 common-obj-$(CONFIG_PIIX4) +=3D piix4.o
-common-obj-$(CONFIG_VT82C686) +=3D vt82c686.o
+obj-$(CONFIG_VT82C686) +=3D vt82c686.o
 common-obj-$(CONFIG_SMC37C669) +=3D smc37c669-superio.o

 obj-$(CONFIG_LPC_ICH9) +=3D lpc_ich9.o
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index e9aab51..6ee5a8a 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -1,4 +1,4 @@
-common-obj-$(CONFIG_APPLESMC) +=3D applesmc.o
+obj-$(CONFIG_APPLESMC) +=3D applesmc.o
 common-obj-$(CONFIG_MAX111X) +=3D max111x.o
 common-obj-$(CONFIG_TMP105) +=3D tmp105.o
 common-obj-$(CONFIG_TMP421) +=3D tmp421.o
@@ -6,23 +6,23 @@ common-obj-$(CONFIG_ISA_DEBUG) +=3D debugexit.o
 common-obj-$(CONFIG_SGA) +=3D sga.o
 common-obj-$(CONFIG_ISA_TESTDEV) +=3D pc-testdev.o
 common-obj-$(CONFIG_PCI_TESTDEV) +=3D pci-testdev.o
-common-obj-$(CONFIG_EDU) +=3D edu.o
+obj-$(CONFIG_EDU) +=3D edu.o
 common-obj-$(CONFIG_PCA9552) +=3D pca9552.o

-common-obj-y +=3D unimp.o
+obj-y +=3D unimp.o
 common-obj-$(CONFIG_FW_CFG_DMA) +=3D vmcoreinfo.o

 # ARM devices
-common-obj-$(CONFIG_PL310) +=3D arm_l2x0.o
-common-obj-$(CONFIG_INTEGRATOR_DEBUG) +=3D arm_integrator_debug.o
-common-obj-$(CONFIG_A9SCU) +=3D a9scu.o
-common-obj-$(CONFIG_ARM11SCU) +=3D arm11scu.o
+obj-$(CONFIG_PL310) +=3D arm_l2x0.o
+obj-$(CONFIG_INTEGRATOR_DEBUG) +=3D arm_integrator_debug.o
+obj-$(CONFIG_A9SCU) +=3D a9scu.o
+obj-$(CONFIG_ARM11SCU) +=3D arm11scu.o

 # Mac devices
-common-obj-$(CONFIG_MOS6522) +=3D mos6522.o
+obj-$(CONFIG_MOS6522) +=3D mos6522.o

 # PKUnity SoC devices
-common-obj-$(CONFIG_PUV3) +=3D puv3_pm.o
+obj-$(CONFIG_PUV3) +=3D puv3_pm.o

 common-obj-$(CONFIG_MACIO) +=3D macio/

diff --git a/hw/net/Makefile.objs b/hw/net/Makefile.objs
index 9904273..1ff7b59 100644
--- a/hw/net/Makefile.objs
+++ b/hw/net/Makefile.objs
@@ -1,4 +1,4 @@
-common-obj-$(CONFIG_DP8393X) +=3D dp8393x.o
+obj-$(CONFIG_DP8393X) +=3D dp8393x.o
 common-obj-$(CONFIG_XEN) +=3D xen_nic.o
 common-obj-$(CONFIG_NE2000_COMMON) +=3D ne2000.o

@@ -14,19 +14,19 @@ common-obj-$(CONFIG_RTL8139_PCI) +=3D rtl8139.o
 common-obj-$(CONFIG_VMXNET3_PCI) +=3D net_tx_pkt.o net_rx_pkt.o
 common-obj-$(CONFIG_VMXNET3_PCI) +=3D vmxnet3.o

-common-obj-$(CONFIG_SMC91C111) +=3D smc91c111.o
-common-obj-$(CONFIG_LAN9118) +=3D lan9118.o
+obj-$(CONFIG_SMC91C111) +=3D smc91c111.o
+obj-$(CONFIG_LAN9118) +=3D lan9118.o
 common-obj-$(CONFIG_NE2000_ISA) +=3D ne2000-isa.o
 common-obj-$(CONFIG_OPENCORES_ETH) +=3D opencores_eth.o
 common-obj-$(CONFIG_XGMAC) +=3D xgmac.o
 common-obj-$(CONFIG_MIPSNET) +=3D mipsnet.o
 common-obj-$(CONFIG_XILINX_AXI) +=3D xilinx_axienet.o
-common-obj-$(CONFIG_ALLWINNER_EMAC) +=3D allwinner_emac.o
-common-obj-$(CONFIG_IMX_FEC) +=3D imx_fec.o
+obj-$(CONFIG_ALLWINNER_EMAC) +=3D allwinner_emac.o
+obj-$(CONFIG_IMX_FEC) +=3D imx_fec.o

 common-obj-$(CONFIG_CADENCE) +=3D cadence_gem.o
-common-obj-$(CONFIG_STELLARIS_ENET) +=3D stellaris_enet.o
-common-obj-$(CONFIG_LANCE) +=3D lance.o
+obj-$(CONFIG_STELLARIS_ENET) +=3D stellaris_enet.o
+obj-$(CONFIG_LANCE) +=3D lance.o
 common-obj-$(CONFIG_SUNHME) +=3D sunhme.o
 common-obj-$(CONFIG_FTGMAC100) +=3D ftgmac100.o
 common-obj-$(CONFIG_SUNGEM) +=3D sungem.o
diff --git a/hw/pci-host/Makefile.objs b/hw/pci-host/Makefile.objs
index a9cd3e0..0970e8e 100644
--- a/hw/pci-host/Makefile.objs
+++ b/hw/pci-host/Makefile.objs
@@ -9,12 +9,12 @@ common-obj-$(CONFIG_UNIN_PCI) +=3D uninorth.o
 common-obj-$(CONFIG_PPCE500_PCI) +=3D ppce500.o

 # ARM devices
-common-obj-$(CONFIG_VERSATILE_PCI) +=3D versatile.o
+obj-$(CONFIG_VERSATILE_PCI) +=3D versatile.o

 common-obj-$(CONFIG_PCI_SABRE) +=3D sabre.o
-common-obj-$(CONFIG_FULONG) +=3D bonito.o
+obj-$(CONFIG_FULONG) +=3D bonito.o
 common-obj-$(CONFIG_PCI_PIIX) +=3D piix.o
-common-obj-$(CONFIG_PCI_EXPRESS_Q35) +=3D q35.o
+obj-$(CONFIG_PCI_EXPRESS_Q35) +=3D q35.o
 common-obj-$(CONFIG_PCI_EXPRESS_GENERIC_BRIDGE) +=3D gpex.o
 common-obj-$(CONFIG_PCI_EXPRESS_XILINX) +=3D xilinx-pcie.o

diff --git a/hw/scsi/Makefile.objs b/hw/scsi/Makefile.objs
index 54b36ed..418af9a 100644
--- a/hw/scsi/Makefile.objs
+++ b/hw/scsi/Makefile.objs
@@ -4,7 +4,7 @@ common-obj-$(CONFIG_LSI_SCSI_PCI) +=3D lsi53c895a.o
 common-obj-$(CONFIG_MPTSAS_SCSI_PCI) +=3D mptsas.o mptconfig.o mptendian.o
 common-obj-$(CONFIG_MEGASAS_SCSI_PCI) +=3D megasas.o
 common-obj-$(CONFIG_VMW_PVSCSI_SCSI_PCI) +=3D vmw_pvscsi.o
-common-obj-$(CONFIG_ESP) +=3D esp.o
+obj-$(CONFIG_ESP) +=3D esp.o
 common-obj-$(CONFIG_ESP_PCI) +=3D esp-pci.o
 obj-$(CONFIG_SPAPR_VSCSI) +=3D spapr_vscsi.o

diff --git a/hw/sd/Makefile.objs b/hw/sd/Makefile.objs
index 0665727..a8cd6bf 100644
--- a/hw/sd/Makefile.objs
+++ b/hw/sd/Makefile.objs
@@ -1,4 +1,4 @@
-common-obj-$(CONFIG_PL181) +=3D pl181.o
+obj-$(CONFIG_PL181) +=3D pl181.o
 common-obj-$(CONFIG_SSI_SD) +=3D ssi-sd.o
 common-obj-$(CONFIG_SD) +=3D sd.o core.o sdmmc-internal.o
 common-obj-$(CONFIG_SDHCI) +=3D sdhci.o
diff --git a/hw/ssi/Makefile.objs b/hw/ssi/Makefile.objs
index f5bcc65..b084802 100644
--- a/hw/ssi/Makefile.objs
+++ b/hw/ssi/Makefile.objs
@@ -1,10 +1,10 @@
-common-obj-$(CONFIG_PL022) +=3D pl022.o
+obj-$(CONFIG_PL022) +=3D pl022.o
 common-obj-$(CONFIG_SSI) +=3D ssi.o
-common-obj-$(CONFIG_XILINX_SPI) +=3D xilinx_spi.o
-common-obj-$(CONFIG_XILINX_SPIPS) +=3D xilinx_spips.o
+obj-$(CONFIG_XILINX_SPI) +=3D xilinx_spi.o
+obj-$(CONFIG_XILINX_SPIPS) +=3D xilinx_spips.o
 common-obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_smc.o
-common-obj-$(CONFIG_STM32F2XX_SPI) +=3D stm32f2xx_spi.o
-common-obj-$(CONFIG_MSF2) +=3D mss-spi.o
+obj-$(CONFIG_STM32F2XX_SPI) +=3D stm32f2xx_spi.o
+obj-$(CONFIG_MSF2) +=3D mss-spi.o

 obj-$(CONFIG_OMAP) +=3D omap_spi.o
 obj-$(CONFIG_IMX) +=3D imx_spi.o
diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index 123d92c..0a8f651 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -1,27 +1,27 @@
-common-obj-$(CONFIG_ARM_TIMER) +=3D arm_timer.o
-common-obj-$(CONFIG_ARM_MPTIMER) +=3D arm_mptimer.o
-common-obj-$(CONFIG_ARM_V7M) +=3D armv7m_systick.o
-common-obj-$(CONFIG_A9_GTIMER) +=3D a9gtimer.o
-common-obj-$(CONFIG_CADENCE) +=3D cadence_ttc.o
+obj-$(CONFIG_ARM_TIMER) +=3D arm_timer.o
+obj-$(CONFIG_ARM_MPTIMER) +=3D arm_mptimer.o
+obj-$(CONFIG_ARM_V7M) +=3D armv7m_systick.o
+obj-$(CONFIG_A9_GTIMER) +=3D a9gtimer.o
+obj-$(CONFIG_CADENCE) +=3D cadence_ttc.o
 common-obj-$(CONFIG_DS1338) +=3D ds1338.o
-common-obj-$(CONFIG_HPET) +=3D hpet.o
+obj-$(CONFIG_HPET) +=3D hpet.o
 common-obj-$(CONFIG_I8254) +=3D i8254_common.o i8254.o
 common-obj-$(CONFIG_M41T80) +=3D m41t80.o
 common-obj-$(CONFIG_M48T59) +=3D m48t59.o
 ifeq ($(CONFIG_ISA_BUS),y)
 common-obj-$(CONFIG_M48T59) +=3D m48t59-isa.o
 endif
-common-obj-$(CONFIG_PL031) +=3D pl031.o
-common-obj-$(CONFIG_PUV3) +=3D puv3_ost.o
+obj-$(CONFIG_PL031) +=3D pl031.o
+obj-$(CONFIG_PUV3) +=3D puv3_ost.o
 common-obj-$(CONFIG_TWL92230) +=3D twl92230.o
-common-obj-$(CONFIG_XILINX) +=3D xilinx_timer.o
-common-obj-$(CONFIG_SLAVIO) +=3D slavio_timer.o
+obj-$(CONFIG_XILINX) +=3D xilinx_timer.o
+obj-$(CONFIG_SLAVIO) +=3D slavio_timer.o
 common-obj-$(CONFIG_ETRAXFS) +=3D etraxfs_timer.o
-common-obj-$(CONFIG_GRLIB) +=3D grlib_gptimer.o
-common-obj-$(CONFIG_IMX) +=3D imx_epit.o
-common-obj-$(CONFIG_IMX) +=3D imx_gpt.o
-common-obj-$(CONFIG_LM32) +=3D lm32_timer.o
-common-obj-$(CONFIG_MILKYMIST) +=3D milkymist-sysctl.o
+obj-$(CONFIG_GRLIB) +=3D grlib_gptimer.o
+obj-$(CONFIG_IMX) +=3D imx_epit.o
+obj-$(CONFIG_IMX) +=3D imx_gpt.o
+obj-$(CONFIG_LM32) +=3D lm32_timer.o
+obj-$(CONFIG_MILKYMIST) +=3D milkymist-sysctl.o
 common-obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-zynqmp-rtc.o
 common-obj-$(CONFIG_NRF51_SOC) +=3D nrf51_timer.o

@@ -40,10 +40,11 @@ obj-$(CONFIG_MC146818RTC) +=3D mc146818rtc.o

 obj-$(CONFIG_ALLWINNER_A10_PIT) +=3D allwinner-a10-pit.o

-common-obj-$(CONFIG_STM32F2XX_TIMER) +=3D stm32f2xx_timer.o
-common-obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_timer.o aspeed_rtc.o
+obj-$(CONFIG_STM32F2XX_TIMER) +=3D stm32f2xx_timer.o
+common-obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_timer.o
+obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_rtc.o

-common-obj-$(CONFIG_SUN4V_RTC) +=3D sun4v-rtc.o
+obj-$(CONFIG_SUN4V_RTC) +=3D sun4v-rtc.o
 common-obj-$(CONFIG_CMSDK_APB_TIMER) +=3D cmsdk-apb-timer.o
 common-obj-$(CONFIG_CMSDK_APB_DUALTIMER) +=3D cmsdk-apb-dualtimer.o
-common-obj-$(CONFIG_MSF2) +=3D mss-timer.o
+obj-$(CONFIG_MSF2) +=3D mss-timer.o
diff --git a/hw/virtio/Makefile.objs b/hw/virtio/Makefile.objs
index 964ce78..573b1a9 100644
--- a/hw/virtio/Makefile.objs
+++ b/hw/virtio/Makefile.objs
@@ -8,7 +8,7 @@ obj-$(CONFIG_VHOST_USER) +=3D vhost-user.o

 common-obj-$(CONFIG_VIRTIO_RNG) +=3D virtio-rng.o
 common-obj-$(CONFIG_VIRTIO_PCI) +=3D virtio-pci.o
-common-obj-$(CONFIG_VIRTIO_MMIO) +=3D virtio-mmio.o
+obj-$(CONFIG_VIRTIO_MMIO) +=3D virtio-mmio.o
 obj-$(CONFIG_VIRTIO_BALLOON) +=3D virtio-balloon.o
 obj-$(CONFIG_VIRTIO_CRYPTO) +=3D virtio-crypto.o
 obj-$(call land,$(CONFIG_VIRTIO_CRYPTO),$(CONFIG_VIRTIO_PCI)) +=3D virtio-=
crypto-pci.o
--
1.8.3.1

?


--_000_156516666883025608btcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!-- P { margin-top: 0px; m=
argin-bottom: 0px; } .EmailQuote { margin-left: 1pt; padding-left: 4pt; bor=
der-left-width: 2px; border-left-style: solid; border-left-color: rgb(128, =
0, 0); }--></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p></p>
<div style=3D"color: rgb(33, 33, 33);"><font size=3D"2"><span style=3D"font=
-size:10pt;">
<div class=3D"PlainText">
<div><span style=3D"font-size: 10pt;">Preparation for replacing device_endi=
an with MemOp.</span><br>
</div>
<div><br>
</div>
<div>Device realizing code with MemorRegionOps endianness as</div>
<div>DEVICE_NATIVE_ENDIAN is not common code.</div>
<div><br>
</div>
<div>Corrected devices were identified by making the declaration of</div>
<div>DEVICE_NATIVE_ENDIAN conditional upon NEED_CPU_H and then listing</div=
>
<div>what failed to compile.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;hw/audio/Makefile.objs &nbsp; &nbsp;| 11 &#43;&#43;&#43;&#43;&#4=
3;&#43;-----</div>
<div>&nbsp;hw/block/Makefile.objs &nbsp; &nbsp;| &nbsp;8 &#43;&#43;&#43;&#4=
3;----</div>
<div>&nbsp;hw/char/Makefile.objs &nbsp; &nbsp; | 22 &#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;-----------</div>
<div>&nbsp;hw/core/Makefile.objs &nbsp; &nbsp; | &nbsp;2 &#43;-</div>
<div>&nbsp;hw/display/Makefile.objs &nbsp;| 10 &#43;&#43;&#43;&#43;&#43;---=
--</div>
<div>&nbsp;hw/dma/Makefile.objs &nbsp; &nbsp; &nbsp;| 18 &#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;---------</div>
<div>&nbsp;hw/gpio/Makefile.objs &nbsp; &nbsp; | &nbsp;6 &#43;&#43;&#43;---=
</div>
<div>&nbsp;hw/i2c/Makefile.objs &nbsp; &nbsp; &nbsp;| &nbsp;8 &#43;&#43;&#4=
3;&#43;----</div>
<div>&nbsp;hw/input/Makefile.objs &nbsp; &nbsp;| &nbsp;4 &#43;&#43;--</div>
<div>&nbsp;hw/intc/Makefile.objs &nbsp; &nbsp; | 19 &#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;---------</div>
<div>&nbsp;hw/ipack/Makefile.objs &nbsp; &nbsp;| &nbsp;2 &#43;-</div>
<div>&nbsp;hw/isa/Makefile.objs &nbsp; &nbsp; &nbsp;| &nbsp;2 &#43;-</div>
<div>&nbsp;hw/misc/Makefile.objs &nbsp; &nbsp; | 18 &#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;---------</div>
<div>&nbsp;hw/net/Makefile.objs &nbsp; &nbsp; &nbsp;| 14 &#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;-------</div>
<div>&nbsp;hw/pci-host/Makefile.objs | &nbsp;6 &#43;&#43;&#43;---</div>
<div>&nbsp;hw/scsi/Makefile.objs &nbsp; &nbsp; | &nbsp;2 &#43;-</div>
<div>&nbsp;hw/sd/Makefile.objs &nbsp; &nbsp; &nbsp; | &nbsp;2 &#43;-</div>
<div>&nbsp;hw/ssi/Makefile.objs &nbsp; &nbsp; &nbsp;| 10 &#43;&#43;&#43;&#4=
3;&#43;-----</div>
<div>&nbsp;hw/timer/Makefile.objs &nbsp; &nbsp;| 39 &#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;-------------------</div>
<div>&nbsp;hw/virtio/Makefile.objs &nbsp; | &nbsp;2 &#43;-</div>
<div>&nbsp;20 files changed, 104 insertions(&#43;), 101 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/audio/Makefile.objs b/hw/audio/Makefile.objs</div>
<div>index 63db383..40b26c6 100644</div>
<div>--- a/hw/audio/Makefile.objs</div>
<div>&#43;&#43;&#43; b/hw/audio/Makefile.objs</div>
<div>@@ -5,14 &#43;5,15 @@ common-obj-$(CONFIG_AC97) &#43;=3D ac97.o</div>
<div>&nbsp;common-obj-$(CONFIG_ADLIB) &#43;=3D fmopl.o adlib.o</div>
<div>&nbsp;common-obj-$(CONFIG_GUS) &#43;=3D gus.o gusemu_hal.o gusemu_mixe=
r.o</div>
<div>&nbsp;common-obj-$(CONFIG_CS4231A) &#43;=3D cs4231a.o</div>
<div>-common-obj-$(CONFIG_HDA) &#43;=3D intel-hda.o hda-codec.o</div>
<div>&#43;common-obj-$(CONFIG_HDA) &#43;=3D hda-codec.o</div>
<div>&#43;obj-$(CONFIG_HDA) &#43;=3D intel-hda.o</div>
<div>&nbsp;</div>
<div>&nbsp;common-obj-$(CONFIG_PCSPK) &#43;=3D pcspk.o</div>
<div>&nbsp;common-obj-$(CONFIG_WM8750) &#43;=3D wm8750.o</div>
<div>-common-obj-$(CONFIG_PL041) &#43;=3D pl041.o lm4549.o</div>
<div>&#43;obj-$(CONFIG_PL041) &#43;=3D pl041.o lm4549.o</div>
<div>&nbsp;</div>
<div>-common-obj-$(CONFIG_CS4231) &#43;=3D cs4231.o</div>
<div>-common-obj-$(CONFIG_MARVELL_88W8618) &#43;=3D marvell_88w8618.o</div>
<div>-common-obj-$(CONFIG_MILKYMIST) &#43;=3D milkymist-ac97.o</div>
<div>&#43;obj-$(CONFIG_CS4231) &#43;=3D cs4231.o</div>
<div>&#43;obj-$(CONFIG_MARVELL_88W8618) &#43;=3D marvell_88w8618.o</div>
<div>&#43;obj-$(CONFIG_MILKYMIST) &#43;=3D milkymist-ac97.o</div>
<div>&nbsp;</div>
<div>&nbsp;common-obj-y &#43;=3D soundhw.o</div>
<div>diff --git a/hw/block/Makefile.objs b/hw/block/Makefile.objs</div>
<div>index f5f643f..9098cda 100644</div>
<div>--- a/hw/block/Makefile.objs</div>
<div>&#43;&#43;&#43; b/hw/block/Makefile.objs</div>
<div>@@ -1,12 &#43;1,12 @@</div>
<div>&nbsp;common-obj-y &#43;=3D block.o cdrom.o hd-geometry.o</div>
<div>-common-obj-$(CONFIG_FDC) &#43;=3D fdc.o</div>
<div>&#43;obj-$(CONFIG_FDC) &#43;=3D fdc.o</div>
<div>&nbsp;common-obj-$(CONFIG_SSI_M25P80) &#43;=3D m25p80.o</div>
<div>&nbsp;common-obj-$(CONFIG_NAND) &#43;=3D nand.o</div>
<div>-common-obj-$(CONFIG_PFLASH_CFI01) &#43;=3D pflash_cfi01.o</div>
<div>-common-obj-$(CONFIG_PFLASH_CFI02) &#43;=3D pflash_cfi02.o</div>
<div>&#43;obj-$(CONFIG_PFLASH_CFI01) &#43;=3D pflash_cfi01.o</div>
<div>&#43;obj-$(CONFIG_PFLASH_CFI02) &#43;=3D pflash_cfi02.o</div>
<div>&nbsp;common-obj-$(CONFIG_XEN) &#43;=3D xen-block.o</div>
<div>&nbsp;common-obj-$(CONFIG_ECC) &#43;=3D ecc.o</div>
<div>-common-obj-$(CONFIG_ONENAND) &#43;=3D onenand.o</div>
<div>&#43;obj-$(CONFIG_ONENAND) &#43;=3D onenand.o</div>
<div>&nbsp;common-obj-$(CONFIG_NVME_PCI) &#43;=3D nvme.o</div>
<div>&nbsp;</div>
<div>&nbsp;obj-$(CONFIG_SH4) &#43;=3D tc58128.o</div>
<div>diff --git a/hw/char/Makefile.objs b/hw/char/Makefile.objs</div>
<div>index 02d8a66..af3e76a 100644</div>
<div>--- a/hw/char/Makefile.objs</div>
<div>&#43;&#43;&#43; b/hw/char/Makefile.objs</div>
<div>@@ -1,17 &#43;1,17 @@</div>
<div>&nbsp;common-obj-$(CONFIG_IPACK) &#43;=3D ipoctal232.o</div>
<div>-common-obj-$(CONFIG_ESCC) &#43;=3D escc.o</div>
<div>&#43;obj-$(CONFIG_ESCC) &#43;=3D escc.o</div>
<div>&nbsp;common-obj-$(CONFIG_NRF51_SOC) &#43;=3D nrf51_uart.o</div>
<div>-common-obj-$(CONFIG_PARALLEL) &#43;=3D parallel.o</div>
<div>&#43;obj-$(CONFIG_PARALLEL) &#43;=3D parallel.o</div>
<div>&nbsp;common-obj-$(CONFIG_ISA_BUS) &#43;=3D parallel-isa.o</div>
<div>-common-obj-$(CONFIG_PL011) &#43;=3D pl011.o</div>
<div>-common-obj-$(CONFIG_SERIAL) &#43;=3D serial.o</div>
<div>&#43;obj-$(CONFIG_PL011) &#43;=3D pl011.o</div>
<div>&#43;obj-$(CONFIG_SERIAL) &#43;=3D serial.o</div>
<div>&nbsp;common-obj-$(CONFIG_SERIAL_ISA) &#43;=3D serial-isa.o</div>
<div>&nbsp;common-obj-$(CONFIG_SERIAL_PCI) &#43;=3D serial-pci.o</div>
<div>&nbsp;common-obj-$(CONFIG_SERIAL_PCI_MULTI) &#43;=3D serial-pci-multi.=
o</div>
<div>&nbsp;common-obj-$(CONFIG_VIRTIO_SERIAL) &#43;=3D virtio-console.o</di=
v>
<div>-common-obj-$(CONFIG_XILINX) &#43;=3D xilinx_uartlite.o</div>
<div>&#43;obj-$(CONFIG_XILINX) &#43;=3D xilinx_uartlite.o</div>
<div>&nbsp;common-obj-$(CONFIG_XEN) &#43;=3D xen_console.o</div>
<div>-common-obj-$(CONFIG_CADENCE) &#43;=3D cadence_uart.o</div>
<div>&#43;obj-$(CONFIG_CADENCE) &#43;=3D cadence_uart.o</div>
<div>&nbsp;</div>
<div>&nbsp;obj-$(CONFIG_EXYNOS4) &#43;=3D exynos4210_uart.o</div>
<div>&nbsp;obj-$(CONFIG_COLDFIRE) &#43;=3D mcf_uart.o</div>
<div>@@ -23,13 &#43;23,13 @@ obj-$(CONFIG_STM32F2XX_USART) &#43;=3D stm32f2=
xx_usart.o</div>
<div>&nbsp;obj-$(CONFIG_RASPI) &#43;=3D bcm2835_aux.o</div>
<div>&nbsp;</div>
<div>&nbsp;common-obj-$(CONFIG_CMSDK_APB_UART) &#43;=3D cmsdk-apb-uart.o</d=
iv>
<div>-common-obj-$(CONFIG_ETRAXFS) &#43;=3D etraxfs_ser.o</div>
<div>&#43;obj-$(CONFIG_ETRAXFS) &#43;=3D etraxfs_ser.o</div>
<div>&nbsp;common-obj-$(CONFIG_ISA_DEBUG) &#43;=3D debugcon.o</div>
<div>-common-obj-$(CONFIG_GRLIB) &#43;=3D grlib_apbuart.o</div>
<div>-common-obj-$(CONFIG_IMX) &#43;=3D imx_serial.o</div>
<div>&#43;obj-$(CONFIG_GRLIB) &#43;=3D grlib_apbuart.o</div>
<div>&#43;obj-$(CONFIG_IMX) &#43;=3D imx_serial.o</div>
<div>&nbsp;common-obj-$(CONFIG_LM32) &#43;=3D lm32_juart.o</div>
<div>-common-obj-$(CONFIG_LM32) &#43;=3D lm32_uart.o</div>
<div>-common-obj-$(CONFIG_MILKYMIST) &#43;=3D milkymist-uart.o</div>
<div>&#43;obj-$(CONFIG_LM32) &#43;=3D lm32_uart.o</div>
<div>&#43;obj-$(CONFIG_MILKYMIST) &#43;=3D milkymist-uart.o</div>
<div>&nbsp;common-obj-$(CONFIG_SCLPCONSOLE) &#43;=3D sclpconsole.o sclpcons=
ole-lm.o</div>
<div>&nbsp;</div>
<div>&nbsp;obj-$(CONFIG_VIRTIO) &#43;=3D virtio-serial-bus.o</div>
<div>diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs</div>
<div>index f8481d9..1b336c6 100644</div>
<div>--- a/hw/core/Makefile.objs</div>
<div>&#43;&#43;&#43; b/hw/core/Makefile.objs</div>
<div>@@ -9,7 &#43;9,7 @@ common-obj-y &#43;=3D hotplug.o</div>
<div>&nbsp;common-obj-$(CONFIG_SOFTMMU) &#43;=3D nmi.o</div>
<div>&nbsp;common-obj-$(CONFIG_SOFTMMU) &#43;=3D vm-change-state-handler.o<=
/div>
<div>&nbsp;</div>
<div>-common-obj-$(CONFIG_EMPTY_SLOT) &#43;=3D empty_slot.o</div>
<div>&#43;obj-$(CONFIG_EMPTY_SLOT) &#43;=3D empty_slot.o</div>
<div>&nbsp;common-obj-$(CONFIG_XILINX_AXI) &#43;=3D stream.o</div>
<div>&nbsp;common-obj-$(CONFIG_PTIMER) &#43;=3D ptimer.o</div>
<div>&nbsp;common-obj-$(CONFIG_SOFTMMU) &#43;=3D sysbus.o</div>
<div>diff --git a/hw/display/Makefile.objs b/hw/display/Makefile.objs</div>
<div>index a64998f..53c3efb 100644</div>
<div>--- a/hw/display/Makefile.objs</div>
<div>&#43;&#43;&#43; b/hw/display/Makefile.objs</div>
<div>@@ -8,8 &#43;8,8 @@ common-obj-$(CONFIG_ADS7846) &#43;=3D ads7846.o</d=
iv>
<div>&nbsp;common-obj-$(CONFIG_VGA_CIRRUS) &#43;=3D cirrus_vga.o</div>
<div>&nbsp;common-obj-$(call land,$(CONFIG_VGA_CIRRUS),$(CONFIG_VGA_ISA))&#=
43;=3Dcirrus_vga_isa.o</div>
<div>&nbsp;common-obj-$(CONFIG_G364FB) &#43;=3D g364fb.o</div>
<div>-common-obj-$(CONFIG_JAZZ_LED) &#43;=3D jazz_led.o</div>
<div>-common-obj-$(CONFIG_PL110) &#43;=3D pl110.o</div>
<div>&#43;obj-$(CONFIG_JAZZ_LED) &#43;=3D jazz_led.o</div>
<div>&#43;obj-$(CONFIG_PL110) &#43;=3D pl110.o</div>
<div>&nbsp;common-obj-$(CONFIG_SII9022) &#43;=3D sii9022.o</div>
<div>&nbsp;common-obj-$(CONFIG_SSD0303) &#43;=3D ssd0303.o</div>
<div>&nbsp;common-obj-$(CONFIG_SSD0323) &#43;=3D ssd0323.o</div>
<div>@@ -17,15 &#43;17,15 @@ common-obj-$(CONFIG_XEN) &#43;=3D xenfb.o</div=
>
<div>&nbsp;</div>
<div>&nbsp;common-obj-$(CONFIG_VGA_PCI) &#43;=3D vga-pci.o</div>
<div>&nbsp;common-obj-$(CONFIG_VGA_ISA) &#43;=3D vga-isa.o</div>
<div>-common-obj-$(CONFIG_VGA_ISA_MM) &#43;=3D vga-isa-mm.o</div>
<div>&#43;obj-$(CONFIG_VGA_ISA_MM) &#43;=3D vga-isa-mm.o</div>
<div>&nbsp;common-obj-$(CONFIG_VMWARE_VGA) &#43;=3D vmware_vga.o</div>
<div>&nbsp;common-obj-$(CONFIG_BOCHS_DISPLAY) &#43;=3D bochs-display.o</div=
>
<div>&nbsp;</div>
<div>&nbsp;common-obj-$(CONFIG_BLIZZARD) &#43;=3D blizzard.o</div>
<div>-common-obj-$(CONFIG_EXYNOS4) &#43;=3D exynos4210_fimd.o</div>
<div>&#43;obj-$(CONFIG_EXYNOS4) &#43;=3D exynos4210_fimd.o</div>
<div>&nbsp;common-obj-$(CONFIG_FRAMEBUFFER) &#43;=3D framebuffer.o</div>
<div>&nbsp;obj-$(CONFIG_MILKYMIST) &#43;=3D milkymist-vgafb.o</div>
<div>-common-obj-$(CONFIG_ZAURUS) &#43;=3D tc6393xb.o</div>
<div>&#43;obj-$(CONFIG_ZAURUS) &#43;=3D tc6393xb.o</div>
<div>&nbsp;</div>
<div>&nbsp;obj-$(CONFIG_MILKYMIST_TMU2) &#43;=3D milkymist-tmu2.o</div>
<div>&nbsp;milkymist-tmu2.o-cflags :=3D $(X11_CFLAGS) $(OPENGL_CFLAGS)</div=
>
<div>diff --git a/hw/dma/Makefile.objs b/hw/dma/Makefile.objs</div>
<div>index 8b39f9c..7e17776 100644</div>
<div>--- a/hw/dma/Makefile.objs</div>
<div>&#43;&#43;&#43; b/hw/dma/Makefile.objs</div>
<div>@@ -1,17 &#43;1,17 @@</div>
<div>-common-obj-$(CONFIG_PUV3) &#43;=3D puv3_dma.o</div>
<div>-common-obj-$(CONFIG_RC4030) &#43;=3D rc4030.o</div>
<div>-common-obj-$(CONFIG_PL080) &#43;=3D pl080.o</div>
<div>-common-obj-$(CONFIG_PL330) &#43;=3D pl330.o</div>
<div>&#43;obj-$(CONFIG_PUV3) &#43;=3D puv3_dma.o</div>
<div>&#43;obj-$(CONFIG_RC4030) &#43;=3D rc4030.o</div>
<div>&#43;obj-$(CONFIG_PL080) &#43;=3D pl080.o</div>
<div>&#43;obj-$(CONFIG_PL330) &#43;=3D pl330.o</div>
<div>&nbsp;common-obj-$(CONFIG_I82374) &#43;=3D i82374.o</div>
<div>-common-obj-$(CONFIG_I8257) &#43;=3D i8257.o</div>
<div>-common-obj-$(CONFIG_XILINX_AXI) &#43;=3D xilinx_axidma.o</div>
<div>&#43;obj-$(CONFIG_I8257) &#43;=3D i8257.o</div>
<div>&#43;obj-$(CONFIG_XILINX_AXI) &#43;=3D xilinx_axidma.o</div>
<div>&nbsp;common-obj-$(CONFIG_ZYNQ_DEVCFG) &#43;=3D xlnx-zynq-devcfg.o</di=
v>
<div>-common-obj-$(CONFIG_ETRAXFS) &#43;=3D etraxfs_dma.o</div>
<div>-common-obj-$(CONFIG_STP2000) &#43;=3D sparc32_dma.o</div>
<div>&#43;obj-$(CONFIG_ETRAXFS) &#43;=3D etraxfs_dma.o</div>
<div>&#43;obj-$(CONFIG_STP2000) &#43;=3D sparc32_dma.o</div>
<div>&nbsp;obj-$(CONFIG_XLNX_ZYNQMP) &#43;=3D xlnx_dpdma.o</div>
<div>&nbsp;obj-$(CONFIG_XLNX_ZYNQMP_ARM) &#43;=3D xlnx_dpdma.o</div>
<div>&nbsp;common-obj-$(CONFIG_XLNX_ZYNQMP_ARM) &#43;=3D xlnx-zdma.o</div>
<div>&nbsp;</div>
<div>&nbsp;obj-$(CONFIG_OMAP) &#43;=3D omap_dma.o soc_dma.o</div>
<div>&nbsp;obj-$(CONFIG_PXA2XX) &#43;=3D pxa2xx_dma.o</div>
<div>-common-obj-$(CONFIG_RASPI) &#43;=3D bcm2835_dma.o</div>
<div>&#43;obj-$(CONFIG_RASPI) &#43;=3D bcm2835_dma.o</div>
<div>diff --git a/hw/gpio/Makefile.objs b/hw/gpio/Makefile.objs</div>
<div>index e5da0cb..9d297fd 100644</div>
<div>--- a/hw/gpio/Makefile.objs</div>
<div>&#43;&#43;&#43; b/hw/gpio/Makefile.objs</div>
<div>@@ -1,7 &#43;1,7 @@</div>
<div>&nbsp;common-obj-$(CONFIG_MAX7310) &#43;=3D max7310.o</div>
<div>-common-obj-$(CONFIG_PL061) &#43;=3D pl061.o</div>
<div>-common-obj-$(CONFIG_PUV3) &#43;=3D puv3_gpio.o</div>
<div>-common-obj-$(CONFIG_ZAURUS) &#43;=3D zaurus.o</div>
<div>&#43;obj-$(CONFIG_PL061) &#43;=3D pl061.o</div>
<div>&#43;obj-$(CONFIG_PUV3) &#43;=3D puv3_gpio.o</div>
<div>&#43;obj-$(CONFIG_ZAURUS) &#43;=3D zaurus.o</div>
<div>&nbsp;common-obj-$(CONFIG_E500) &#43;=3D mpc8xxx.o</div>
<div>&nbsp;common-obj-$(CONFIG_GPIO_KEY) &#43;=3D gpio_key.o</div>
<div>&nbsp;</div>
<div>diff --git a/hw/i2c/Makefile.objs b/hw/i2c/Makefile.objs</div>
<div>index d7073a4..9c8839c 100644</div>
<div>--- a/hw/i2c/Makefile.objs</div>
<div>&#43;&#43;&#43; b/hw/i2c/Makefile.objs</div>
<div>@@ -1,13 &#43;1,13 @@</div>
<div>&nbsp;common-obj-$(CONFIG_I2C) &#43;=3D core.o smbus_slave.o smbus_mas=
ter.o</div>
<div>&nbsp;common-obj-$(CONFIG_SMBUS_EEPROM) &#43;=3D smbus_eeprom.o</div>
<div>-common-obj-$(CONFIG_VERSATILE_I2C) &#43;=3D versatile_i2c.o</div>
<div>&#43;obj-$(CONFIG_VERSATILE_I2C) &#43;=3D versatile_i2c.o</div>
<div>&nbsp;common-obj-$(CONFIG_ACPI_X86_ICH) &#43;=3D smbus_ich9.o</div>
<div>&nbsp;common-obj-$(CONFIG_ACPI_SMBUS) &#43;=3D pm_smbus.o</div>
<div>&nbsp;common-obj-$(CONFIG_BITBANG_I2C) &#43;=3D bitbang_i2c.o</div>
<div>-common-obj-$(CONFIG_EXYNOS4) &#43;=3D exynos4210_i2c.o</div>
<div>-common-obj-$(CONFIG_IMX_I2C) &#43;=3D imx_i2c.o</div>
<div>&#43;obj-$(CONFIG_EXYNOS4) &#43;=3D exynos4210_i2c.o</div>
<div>&#43;obj-$(CONFIG_IMX_I2C) &#43;=3D imx_i2c.o</div>
<div>&nbsp;common-obj-$(CONFIG_ASPEED_SOC) &#43;=3D aspeed_i2c.o</div>
<div>&nbsp;common-obj-$(CONFIG_NRF51_SOC) &#43;=3D microbit_i2c.o</div>
<div>-common-obj-$(CONFIG_MPC_I2C) &#43;=3D mpc_i2c.o</div>
<div>&#43;obj-$(CONFIG_MPC_I2C) &#43;=3D mpc_i2c.o</div>
<div>&nbsp;obj-$(CONFIG_OMAP) &#43;=3D omap_i2c.o</div>
<div>&nbsp;obj-$(CONFIG_PPC4XX) &#43;=3D ppc4xx_i2c.o</div>
<div>diff --git a/hw/input/Makefile.objs b/hw/input/Makefile.objs</div>
<div>index a1bc502..e096cc5 100644</div>
<div>--- a/hw/input/Makefile.objs</div>
<div>&#43;&#43;&#43; b/hw/input/Makefile.objs</div>
<div>@@ -1,8 &#43;1,8 @@</div>
<div>&nbsp;common-obj-$(CONFIG_ADB) &#43;=3D adb.o adb-mouse.o adb-kbd.o</d=
iv>
<div>&nbsp;common-obj-y &#43;=3D hid.o</div>
<div>&nbsp;common-obj-$(CONFIG_LM832X) &#43;=3D lm832x.o</div>
<div>-common-obj-$(CONFIG_PCKBD) &#43;=3D pckbd.o</div>
<div>-common-obj-$(CONFIG_PL050) &#43;=3D pl050.o</div>
<div>&#43;obj-$(CONFIG_PCKBD) &#43;=3D pckbd.o</div>
<div>&#43;obj-$(CONFIG_PL050) &#43;=3D pl050.o</div>
<div>&nbsp;common-obj-$(CONFIG_PS2) &#43;=3D ps2.o</div>
<div>&nbsp;common-obj-$(CONFIG_STELLARIS_INPUT) &#43;=3D stellaris_input.o<=
/div>
<div>&nbsp;common-obj-$(CONFIG_TSC2005) &#43;=3D tsc2005.o</div>
<div>diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs</div>
<div>index 03019b9..6d7ba84 100644</div>
<div>--- a/hw/intc/Makefile.objs</div>
<div>&#43;&#43;&#43; b/hw/intc/Makefile.objs</div>
<div>@@ -1,24 &#43;1,25 @@</div>
<div>&nbsp;common-obj-$(CONFIG_HEATHROW_PIC) &#43;=3D heathrow_pic.o</div>
<div>&nbsp;common-obj-$(CONFIG_I8259) &#43;=3D i8259_common.o i8259.o</div>
<div>-common-obj-$(CONFIG_PL190) &#43;=3D pl190.o</div>
<div>-common-obj-$(CONFIG_PUV3) &#43;=3D puv3_intc.o</div>
<div>-common-obj-$(CONFIG_XILINX) &#43;=3D xilinx_intc.o</div>
<div>&#43;obj-$(CONFIG_PL190) &#43;=3D pl190.o</div>
<div>&#43;obj-$(CONFIG_PUV3) &#43;=3D puv3_intc.o</div>
<div>&#43;obj-$(CONFIG_XILINX) &#43;=3D xilinx_intc.o</div>
<div>&nbsp;common-obj-$(CONFIG_XLNX_ZYNQMP) &#43;=3D xlnx-pmu-iomod-intc.o<=
/div>
<div>&nbsp;common-obj-$(CONFIG_XLNX_ZYNQMP) &#43;=3D xlnx-zynqmp-ipi.o</div=
>
<div>-common-obj-$(CONFIG_ETRAXFS) &#43;=3D etraxfs_pic.o</div>
<div>-common-obj-$(CONFIG_IMX) &#43;=3D imx_avic.o imx_gpcv2.o</div>
<div>&#43;obj-$(CONFIG_ETRAXFS) &#43;=3D etraxfs_pic.o</div>
<div>&#43;obj-$(CONFIG_IMX) &#43;=3D imx_avic.o</div>
<div>&#43;obj-$(CONFIG_IMX) &#43;=3D imx_gpcv2.o</div>
<div>&nbsp;common-obj-$(CONFIG_LM32) &#43;=3D lm32_pic.o</div>
<div>&nbsp;common-obj-$(CONFIG_REALVIEW) &#43;=3D realview_gic.o</div>
<div>-common-obj-$(CONFIG_SLAVIO) &#43;=3D slavio_intctl.o</div>
<div>&#43;obj-$(CONFIG_SLAVIO) &#43;=3D slavio_intctl.o</div>
<div>&nbsp;common-obj-$(CONFIG_IOAPIC) &#43;=3D ioapic_common.o</div>
<div>&nbsp;common-obj-$(CONFIG_ARM_GIC) &#43;=3D arm_gic_common.o</div>
<div>-common-obj-$(CONFIG_ARM_GIC) &#43;=3D arm_gic.o</div>
<div>&#43;obj-$(CONFIG_ARM_GIC) &#43;=3D arm_gic.o</div>
<div>&nbsp;common-obj-$(CONFIG_ARM_GIC) &#43;=3D arm_gicv2m.o</div>
<div>&nbsp;common-obj-$(CONFIG_ARM_GIC) &#43;=3D arm_gicv3_common.o</div>
<div>-common-obj-$(CONFIG_ARM_GIC) &#43;=3D arm_gicv3.o</div>
<div>&#43;obj-$(CONFIG_ARM_GIC) &#43;=3D arm_gicv3.o</div>
<div>&nbsp;common-obj-$(CONFIG_ARM_GIC) &#43;=3D arm_gicv3_dist.o</div>
<div>&nbsp;common-obj-$(CONFIG_ARM_GIC) &#43;=3D arm_gicv3_redist.o</div>
<div>-common-obj-$(CONFIG_ARM_GIC) &#43;=3D arm_gicv3_its_common.o</div>
<div>&#43;obj-$(CONFIG_ARM_GIC) &#43;=3D arm_gicv3_its_common.o</div>
<div>&nbsp;common-obj-$(CONFIG_OPENPIC) &#43;=3D openpic.o</div>
<div>&nbsp;common-obj-y &#43;=3D intc.o</div>
<div>&nbsp;</div>
<div>diff --git a/hw/ipack/Makefile.objs b/hw/ipack/Makefile.objs</div>
<div>index 8b9bdcb..a7c5485 100644</div>
<div>--- a/hw/ipack/Makefile.objs</div>
<div>&#43;&#43;&#43; b/hw/ipack/Makefile.objs</div>
<div>@@ -1,2 &#43;1,2 @@</div>
<div>&nbsp;common-obj-$(CONFIG_IPACK) &#43;=3D ipack.o</div>
<div>-common-obj-$(CONFIG_IPACK) &#43;=3D tpci200.o</div>
<div>&#43;obj-$(CONFIG_IPACK) &#43;=3D tpci200.o</div>
<div>diff --git a/hw/isa/Makefile.objs b/hw/isa/Makefile.objs</div>
<div>index 9e106df..898b504 100644</div>
<div>--- a/hw/isa/Makefile.objs</div>
<div>&#43;&#43;&#43; b/hw/isa/Makefile.objs</div>
<div>@@ -4,7 &#43;4,7 @@ common-obj-$(CONFIG_APM) &#43;=3D apm.o</div>
<div>&nbsp;common-obj-$(CONFIG_I82378) &#43;=3D i82378.o</div>
<div>&nbsp;common-obj-$(CONFIG_PC87312) &#43;=3D pc87312.o</div>
<div>&nbsp;common-obj-$(CONFIG_PIIX4) &#43;=3D piix4.o</div>
<div>-common-obj-$(CONFIG_VT82C686) &#43;=3D vt82c686.o</div>
<div>&#43;obj-$(CONFIG_VT82C686) &#43;=3D vt82c686.o</div>
<div>&nbsp;common-obj-$(CONFIG_SMC37C669) &#43;=3D smc37c669-superio.o</div=
>
<div>&nbsp;</div>
<div>&nbsp;obj-$(CONFIG_LPC_ICH9) &#43;=3D lpc_ich9.o</div>
<div>diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs</div>
<div>index e9aab51..6ee5a8a 100644</div>
<div>--- a/hw/misc/Makefile.objs</div>
<div>&#43;&#43;&#43; b/hw/misc/Makefile.objs</div>
<div>@@ -1,4 &#43;1,4 @@</div>
<div>-common-obj-$(CONFIG_APPLESMC) &#43;=3D applesmc.o</div>
<div>&#43;obj-$(CONFIG_APPLESMC) &#43;=3D applesmc.o</div>
<div>&nbsp;common-obj-$(CONFIG_MAX111X) &#43;=3D max111x.o</div>
<div>&nbsp;common-obj-$(CONFIG_TMP105) &#43;=3D tmp105.o</div>
<div>&nbsp;common-obj-$(CONFIG_TMP421) &#43;=3D tmp421.o</div>
<div>@@ -6,23 &#43;6,23 @@ common-obj-$(CONFIG_ISA_DEBUG) &#43;=3D debugexi=
t.o</div>
<div>&nbsp;common-obj-$(CONFIG_SGA) &#43;=3D sga.o</div>
<div>&nbsp;common-obj-$(CONFIG_ISA_TESTDEV) &#43;=3D pc-testdev.o</div>
<div>&nbsp;common-obj-$(CONFIG_PCI_TESTDEV) &#43;=3D pci-testdev.o</div>
<div>-common-obj-$(CONFIG_EDU) &#43;=3D edu.o</div>
<div>&#43;obj-$(CONFIG_EDU) &#43;=3D edu.o</div>
<div>&nbsp;common-obj-$(CONFIG_PCA9552) &#43;=3D pca9552.o</div>
<div>&nbsp;</div>
<div>-common-obj-y &#43;=3D unimp.o</div>
<div>&#43;obj-y &#43;=3D unimp.o</div>
<div>&nbsp;common-obj-$(CONFIG_FW_CFG_DMA) &#43;=3D vmcoreinfo.o</div>
<div>&nbsp;</div>
<div>&nbsp;# ARM devices</div>
<div>-common-obj-$(CONFIG_PL310) &#43;=3D arm_l2x0.o</div>
<div>-common-obj-$(CONFIG_INTEGRATOR_DEBUG) &#43;=3D arm_integrator_debug.o=
</div>
<div>-common-obj-$(CONFIG_A9SCU) &#43;=3D a9scu.o</div>
<div>-common-obj-$(CONFIG_ARM11SCU) &#43;=3D arm11scu.o</div>
<div>&#43;obj-$(CONFIG_PL310) &#43;=3D arm_l2x0.o</div>
<div>&#43;obj-$(CONFIG_INTEGRATOR_DEBUG) &#43;=3D arm_integrator_debug.o</d=
iv>
<div>&#43;obj-$(CONFIG_A9SCU) &#43;=3D a9scu.o</div>
<div>&#43;obj-$(CONFIG_ARM11SCU) &#43;=3D arm11scu.o</div>
<div>&nbsp;</div>
<div>&nbsp;# Mac devices</div>
<div>-common-obj-$(CONFIG_MOS6522) &#43;=3D mos6522.o</div>
<div>&#43;obj-$(CONFIG_MOS6522) &#43;=3D mos6522.o</div>
<div>&nbsp;</div>
<div>&nbsp;# PKUnity SoC devices</div>
<div>-common-obj-$(CONFIG_PUV3) &#43;=3D puv3_pm.o</div>
<div>&#43;obj-$(CONFIG_PUV3) &#43;=3D puv3_pm.o</div>
<div>&nbsp;</div>
<div>&nbsp;common-obj-$(CONFIG_MACIO) &#43;=3D macio/</div>
<div>&nbsp;</div>
<div>diff --git a/hw/net/Makefile.objs b/hw/net/Makefile.objs</div>
<div>index 9904273..1ff7b59 100644</div>
<div>--- a/hw/net/Makefile.objs</div>
<div>&#43;&#43;&#43; b/hw/net/Makefile.objs</div>
<div>@@ -1,4 &#43;1,4 @@</div>
<div>-common-obj-$(CONFIG_DP8393X) &#43;=3D dp8393x.o</div>
<div>&#43;obj-$(CONFIG_DP8393X) &#43;=3D dp8393x.o</div>
<div>&nbsp;common-obj-$(CONFIG_XEN) &#43;=3D xen_nic.o</div>
<div>&nbsp;common-obj-$(CONFIG_NE2000_COMMON) &#43;=3D ne2000.o</div>
<div>&nbsp;</div>
<div>@@ -14,19 &#43;14,19 @@ common-obj-$(CONFIG_RTL8139_PCI) &#43;=3D rtl8=
139.o</div>
<div>&nbsp;common-obj-$(CONFIG_VMXNET3_PCI) &#43;=3D net_tx_pkt.o net_rx_pk=
t.o</div>
<div>&nbsp;common-obj-$(CONFIG_VMXNET3_PCI) &#43;=3D vmxnet3.o</div>
<div>&nbsp;</div>
<div>-common-obj-$(CONFIG_SMC91C111) &#43;=3D smc91c111.o</div>
<div>-common-obj-$(CONFIG_LAN9118) &#43;=3D lan9118.o</div>
<div>&#43;obj-$(CONFIG_SMC91C111) &#43;=3D smc91c111.o</div>
<div>&#43;obj-$(CONFIG_LAN9118) &#43;=3D lan9118.o</div>
<div>&nbsp;common-obj-$(CONFIG_NE2000_ISA) &#43;=3D ne2000-isa.o</div>
<div>&nbsp;common-obj-$(CONFIG_OPENCORES_ETH) &#43;=3D opencores_eth.o</div=
>
<div>&nbsp;common-obj-$(CONFIG_XGMAC) &#43;=3D xgmac.o</div>
<div>&nbsp;common-obj-$(CONFIG_MIPSNET) &#43;=3D mipsnet.o</div>
<div>&nbsp;common-obj-$(CONFIG_XILINX_AXI) &#43;=3D xilinx_axienet.o</div>
<div>-common-obj-$(CONFIG_ALLWINNER_EMAC) &#43;=3D allwinner_emac.o</div>
<div>-common-obj-$(CONFIG_IMX_FEC) &#43;=3D imx_fec.o</div>
<div>&#43;obj-$(CONFIG_ALLWINNER_EMAC) &#43;=3D allwinner_emac.o</div>
<div>&#43;obj-$(CONFIG_IMX_FEC) &#43;=3D imx_fec.o</div>
<div>&nbsp;</div>
<div>&nbsp;common-obj-$(CONFIG_CADENCE) &#43;=3D cadence_gem.o</div>
<div>-common-obj-$(CONFIG_STELLARIS_ENET) &#43;=3D stellaris_enet.o</div>
<div>-common-obj-$(CONFIG_LANCE) &#43;=3D lance.o</div>
<div>&#43;obj-$(CONFIG_STELLARIS_ENET) &#43;=3D stellaris_enet.o</div>
<div>&#43;obj-$(CONFIG_LANCE) &#43;=3D lance.o</div>
<div>&nbsp;common-obj-$(CONFIG_SUNHME) &#43;=3D sunhme.o</div>
<div>&nbsp;common-obj-$(CONFIG_FTGMAC100) &#43;=3D ftgmac100.o</div>
<div>&nbsp;common-obj-$(CONFIG_SUNGEM) &#43;=3D sungem.o</div>
<div>diff --git a/hw/pci-host/Makefile.objs b/hw/pci-host/Makefile.objs</di=
v>
<div>index a9cd3e0..0970e8e 100644</div>
<div>--- a/hw/pci-host/Makefile.objs</div>
<div>&#43;&#43;&#43; b/hw/pci-host/Makefile.objs</div>
<div>@@ -9,12 &#43;9,12 @@ common-obj-$(CONFIG_UNIN_PCI) &#43;=3D uninorth.=
o</div>
<div>&nbsp;common-obj-$(CONFIG_PPCE500_PCI) &#43;=3D ppce500.o</div>
<div>&nbsp;</div>
<div>&nbsp;# ARM devices</div>
<div>-common-obj-$(CONFIG_VERSATILE_PCI) &#43;=3D versatile.o</div>
<div>&#43;obj-$(CONFIG_VERSATILE_PCI) &#43;=3D versatile.o</div>
<div>&nbsp;</div>
<div>&nbsp;common-obj-$(CONFIG_PCI_SABRE) &#43;=3D sabre.o</div>
<div>-common-obj-$(CONFIG_FULONG) &#43;=3D bonito.o</div>
<div>&#43;obj-$(CONFIG_FULONG) &#43;=3D bonito.o</div>
<div>&nbsp;common-obj-$(CONFIG_PCI_PIIX) &#43;=3D piix.o</div>
<div>-common-obj-$(CONFIG_PCI_EXPRESS_Q35) &#43;=3D q35.o</div>
<div>&#43;obj-$(CONFIG_PCI_EXPRESS_Q35) &#43;=3D q35.o</div>
<div>&nbsp;common-obj-$(CONFIG_PCI_EXPRESS_GENERIC_BRIDGE) &#43;=3D gpex.o<=
/div>
<div>&nbsp;common-obj-$(CONFIG_PCI_EXPRESS_XILINX) &#43;=3D xilinx-pcie.o</=
div>
<div>&nbsp;</div>
<div>diff --git a/hw/scsi/Makefile.objs b/hw/scsi/Makefile.objs</div>
<div>index 54b36ed..418af9a 100644</div>
<div>--- a/hw/scsi/Makefile.objs</div>
<div>&#43;&#43;&#43; b/hw/scsi/Makefile.objs</div>
<div>@@ -4,7 &#43;4,7 @@ common-obj-$(CONFIG_LSI_SCSI_PCI) &#43;=3D lsi53c8=
95a.o</div>
<div>&nbsp;common-obj-$(CONFIG_MPTSAS_SCSI_PCI) &#43;=3D mptsas.o mptconfig=
.o mptendian.o</div>
<div>&nbsp;common-obj-$(CONFIG_MEGASAS_SCSI_PCI) &#43;=3D megasas.o</div>
<div>&nbsp;common-obj-$(CONFIG_VMW_PVSCSI_SCSI_PCI) &#43;=3D vmw_pvscsi.o</=
div>
<div>-common-obj-$(CONFIG_ESP) &#43;=3D esp.o</div>
<div>&#43;obj-$(CONFIG_ESP) &#43;=3D esp.o</div>
<div>&nbsp;common-obj-$(CONFIG_ESP_PCI) &#43;=3D esp-pci.o</div>
<div>&nbsp;obj-$(CONFIG_SPAPR_VSCSI) &#43;=3D spapr_vscsi.o</div>
<div>&nbsp;</div>
<div>diff --git a/hw/sd/Makefile.objs b/hw/sd/Makefile.objs</div>
<div>index 0665727..a8cd6bf 100644</div>
<div>--- a/hw/sd/Makefile.objs</div>
<div>&#43;&#43;&#43; b/hw/sd/Makefile.objs</div>
<div>@@ -1,4 &#43;1,4 @@</div>
<div>-common-obj-$(CONFIG_PL181) &#43;=3D pl181.o</div>
<div>&#43;obj-$(CONFIG_PL181) &#43;=3D pl181.o</div>
<div>&nbsp;common-obj-$(CONFIG_SSI_SD) &#43;=3D ssi-sd.o</div>
<div>&nbsp;common-obj-$(CONFIG_SD) &#43;=3D sd.o core.o sdmmc-internal.o</d=
iv>
<div>&nbsp;common-obj-$(CONFIG_SDHCI) &#43;=3D sdhci.o</div>
<div>diff --git a/hw/ssi/Makefile.objs b/hw/ssi/Makefile.objs</div>
<div>index f5bcc65..b084802 100644</div>
<div>--- a/hw/ssi/Makefile.objs</div>
<div>&#43;&#43;&#43; b/hw/ssi/Makefile.objs</div>
<div>@@ -1,10 &#43;1,10 @@</div>
<div>-common-obj-$(CONFIG_PL022) &#43;=3D pl022.o</div>
<div>&#43;obj-$(CONFIG_PL022) &#43;=3D pl022.o</div>
<div>&nbsp;common-obj-$(CONFIG_SSI) &#43;=3D ssi.o</div>
<div>-common-obj-$(CONFIG_XILINX_SPI) &#43;=3D xilinx_spi.o</div>
<div>-common-obj-$(CONFIG_XILINX_SPIPS) &#43;=3D xilinx_spips.o</div>
<div>&#43;obj-$(CONFIG_XILINX_SPI) &#43;=3D xilinx_spi.o</div>
<div>&#43;obj-$(CONFIG_XILINX_SPIPS) &#43;=3D xilinx_spips.o</div>
<div>&nbsp;common-obj-$(CONFIG_ASPEED_SOC) &#43;=3D aspeed_smc.o</div>
<div>-common-obj-$(CONFIG_STM32F2XX_SPI) &#43;=3D stm32f2xx_spi.o</div>
<div>-common-obj-$(CONFIG_MSF2) &#43;=3D mss-spi.o</div>
<div>&#43;obj-$(CONFIG_STM32F2XX_SPI) &#43;=3D stm32f2xx_spi.o</div>
<div>&#43;obj-$(CONFIG_MSF2) &#43;=3D mss-spi.o</div>
<div>&nbsp;</div>
<div>&nbsp;obj-$(CONFIG_OMAP) &#43;=3D omap_spi.o</div>
<div>&nbsp;obj-$(CONFIG_IMX) &#43;=3D imx_spi.o</div>
<div>diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs</div>
<div>index 123d92c..0a8f651 100644</div>
<div>--- a/hw/timer/Makefile.objs</div>
<div>&#43;&#43;&#43; b/hw/timer/Makefile.objs</div>
<div>@@ -1,27 &#43;1,27 @@</div>
<div>-common-obj-$(CONFIG_ARM_TIMER) &#43;=3D arm_timer.o</div>
<div>-common-obj-$(CONFIG_ARM_MPTIMER) &#43;=3D arm_mptimer.o</div>
<div>-common-obj-$(CONFIG_ARM_V7M) &#43;=3D armv7m_systick.o</div>
<div>-common-obj-$(CONFIG_A9_GTIMER) &#43;=3D a9gtimer.o</div>
<div>-common-obj-$(CONFIG_CADENCE) &#43;=3D cadence_ttc.o</div>
<div>&#43;obj-$(CONFIG_ARM_TIMER) &#43;=3D arm_timer.o</div>
<div>&#43;obj-$(CONFIG_ARM_MPTIMER) &#43;=3D arm_mptimer.o</div>
<div>&#43;obj-$(CONFIG_ARM_V7M) &#43;=3D armv7m_systick.o</div>
<div>&#43;obj-$(CONFIG_A9_GTIMER) &#43;=3D a9gtimer.o</div>
<div>&#43;obj-$(CONFIG_CADENCE) &#43;=3D cadence_ttc.o</div>
<div>&nbsp;common-obj-$(CONFIG_DS1338) &#43;=3D ds1338.o</div>
<div>-common-obj-$(CONFIG_HPET) &#43;=3D hpet.o</div>
<div>&#43;obj-$(CONFIG_HPET) &#43;=3D hpet.o</div>
<div>&nbsp;common-obj-$(CONFIG_I8254) &#43;=3D i8254_common.o i8254.o</div>
<div>&nbsp;common-obj-$(CONFIG_M41T80) &#43;=3D m41t80.o</div>
<div>&nbsp;common-obj-$(CONFIG_M48T59) &#43;=3D m48t59.o</div>
<div>&nbsp;ifeq ($(CONFIG_ISA_BUS),y)</div>
<div>&nbsp;common-obj-$(CONFIG_M48T59) &#43;=3D m48t59-isa.o</div>
<div>&nbsp;endif</div>
<div>-common-obj-$(CONFIG_PL031) &#43;=3D pl031.o</div>
<div>-common-obj-$(CONFIG_PUV3) &#43;=3D puv3_ost.o</div>
<div>&#43;obj-$(CONFIG_PL031) &#43;=3D pl031.o</div>
<div>&#43;obj-$(CONFIG_PUV3) &#43;=3D puv3_ost.o</div>
<div>&nbsp;common-obj-$(CONFIG_TWL92230) &#43;=3D twl92230.o</div>
<div>-common-obj-$(CONFIG_XILINX) &#43;=3D xilinx_timer.o</div>
<div>-common-obj-$(CONFIG_SLAVIO) &#43;=3D slavio_timer.o</div>
<div>&#43;obj-$(CONFIG_XILINX) &#43;=3D xilinx_timer.o</div>
<div>&#43;obj-$(CONFIG_SLAVIO) &#43;=3D slavio_timer.o</div>
<div>&nbsp;common-obj-$(CONFIG_ETRAXFS) &#43;=3D etraxfs_timer.o</div>
<div>-common-obj-$(CONFIG_GRLIB) &#43;=3D grlib_gptimer.o</div>
<div>-common-obj-$(CONFIG_IMX) &#43;=3D imx_epit.o</div>
<div>-common-obj-$(CONFIG_IMX) &#43;=3D imx_gpt.o</div>
<div>-common-obj-$(CONFIG_LM32) &#43;=3D lm32_timer.o</div>
<div>-common-obj-$(CONFIG_MILKYMIST) &#43;=3D milkymist-sysctl.o</div>
<div>&#43;obj-$(CONFIG_GRLIB) &#43;=3D grlib_gptimer.o</div>
<div>&#43;obj-$(CONFIG_IMX) &#43;=3D imx_epit.o</div>
<div>&#43;obj-$(CONFIG_IMX) &#43;=3D imx_gpt.o</div>
<div>&#43;obj-$(CONFIG_LM32) &#43;=3D lm32_timer.o</div>
<div>&#43;obj-$(CONFIG_MILKYMIST) &#43;=3D milkymist-sysctl.o</div>
<div>&nbsp;common-obj-$(CONFIG_XLNX_ZYNQMP) &#43;=3D xlnx-zynqmp-rtc.o</div=
>
<div>&nbsp;common-obj-$(CONFIG_NRF51_SOC) &#43;=3D nrf51_timer.o</div>
<div>&nbsp;</div>
<div>@@ -40,10 &#43;40,11 @@ obj-$(CONFIG_MC146818RTC) &#43;=3D mc146818rtc=
.o</div>
<div>&nbsp;</div>
<div>&nbsp;obj-$(CONFIG_ALLWINNER_A10_PIT) &#43;=3D allwinner-a10-pit.o</di=
v>
<div>&nbsp;</div>
<div>-common-obj-$(CONFIG_STM32F2XX_TIMER) &#43;=3D stm32f2xx_timer.o</div>
<div>-common-obj-$(CONFIG_ASPEED_SOC) &#43;=3D aspeed_timer.o aspeed_rtc.o<=
/div>
<div>&#43;obj-$(CONFIG_STM32F2XX_TIMER) &#43;=3D stm32f2xx_timer.o</div>
<div>&#43;common-obj-$(CONFIG_ASPEED_SOC) &#43;=3D aspeed_timer.o</div>
<div>&#43;obj-$(CONFIG_ASPEED_SOC) &#43;=3D aspeed_rtc.o</div>
<div>&nbsp;</div>
<div>-common-obj-$(CONFIG_SUN4V_RTC) &#43;=3D sun4v-rtc.o</div>
<div>&#43;obj-$(CONFIG_SUN4V_RTC) &#43;=3D sun4v-rtc.o</div>
<div>&nbsp;common-obj-$(CONFIG_CMSDK_APB_TIMER) &#43;=3D cmsdk-apb-timer.o<=
/div>
<div>&nbsp;common-obj-$(CONFIG_CMSDK_APB_DUALTIMER) &#43;=3D cmsdk-apb-dual=
timer.o</div>
<div>-common-obj-$(CONFIG_MSF2) &#43;=3D mss-timer.o</div>
<div>&#43;obj-$(CONFIG_MSF2) &#43;=3D mss-timer.o</div>
<div>diff --git a/hw/virtio/Makefile.objs b/hw/virtio/Makefile.objs</div>
<div>index 964ce78..573b1a9 100644</div>
<div>--- a/hw/virtio/Makefile.objs</div>
<div>&#43;&#43;&#43; b/hw/virtio/Makefile.objs</div>
<div>@@ -8,7 &#43;8,7 @@ obj-$(CONFIG_VHOST_USER) &#43;=3D vhost-user.o</di=
v>
<div>&nbsp;</div>
<div>&nbsp;common-obj-$(CONFIG_VIRTIO_RNG) &#43;=3D virtio-rng.o</div>
<div>&nbsp;common-obj-$(CONFIG_VIRTIO_PCI) &#43;=3D virtio-pci.o</div>
<div>-common-obj-$(CONFIG_VIRTIO_MMIO) &#43;=3D virtio-mmio.o</div>
<div>&#43;obj-$(CONFIG_VIRTIO_MMIO) &#43;=3D virtio-mmio.o</div>
<div>&nbsp;obj-$(CONFIG_VIRTIO_BALLOON) &#43;=3D virtio-balloon.o</div>
<div>&nbsp;obj-$(CONFIG_VIRTIO_CRYPTO) &#43;=3D virtio-crypto.o</div>
<div>&nbsp;obj-$(call land,$(CONFIG_VIRTIO_CRYPTO),$(CONFIG_VIRTIO_PCI)) &#=
43;=3D virtio-crypto-pci.o</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_156516666883025608btcom_--


--===============6081151666295021508==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6081151666295021508==--

