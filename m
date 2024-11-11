Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1109C44C1
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 19:17:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834095.1249622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAYyG-0000Uo-VW; Mon, 11 Nov 2024 18:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834095.1249622; Mon, 11 Nov 2024 18:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAYyG-0000SR-Si; Mon, 11 Nov 2024 18:17:04 +0000
Received: by outflank-mailman (input) for mailman id 834095;
 Mon, 11 Nov 2024 18:17:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dX8x=SG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tAYyE-0007n0-Px
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 18:17:02 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23e1687d-a059-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 19:16:58 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-53a007743e7so5717912e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 10:16:58 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53d826a9e5asm1652142e87.225.2024.11.11.10.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2024 10:16:57 -0800 (PST)
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
X-Inumbo-ID: 23e1687d-a059-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmMiLCJoZWxvIjoibWFpbC1sZjEteDEyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjIzZTE2ODdkLWEwNTktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzQ5MDE4Ljc2Njk0Mywic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731349018; x=1731953818; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gA7CVgc9PyiQqojqpTJ+sLU0fBsNohR7rU5rgE2PiCE=;
        b=TztTidPZM5FlR/wfx+mgj55O1Y+qtdFYUzsq+tBf8WvPSAkIH5aovzPgLtPqa1Qpha
         gkdax4xNsFCye+ghyKY3q/ZQeHgOR5p0je3J5+idsZb03iGi60GjkePdb1rvUH2Jd866
         xYVDaZ/YJJWllJSQjBGsEV1R2PzxwZOprSP6gWjojY835vDHnfgIlvDxKj5SlMcDup0j
         rGvgm1kMWjeFjUSyBVRieVkyZ9JcFMRAf45PvOgTi8RVcIEAtT1MV1YMOLPNRz9H9yca
         CpRpIrPntlivUoQGWMW3arfKTob7kxPKYR09/AiVYnNkiQp2otevgUKMkaXBjCsG+DrB
         SdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731349018; x=1731953818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gA7CVgc9PyiQqojqpTJ+sLU0fBsNohR7rU5rgE2PiCE=;
        b=epIQeiVbEFmKaol+AoYs5ww9227jr4BDdHHMjo2yn7lJZmSWg/2UcSQXxvXt2l5Vc4
         /ZrSULYFqniyRVkV8cWq25k6axOtKB/Ma4INvfr1ydQhoIUSCkDmLrn3qYW/9A41aGXK
         wfnpqeZeyBznf6h7JuBbrJxUzBnVDYWJrpMAOpzBwIkJTyeG0II9G66cAA0RVANSyN7v
         clS2C2nf4oAY+U78qQo4d6vc3N/h+zbgmJ0ur99dZKXzAWuqbE67fFI4iswLWamrQMGx
         9N8h5dqYXep5dhBdSdIMGzVRVM+fYLO78WgnDdmyKTFkASyFdYrzEpT/jTmdU5Bh31qe
         bRPA==
X-Gm-Message-State: AOJu0Yza87FH3+9Or2hJJdDa4enYa6lninayPwXyGURY9uyZGA20NwG7
	iTHabKHOaVgIAzlJHQ7f7+18ZK2EnaRfnWqEEVnHI+DJFVrSVE6F3SXBUQ==
X-Google-Smtp-Source: AGHT+IEJOOz+DTK6JeCXzCWvIC53nK8llhm1dwI8BHLIzt4merBfPOIi6sW+xlBLRaBNtiCENUIJeQ==
X-Received: by 2002:a05:6512:1107:b0:530:ae4a:58d0 with SMTP id 2adb3069b0e04-53d86228046mr6073637e87.8.1731349017647;
        Mon, 11 Nov 2024 10:16:57 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] drivers/char: rename arm-uart.c to uart-init.c
Date: Mon, 11 Nov 2024 19:16:55 +0100
Message-ID: <11b3d91cc7ff2435bca8cb0b841faaac54c3e796.1731345930.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the file containing uart_init() to enable reuse across other
architectures that utilize device trees or SPCR tables to locate UART
information.
After locating UART data, {acpi}_device_init() is called to initialize
the UART.

arm_uart_init() is renamed to uart_init() to be reused by other
architectures.

