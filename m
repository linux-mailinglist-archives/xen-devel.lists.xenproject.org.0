Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC51A4BC0C
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 11:27:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900150.1308067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp31A-0006yo-IQ; Mon, 03 Mar 2025 10:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900150.1308067; Mon, 03 Mar 2025 10:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp31A-0006wJ-Fi; Mon, 03 Mar 2025 10:27:24 +0000
Received: by outflank-mailman (input) for mailman id 900150;
 Mon, 03 Mar 2025 10:27:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W32C=VW=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1tp318-0006wD-Hx
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 10:27:22 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 17253ec7-f81a-11ef-9ab2-95dc52dad729;
 Mon, 03 Mar 2025 11:27:21 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10AA5113E;
 Mon,  3 Mar 2025 02:27:35 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.37.154])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B6B43F66E;
 Mon,  3 Mar 2025 02:27:19 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 17253ec7-f81a-11ef-9ab2-95dc52dad729
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm: Fix platforms Kconfig indent
Date: Mon,  3 Mar 2025 11:27:15 +0100
Message-ID: <fdf893f3d685ad48340ae8c11ecf0723523c35ad.1740997574.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix platforms/Kconfig and Kconfig.debug help ident to respect the
standard (tab + 2 spaces).
While there also move some default in Kconfig.debug before the help
message.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v2:
- also fix help indent in Kconfig.debug
---
 xen/arch/arm/Kconfig.debug     | 82 +++++++++++++++++-----------------
 xen/arch/arm/platforms/Kconfig | 20 ++++-----
 2 files changed, 51 insertions(+), 51 deletions(-)

diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
index 84a0616102f2..5a03b220ac9e 100644
--- a/xen/arch/arm/Kconfig.debug
+++ b/xen/arch/arm/Kconfig.debug
@@ -2,85 +2,85 @@ choice
 	bool "Early printk"
 	optional
 	help
-		You may want to enable early printk if you are debugging code
-		that executes before the console is initialized.
+	  You may want to enable early printk if you are debugging code
+	  that executes before the console is initialized.
 
-		Note that selecting this option will limit Xen to a single UART
-		definition. Attempting to boot Xen image on a different
-		platform *will not work*, so this option should not be enable
-		for Xens that are intended to be portable.
+	  Note that selecting this option will limit Xen to a single UART
+	  definition. Attempting to boot Xen image on a different
+	  platform *will not work*, so this option should not be enable
+	  for Xens that are intended to be portable.
 
-		Choose one of the UART drivers for early printk, then you'll
-		have to specify the parameters, like the base address.
+	  Choose one of the UART drivers for early printk, then you'll
+	  have to specify the parameters, like the base address.
 
 	config EARLY_UART_CHOICE_8250
 		select EARLY_UART_8250
 		bool "Early printk via 8250 UART"
 		help
-			Say Y here if you wish the early printk to direct their
-			output to a 8250 UART.
+		  Say Y here if you wish the early printk to direct their
+		  output to a 8250 UART.
 
 	config EARLY_UART_CHOICE_CADENCE
 		select EARLY_UART_CADENCE
 		depends on ARM_64
 		bool "Early printk via Cadence UART"
 		help
-			Say Y here if you wish the early printk to direct their
-			output to a Cadence UART.
+		  Say Y here if you wish the early printk to direct their
+		  output to a Cadence UART.
 
 	config EARLY_UART_CHOICE_EXYNOS4210
 		select EARLY_UART_EXYNOS4210
 		depends on ARM_32
 		bool "Early printk via Exynos4210 UART"
 		help
-			Say Y here if you wish the early printk to direct their
-			output to a Exynos 4210 UART.
+		  Say Y here if you wish the early printk to direct their
+		  output to a Exynos 4210 UART.
 
 	config EARLY_UART_CHOICE_IMX_LPUART
 		select EARLY_UART_IMX_LPUART
 		depends on ARM_64
 		bool "Early printk via i.MX LPUART"
 		help
-			Say Y here if you wish the early printk to direct their
-			output to a i.MX LPUART.
+		  Say Y here if you wish the early printk to direct their
+		  output to a i.MX LPUART.
 
 	config EARLY_UART_CHOICE_LINFLEX
 		select EARLY_UART_LINFLEX
 		depends on ARM_64
 		bool "Early printk via NXP LINFlexD UART"
 		help
-			Say Y here if you wish the early printk to direct their
-			output to an NXP LINFlexD UART.
+		  Say Y here if you wish the early printk to direct their
+		  output to an NXP LINFlexD UART.
 
 	config EARLY_UART_CHOICE_MESON
 		select EARLY_UART_MESON
 		depends on ARM_64
 		bool "Early printk via MESON UART"
 		help
-			Say Y here if you wish the early printk to direct their
-			output to a MESON UART.
+		  Say Y here if you wish the early printk to direct their
+		  output to a MESON UART.
 
 	config EARLY_UART_CHOICE_MVEBU
 		select EARLY_UART_MVEBU
 		depends on ARM_64
 		bool "Early printk via MVEBU UART"
 		help
-			Say Y here if you wish the early printk to direct their
-			output to a MVEBU UART.
+		  Say Y here if you wish the early printk to direct their
+		  output to a MVEBU UART.
 
 	config EARLY_UART_CHOICE_PL011
 		select EARLY_UART_PL011
 		bool "Early printk via PL011 UART"
 		help
