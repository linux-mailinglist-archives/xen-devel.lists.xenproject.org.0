Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0989CDEB9
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 13:55:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837531.1253468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBvqd-00012H-E8; Fri, 15 Nov 2024 12:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837531.1253468; Fri, 15 Nov 2024 12:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBvqd-0000zv-B1; Fri, 15 Nov 2024 12:54:51 +0000
Received: by outflank-mailman (input) for mailman id 837531;
 Fri, 15 Nov 2024 12:54:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TwMO=SK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tBvkS-0004n9-8H
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 12:48:28 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7567e61-a34f-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 13:48:25 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a9f1c590ecdso121007966b.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 04:48:25 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0869b2sm175643066b.193.2024.11.15.04.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 04:48:23 -0800 (PST)
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
X-Inumbo-ID: e7567e61-a34f-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzIiLCJoZWxvIjoibWFpbC1lajEteDYzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImU3NTY3ZTYxLWEzNGYtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjc0OTA1LjI0MTA2Miwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731674904; x=1732279704; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K2GGhd2OFWQt4+w4+T+/58jogJx8wVa2XuhW00Pc8Bo=;
        b=labNonES72xujfkG6sRSNI23kS9r37f3DKf+0SoA2oY/t3ehZob4wAgY9goAoG3eU+
         Bc0HMZPbZLh/TeGm4LAhzQxMWi2tnkmSaZQ6mJZpxBC6V6c3DLDRMKI/ezniO7SDu1fi
         4/9dP8VcaHPGjFCVGNevWjgzU5vMp1wtPDCeE8mXmDFxGoysb4PhSQxy0yTr/7suFAcf
         oCv/fi0yTlFAIgFouhC/vkkY4630wUyK7hysYDIW+H0IU+UNJvRTWE8mavSh/W875sgQ
         XyLR0um3iW1JqEw2Ufp6B/r3bDJTNQfM8kGZB6M56/CITlHhTdGIyvSgksTScWSFoS/5
         zRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731674904; x=1732279704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K2GGhd2OFWQt4+w4+T+/58jogJx8wVa2XuhW00Pc8Bo=;
        b=nXjv7sr8z8f6f8poX8PkwMocfHrMGiJ8mS1mBu08gyO6Q4CVcMVyME9kcsGIbE5oAo
         S2NdAV8Nk5lUhceqvv2IH5vj9z6iWha7tU+OkRUD0NCab9jKhH3mwegTlxuTdtxO6xo/
         5Si7snCOawS2FKo6wHJeTzMpsnGX8kHicwRoOlGqeJnp2mNXwEV8NFZ0FJZng4MCwXXw
         JM0/NOQAJ1igWOvj7J2gD+/AfZyFeqMPGhzVZXEUB67DA1DMFosxktfgPFkWz2oimyo2
         BU0EFGPhMMa0dUeOX6vo4LmlhXXPAQf9ObvS2ogcsBji6ODytakyRazyzDoz4YIO4IJY
         rYYw==
X-Gm-Message-State: AOJu0Yxqos+kB+RPXwdQxBbhmRIOV8i2LOUe5X33iW81fYFegzMVun6M
	Z+PViRGkznS0So13khX0lUBvTQgUS4ZdVe4YuZtm0xoqk1bDIFOmIHB5uw==
X-Google-Smtp-Source: AGHT+IHMOx8I/KQkX8Axf4N8KW22soTojk1zS8opLSv4wEq2EXSDtfclZJZrO2k0Yx3gEyZS/hPfRQ==
X-Received: by 2002:a17:907:d29:b0:a99:fb56:39cc with SMTP id a640c23a62f3a-aa48350996emr190429966b.38.1731674904000;
        Fri, 15 Nov 2024 04:48:24 -0800 (PST)
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
Subject: [PATCH v3] drivers/char: rename arm-uart.c to uart-init.c
Date: Fri, 15 Nov 2024 13:48:20 +0100
Message-ID: <b2eed7fed17c9e9a3a9414e6d97360a7deeb2acb.1731671392.git.oleksii.kurochko@gmail.com>
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
Changes in V3:
 - Drop blank line in xen/drivers/char/Kconfig.
 - Rebase on top of the latest staging.
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
 xen/drivers/char/Kconfig     |  10 +++
 xen/drivers/char/Makefile    |   2 +-
 xen/drivers/char/arm-uart.c  | 145 -----------------------------------
 xen/drivers/char/uart-init.c | 145 +++++++++++++++++++++++++++++++++++
 xen/include/xen/serial.h     |   2 +-
 8 files changed, 160 insertions(+), 149 deletions(-)
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
index e175d07c02..49a06a7859 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -93,6 +93,16 @@ config SERIAL_TX_BUFSIZE
 
 	  Default value is 32768 (32KiB).
 
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