A new configuration option, CONFIG_UART_INIT, is introduced, currently
available only for Arm. Enabling CONFIG_UART_INIT on additional
architectures will require additional functionality, such as device tree
mapping and unflattening, etc.

The MAINTAINERS file is updated to alphabetically sort files in the
"ARM (W/ VIRTUALIZATION EXTENSIONS) ARCHITECTURE" section following
the renaming of arm-uart.c.

Add `select UART_INIT` for CONFIG_ARM to be sure that randconfig won't
disable UART_INIT.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
NOTE:
 I am not insisiting on having separate CONFIG_UART_INIT. If it would be fine
 just to have in xen/drivers/char/Makefile:
   obj-$(CONFIG_ARM) += uart-init.c 
   obj-$(CONFIG_RISCV) += uart-init.c

 I will be happy to send another one patch series version.
---
Changes in v2:
 - Rename arm-uart.c to uart-init.c instead of moving only dt_uart_init() to
   separate file.
 - Introduce new CONFIG_UART_INIT.
 - Rename arm_uart_init() to uart_init().
 - Add 'select UART_INIT' for CONFIG_ARM to be sure that randconfig won't
   disable UART_INIT.
 - Update the commit message.
---
 MAINTAINERS                  |   2 +-
 xen/arch/arm/Kconfig         |   1 +
 xen/arch/arm/setup.c         |   2 +-
 xen/drivers/char/Kconfig     |  11 +++
 xen/drivers/char/Makefile    |   2 +-
 xen/drivers/char/arm-uart.c  | 145 -----------------------------------
 xen/drivers/char/uart-init.c | 145 +++++++++++++++++++++++++++++++++++
 xen/include/xen/serial.h     |   2 +-
 8 files changed, 161 insertions(+), 149 deletions(-)
 delete mode 100644 xen/drivers/char/arm-uart.c
 create mode 100644 xen/drivers/char/uart-init.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 17fc5f9eec..a237080074 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -245,7 +245,6 @@ S:	Supported
 L:	xen-devel@lists.xenproject.org
 F:	docs/misc/arm/
 F:	xen/arch/arm/
-F:	xen/drivers/char/arm-uart.c
 F:	xen/drivers/char/cadence-uart.c
 F:	xen/drivers/char/exynos4210-uart.c
 F:	xen/drivers/char/imx-lpuart.c
@@ -254,6 +253,7 @@ F:	xen/drivers/char/mvebu-uart.c
 F:	xen/drivers/char/omap-uart.c
 F:	xen/drivers/char/pl011.c
 F:	xen/drivers/char/scif-uart.c
+F:	xen/drivers/char/uart-init.c
 F:	xen/drivers/passthrough/arm/
 F:	xen/include/public/arch-arm/
 F:	xen/include/public/arch-arm.h
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 15b2e4a227..e068497361 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -17,6 +17,7 @@ config ARM
 	select HAS_PASSTHROUGH
 	select HAS_UBSAN
 	select IOMMU_FORCE_PT_SHARE
+	select UART_INIT
 
 config ARCH_DEFCONFIG
 	string
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 71ebaa77ca..2e27af4560 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -361,7 +361,7 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
 
     gic_preinit();
 
-    arm_uart_init();
+    uart_init();
     console_init_preirq();
     console_init_ring();
 
diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index e175d07c02..343165feb4 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -93,6 +93,17 @@ config SERIAL_TX_BUFSIZE
 
 	  Default value is 32768 (32KiB).
 
+
+config UART_INIT
+	bool "UART initialization for DT and ACPI"
+	depends on ARM
+	default y
+	help
+	  Provides a generic method for locating UART device tree node when
+	  device tree is used, or for finding UART information in SPCR
+	  table when using ACPI. Once UART information is located,
+	  {acpi}_device_init() is called for UART-specific initialization.
+
 config XHCI
 	bool "XHCI DbC UART driver"
 	depends on X86
diff --git a/xen/drivers/char/Makefile b/xen/drivers/char/Makefile
index d3b987da1d..74dcde7e57 100644
--- a/xen/drivers/char/Makefile
+++ b/xen/drivers/char/Makefile
@@ -11,7 +11,7 @@ obj-$(CONFIG_HAS_EHCI) += ehci-dbgp.o
 obj-$(CONFIG_XHCI) += xhci-dbc.o
 obj-$(CONFIG_HAS_IMX_LPUART) += imx-lpuart.o
 obj-$(CONFIG_HAS_LINFLEX) += linflex-uart.o