-			Say Y here if you wish the early printk to direct their
-			output to a PL011 UART.
+		  Say Y here if you wish the early printk to direct their
+		  output to a PL011 UART.
 
 	config EARLY_UART_CHOICE_SCIF
 		select EARLY_UART_SCIF
 		bool "Early printk via SCIF UART"
 		help
-			Say Y here if you wish the early printk to direct their
-			output to a SCIF UART.
+		  Say Y here if you wish the early printk to direct their
+		  output to a SCIF UART.
 
 endchoice
 
@@ -131,15 +131,14 @@ config EARLY_UART_SIZE
 config EARLY_UART_PL011_BAUD_RATE
 	depends on EARLY_UART_PL011
 	int "Early printk UART baud rate for pl011"
+	default 0
 	help
-		Optionally sets the baud rate which should be used to configure
-		the UART at start of day.
-
-		If EARLY_UART_PL011_BAUD_RATE is set to 0 then the code will
-		not try to initialize the UART, so that bootloader or firmware
-		settings can be used for maximum compatibility.
+	  Optionally sets the baud rate which should be used to configure
+	  the UART at start of day.
 
-	default 0
+	  If EARLY_UART_PL011_BAUD_RATE is set to 0 then the code will
+	  not try to initialize the UART, so that bootloader or firmware
+	  settings can be used for maximum compatibility.
 
 config EARLY_UART_PL011_MMIO32
 	bool "32-bit only MMIO for PL011 early printk"
@@ -155,24 +154,25 @@ config EARLY_UART_INIT
 config EARLY_UART_8250_REG_SHIFT
 	depends on EARLY_UART_8250
 	int "Early printk, left-shift to apply to the register offsets within the 8250 UART"
+	default 0
 	help
-		EARLY_UART_8250_REG_SHIFT is, optionally, the left-shift to
-		apply to the register offsets within the UART with early
-		printk.
+	  EARLY_UART_8250_REG_SHIFT is, optionally, the left-shift to
+	  apply to the register offsets within the UART with early
+	  printk.
 
-		Default to 0.
+	  Default to 0.
 
-	default 0
 
 choice EARLY_UART_SCIF_VERSION
 	prompt "Early printk UART SCIF interface version"
 	depends on EARLY_UART_SCIF
 	default EARLY_UART_SCIF_VERSION_NONE
 	help
-		Select the interface version of the SCIF UART.
+	  Select the interface version of the SCIF UART.
+
+	  Select EARLY_UART_SCIF_VERSION_NONE to use the default
+	  interface version (SCIF).
 
-		Select EARLY_UART_SCIF_VERSION_NONE to use the default
-		interface version (SCIF).
 	config EARLY_UART_SCIF_VERSION_NONE
 		bool "default SCIF UART interface"
 	config EARLY_UART_SCIF_VERSION_A
diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
index 6dbf6ec87b1d..b938de329762 100644
--- a/xen/arch/arm/platforms/Kconfig
+++ b/xen/arch/arm/platforms/Kconfig
@@ -2,15 +2,15 @@ choice
 	prompt "Platform Support" if MMU
 	default ALL_PLAT
 	help
-	Choose which hardware platform to enable in Xen.
+	  Choose which hardware platform to enable in Xen.
 
-	If unsure, choose ALL_PLAT.
+	  If unsure, choose ALL_PLAT.
 
 config ALL_PLAT
 	bool "All Platforms"
 	help
-	Enable support for all available hardware platforms. It doesn't
-	automatically select any of the related drivers.
+	  Enable support for all available hardware platforms. It doesn't
+	  automatically select any of the related drivers.
 
 config QEMU
 	bool "QEMU aarch virt machine support"
@@ -18,8 +18,8 @@ config QEMU
 	select GICV3
 	select HAS_PL011
 	help
-	Enable all the required drivers for QEMU aarch64 virt emulated
-	machine.
+	  Enable all the required drivers for QEMU aarch64 virt emulated
+	  machine.
 
 config RCAR3
 	bool "Renesas RCar3 support"
@@ -27,7 +27,7 @@ config RCAR3
 	select HAS_SCIF
 	select IPMMU_VMSA
 	help
-	Enable all the required drivers for Renesas RCar3
+	  Enable all the required drivers for Renesas RCar3
 
 config MPSOC
 	bool "Xilinx Ultrascale+ MPSoC support"
@@ -35,7 +35,7 @@ config MPSOC
 	select HAS_CADENCE_UART
 	select ARM_SMMU
 	help
-	Enable all the required drivers for Xilinx Ultrascale+ MPSoC
+	  Enable all the required drivers for Xilinx Ultrascale+ MPSoC
 
 config S32G3
 	bool "NXP S32G3 Processors support"
@@ -43,12 +43,12 @@ config S32G3
 	select HAS_LINFLEX
 	select SCMI_SMC
 	help
-	Enable all the required drivers for NXP S32G3 Processors Family
+	  Enable all the required drivers for NXP S32G3 Processors Family
 
 config NO_PLAT
 	bool "No Platforms"
 	help
-	Do not enable specific support for any platform.
+	  Do not enable specific support for any platform.
 
 endchoice
 
-- 
2.47.1


