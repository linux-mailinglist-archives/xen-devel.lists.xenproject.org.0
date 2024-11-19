Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BF19D28AE
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 15:56:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840330.1256095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDPdp-00047t-5Y; Tue, 19 Nov 2024 14:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840330.1256095; Tue, 19 Nov 2024 14:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDPdp-00046Q-30; Tue, 19 Nov 2024 14:55:45 +0000
Received: by outflank-mailman (input) for mailman id 840330;
 Tue, 19 Nov 2024 14:55:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i5yv=SO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tDPdn-00046K-2K
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 14:55:43 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 579c0080-a686-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 15:55:39 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-53da3b911b9so5056873e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 06:55:39 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff69959a19sm12079481fa.50.2024.11.19.06.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 06:55:38 -0800 (PST)
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
X-Inumbo-ID: 579c0080-a686-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMjkiLCJoZWxvIjoibWFpbC1sZjEteDEyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjU3OWMwMDgwLWE2ODYtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDI4MTM5LjgyMjE4NCwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732028139; x=1732632939; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TGutgDHVAggsVLyXv1WdSAjed2SlV2/TD2qDemO8/9Y=;
        b=ksWYUfceUjW+GI5rIN7wOaRt4y5UJm8Aw9r21gO2XQnPbvrZ3kVOIIjbVBeWXnUd93
         oBk8kQoicWKu7m8R4EFfAedN528tXg0CnNQ8oHRZEYRYzyD5O5J3y8IKCnSwTbNLwdOI
         PSyFs0H1jO5OuZ6ZmVK2tjJrL2z37jOzMVVB110h6ZRUE75bk3nL+WjrvlU2GccHhHUX
         T0m02qNM5ZKaSobZenE1ziTXsnQqsWEQvGQQKcHdD2HcAdhFpGZ82gMJJ4ASROUuBnPF
         DvBEjOUJFq0sskS3uusiOmF7JaZo7U881jnwvxFWA0SzsuRvj4dxpWWNAPyyaEVigHMZ
         lCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732028139; x=1732632939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGutgDHVAggsVLyXv1WdSAjed2SlV2/TD2qDemO8/9Y=;
        b=GZwUMZF3OgQMQ/Z+XlIQ7VdgXzpSFooRPiw8f2btJYyDBa9XytzNsCV4aFmkYz0R1p
         NVEKJsr7ICPevAGpMFv4qc4Cs2nGyG9/q3bvUTKJlvC/OwoCx/95WvpBSypqCiNtQtOa
         9FVFzrFKk5Hs5w4aotnfVkqjBzKulPn+6jxBQ8u4JCDUI14ChWe6+q3q6TqG5LNu+SQ/
         Gxxwi3kCklKxSWtcaPloBn5MabxCh8RHXD5uPRjeDubKUH9ANFWco2kNI6KX8/zvj6/1
         QTz0vQUdP9sb7D17CY2OkTHYKfyUPVZGWzKp/6uAxloYse9v3RvWJ2af6ehIBPoZ42j+
         XPVQ==
X-Gm-Message-State: AOJu0YyGIohYEA93t2bB2gtW7F+aMMawUBRqVu3DL8tF8FeRrzicQuK2
	VxFyMAkfd/SSgpkADzJ8B1ENh7LnERZq4rGSghYT0lzUogypwDD2oe1DnQ==
X-Google-Smtp-Source: AGHT+IHKw1FWRLMKK+auX+aPwJo1Ot7LtSKQ4HftfwDtM/GU5haMroVnfEZgO0/ID0xjSQoMVQXLxQ==
X-Received: by 2002:a2e:be89:0:b0:2fb:8de8:7f9e with SMTP id 38308e7fff4ca-2ff6064de25mr72801141fa.1.1732028138664;
        Tue, 19 Nov 2024 06:55:38 -0800 (PST)
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
Subject: [PATCH v4] drivers/char: rename arm-uart.c to uart-init.c
Date: Tue, 19 Nov 2024 15:55:32 +0100
Message-ID: <f168e76eacc2fd2e6da559a38c33e187da515614.1732027276.git.oleksii.kurochko@gmail.com>
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

A new configuration option, CONFIG_GENERIC_UART_INIT, is introduced,
currently available only for Arm. Enabling CONFIG_UART_INIT on additional
architectures will require additional functionality, such as device tree
mapping and unflattening, etc.

arm-uart.c is removed from "ARM (W/ VIRTUALIZATION EXTENSIONS) ARCHITECTURE"
section in the MAINTAINERS file, as it is no longer Arm-specific and can
now be maintained by maintainers of other architectures.

Use GENERIC_UART_INIT for CONFIG_ARM by adding `select GENERIC_UART_INIT`
to CONFIG_ARM.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - Rename UART_INIT config to GENERIC_UART_INIT.
 - Update defintion of GENERIC_UART_INIT config in char/Kconfig:
   drop prompt, help and `depends on` as CONFIG_GENERIC_UART_INIT isn't expected
   to be disabled/enabled by user thereby make GENERIC_UART_INIT config invisible.
 - Add SPDX tag and update the comment in uart-init.c.
 - Update the commit message.
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
 MAINTAINERS                  |   1 -
 xen/arch/arm/Kconfig         |   1 +
 xen/arch/arm/setup.c         |   2 +-
 xen/drivers/char/Kconfig     |   3 +
 xen/drivers/char/Makefile    |   2 +-
 xen/drivers/char/arm-uart.c  | 145 -----------------------------------
 xen/drivers/char/uart-init.c | 138 +++++++++++++++++++++++++++++++++
 xen/include/xen/serial.h     |   2 +-
 8 files changed, 145 insertions(+), 149 deletions(-)
 delete mode 100644 xen/drivers/char/arm-uart.c
 create mode 100644 xen/drivers/char/uart-init.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 17fc5f9eec..026aa25a53 100644
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
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 15b2e4a227..23bbc91aad 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -12,6 +12,7 @@ config ARM_64
 config ARM
 	def_bool y
 	select FUNCTION_ALIGNMENT_4B
+	select GENERIC_UART_INIT
 	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE
 	select HAS_PASSTHROUGH
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
index e175d07c02..e6e12bb413 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -1,3 +1,6 @@
+config GENERIC_UART_INIT
+	bool
+
 config HAS_NS16550
 	bool "NS16550 UART driver" if ARM
 	default n if RISCV
diff --git a/xen/drivers/char/Makefile b/xen/drivers/char/Makefile
index d3b987da1d..8cbbffdca8 100644
--- a/xen/drivers/char/Makefile
+++ b/xen/drivers/char/Makefile
@@ -11,7 +11,7 @@ obj-$(CONFIG_HAS_EHCI) += ehci-dbgp.o
 obj-$(CONFIG_XHCI) += xhci-dbc.o
 obj-$(CONFIG_HAS_IMX_LPUART) += imx-lpuart.o
 obj-$(CONFIG_HAS_LINFLEX) += linflex-uart.o
-obj-$(CONFIG_ARM) += arm-uart.o
+obj-$(CONFIG_GENERIC_UART_INIT) += uart-init.o
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
index 0000000000..a218139938
--- /dev/null
+++ b/xen/drivers/char/uart-init.c
@@ -0,0 +1,138 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/*
+ * Derived from:
+ * xen/drivers/char/arm-uart.c
+ *
+ * Generic uart retrieved via the device tree or ACPI
+ *
+ * Julien Grall <julien.grall@linaro.org>
+ * Copyright (c) 2013 Linaro Limited.
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