-obj-$(CONFIG_ARM) += arm-uart.o
+obj-$(CONFIG_UART_INIT) += uart-init.o
 obj-y += serial.o
 obj-$(CONFIG_XEN_GUEST) += xen_pv_console.o
 obj-$(CONFIG_PV_SHIM) += consoled.o
diff --git a/xen/drivers/char/arm-uart.c b/xen/drivers/char/arm-uart.c
deleted file mode 100644
index 91f13a4136..0000000000
--- a/xen/drivers/char/arm-uart.c
+++ /dev/null
@@ -1,145 +0,0 @@
-/*
- * xen/drivers/char/arm-uart.c
- *
- * Generic uart retrieved via the device tree or ACPI
- *
- * Julien Grall <julien.grall@linaro.org>
- * Copyright (c) 2013 Linaro Limited.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
-
-#include <asm/device.h>
-
-#include <xen/console.h>
-#include <xen/device_tree.h>
-#include <xen/param.h>
-#include <xen/serial.h>
-#include <xen/errno.h>
-#include <xen/acpi.h>
-
-/*
- * Configure UART port with a string:
- * path:options
- *
- * @path: full path used in the device tree for the UART. If the path
- * doesn't start with '/', we assuming that it's an alias.
- * @options: UART speficic options (see in each UART driver)
- */
-static char __initdata opt_dtuart[256] = "";
-string_param("dtuart", opt_dtuart);
-
-static void __init dt_uart_init(void)
-{
-    struct dt_device_node *dev;
-    int ret;
-    const char *devpath = opt_dtuart;
-    const char *options;
-    char *split;
-
-    if ( !console_has("dtuart") )
-        return; /* Not for us */
-
-    if ( !strcmp(opt_dtuart, "") )
-    {
-        const struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
-
-        if ( chosen )
-        {
-            const char *stdout;
-
-            ret = dt_property_read_string(chosen, "stdout-path", &stdout);
-            if ( ret >= 0 )
-            {
-                printk("Taking dtuart configuration from /chosen/stdout-path\n");
-                if ( strlcpy(opt_dtuart, stdout, sizeof(opt_dtuart))
-                     >= sizeof(opt_dtuart) )
-                    printk("WARNING: /chosen/stdout-path too long, truncated\n");
-            }
-            else if ( ret != -EINVAL /* Not present */ )
-                printk("Failed to read /chosen/stdout-path (%d)\n", ret);
-        }
-    }
-
-    if ( !strcmp(opt_dtuart, "") )
-    {
-        printk("No dtuart path configured\n");
-        return;
-    }
-
-    split = strchr(opt_dtuart, ':');
-    if ( split )
-    {
-        split[0] = '\0';
-        options = split + 1;
-    }
-    else
-        options = "";
-
-    printk("Looking for dtuart at \"%s\", options \"%s\"\n", devpath, options);
-    if ( *devpath == '/' )
-        dev = dt_find_node_by_path(devpath);
-    else
-        dev = dt_find_node_by_alias(devpath);
-
-    if ( !dev )
-    {
-        printk("Unable to find device \"%s\"\n", devpath);
-        return;
-    }
-
-    ret = device_init(dev, DEVICE_SERIAL, options);
-
-    if ( ret )
-        printk("Unable to initialize dtuart: %d\n", ret);
-}
-
-#ifdef CONFIG_ACPI
-static void __init acpi_uart_init(void)
-{
-    struct acpi_table_spcr *spcr = NULL;
-    int ret;
-
-    acpi_get_table(ACPI_SIG_SPCR, 0, (struct acpi_table_header **)&spcr);
-
-    if ( spcr == NULL )
-    {
-        printk("Unable to get spcr table\n");
-    }
-    else
-    {
-        ret = acpi_device_init(DEVICE_SERIAL, NULL, spcr->interface_type);
-
-        if ( ret )
-            printk("Unable to initialize acpi uart: %d\n", ret);
-    }
-}
-#else
-static void __init acpi_uart_init(void) { }
-#endif
-
-void __init arm_uart_init(void)
-{
-    if ( acpi_disabled )
-        dt_uart_init();
-    else
-        acpi_uart_init();
-}
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/drivers/char/uart-init.c b/xen/drivers/char/uart-init.c
new file mode 100644
index 0000000000..7f3b385308
--- /dev/null
+++ b/xen/drivers/char/uart-init.c
@@ -0,0 +1,145 @@
+/*
+ * xen/drivers/char/arm-uart.c
+ *
+ * Generic uart retrieved via the device tree or ACPI
+ *
+ * Julien Grall <julien.grall@linaro.org>
+ * Copyright (c) 2013 Linaro Limited.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <asm/device.h>
+
+#include <xen/console.h>
+#include <xen/device_tree.h>
+#include <xen/param.h>
+#include <xen/serial.h>
+#include <xen/errno.h>
+#include <xen/acpi.h>
+
+/*
+ * Configure UART port with a string:
+ * path:options
+ *
+ * @path: full path used in the device tree for the UART. If the path
+ * doesn't start with '/', we assuming that it's an alias.
+ * @options: UART speficic options (see in each UART driver)
+ */
+static char __initdata opt_dtuart[256] = "";
+string_param("dtuart", opt_dtuart);
+
+static void __init dt_uart_init(void)
+{
+    struct dt_device_node *dev;
+    int ret;
+    const char *devpath = opt_dtuart;
+    const char *options;
+    char *split;
+
+    if ( !console_has("dtuart") )
+        return; /* Not for us */
+
+    if ( !strcmp(opt_dtuart, "") )
+    {
+        const struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
+
+        if ( chosen )
+        {
+            const char *stdout;
+
+            ret = dt_property_read_string(chosen, "stdout-path", &stdout);
+            if ( ret >= 0 )
+            {
+                printk("Taking dtuart configuration from /chosen/stdout-path\n");
+                if ( strlcpy(opt_dtuart, stdout, sizeof(opt_dtuart))
+                     >= sizeof(opt_dtuart) )
+                    printk("WARNING: /chosen/stdout-path too long, truncated\n");
+            }
+            else if ( ret != -EINVAL /* Not present */ )
+                printk("Failed to read /chosen/stdout-path (%d)\n", ret);
+        }
+    }
+
+    if ( !strcmp(opt_dtuart, "") )
+    {
+        printk("No dtuart path configured\n");
+        return;
+    }
+
+    split = strchr(opt_dtuart, ':');
+    if ( split )
+    {
+        split[0] = '\0';
+        options = split + 1;
+    }
+    else
+        options = "";
+
+    printk("Looking for dtuart at \"%s\", options \"%s\"\n", devpath, options);
+    if ( *devpath == '/' )
+        dev = dt_find_node_by_path(devpath);
+    else
+        dev = dt_find_node_by_alias(devpath);
+
+    if ( !dev )
+    {
+        printk("Unable to find device \"%s\"\n", devpath);
+        return;
+    }
+
+    ret = device_init(dev, DEVICE_SERIAL, options);
+
+    if ( ret )
+        printk("Unable to initialize dtuart: %d\n", ret);
+}
+
+#ifdef CONFIG_ACPI
+static void __init acpi_uart_init(void)
+{
+    struct acpi_table_spcr *spcr = NULL;
+    int ret;
+
+    acpi_get_table(ACPI_SIG_SPCR, 0, (struct acpi_table_header **)&spcr);
+
+    if ( spcr == NULL )
+    {
+        printk("Unable to get spcr table\n");
+    }
+    else
+    {
+        ret = acpi_device_init(DEVICE_SERIAL, NULL, spcr->interface_type);
+
+        if ( ret )
+            printk("Unable to initialize acpi uart: %d\n", ret);
+    }
+}
+#else
+static void __init acpi_uart_init(void) { }
+#endif
+
+void __init uart_init(void)
+{
+    if ( acpi_disabled )
+        dt_uart_init();
+    else
+        acpi_uart_init();
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
index 3d21207a3d..63a82b032d 100644
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -166,7 +166,7 @@ void xhci_dbc_uart_init(void);
 static void inline xhci_dbc_uart_init(void) {}
 #endif
 
-void arm_uart_init(void);
+void uart_init(void);
 
 struct physdev_dbgp_op;
 int dbgp_op(const struct physdev_dbgp_op *op);
-- 
2.47.0


