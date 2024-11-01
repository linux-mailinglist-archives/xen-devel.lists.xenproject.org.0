Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 472219B9163
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2024 13:55:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829084.1244156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6rBN-0003tm-Hl; Fri, 01 Nov 2024 12:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829084.1244156; Fri, 01 Nov 2024 12:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6rBN-0003s6-F4; Fri, 01 Nov 2024 12:55:17 +0000
Received: by outflank-mailman (input) for mailman id 829084;
 Fri, 01 Nov 2024 12:55:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1ZeD=R4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t6rBL-0003s0-Ak
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2024 12:55:15 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87fb179b-9850-11ef-a0c5-8be0dac302b0;
 Fri, 01 Nov 2024 13:55:11 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53b34ed38easo1869311e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 01 Nov 2024 05:55:11 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bdcc305sm548664e87.227.2024.11.01.05.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 05:55:09 -0700 (PDT)
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
X-Inumbo-ID: 87fb179b-9850-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmIiLCJoZWxvIjoibWFpbC1sZjEteDEyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijg3ZmIxNzliLTk4NTAtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNDY1NzExLjg2NDAxMiwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730465711; x=1731070511; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hCWGgZp5QdiE9RYwzoLYqxAHUh5bRQe2YL0LSwj2aNo=;
        b=jor2xzSIW8VX9/ghZxvzZYUvCJImrAysbGl+OSaRFiFDE5ezzt1ZONyncqOIxc87Q9
         4HBrsZN9p3pBNbesol/8GdzhkCVX0hhk7IJakk2rx7DRq0Yfs0xJ0gQ5b97Ewam+mqUX
         nwQW+uw2RSEeEP/zCBjx4+d/ZCQk3PA1+EPz7LBBsemW7h9bD0/ssvFbF3778BFKVbxk
         ni4GCG7fvDDJZKRGfkQPwUzq1EQ8ehx2XgMM0NrL34lURNFjYaQpDLHgm09/O/skqr+f
         mQY+/ANZEwln/eN4OwcF2/ExmSUoLmNNOaYz9jPlDH3Q8uq/2TqIbNlUhNCCU/cONDpB
         ydsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730465711; x=1731070511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCWGgZp5QdiE9RYwzoLYqxAHUh5bRQe2YL0LSwj2aNo=;
        b=JSwMC9jPWgO5qsxCTTnFCDgJefegdYvQUN2+6T1toTAaLbJiJUYuKKVw8AWeWYf2wS
         HvP1Fu6B4VvEH38mX4ocaY1BlXEh3gXskhUUnl/NShE6J0RpbBjbhHUtJPWVILdpuwrI
         zjpfhykW8khANLdoXLTH+CIU9Qocy3IGbindPO6W2yUJW94uGoQD47CiN0q4e6PTbrRD
         45I12TV1dc0dzdvFPeUS4C5Q3pYv3LWBU+40n7LzndOtI5ltVhiXdqSiBUGuSwg+9eBF
         x8PMy4xmYcVJyzqSGU+GLxeAq/whH1X0B9exYXCyyK3HNhNJce8GzqYJtGaqgt7UvIM3
         OeeQ==
X-Gm-Message-State: AOJu0YxtYnvNn/lovLVVWK4HvWEU/p/+cVryOONfJEwJaYpAsYv+rZ92
	UE+hTQm684UezVWPZcCFynFBz3QZAAu/9xGckB42QfLC2ysAuVPPXpRtmQ==
X-Google-Smtp-Source: AGHT+IFJooEwX/gurLTtzbytSGsYL+jRUHDmaWeCGU6cJkbm3U03B2BG23JpM++didU+aqk4H5K8sA==
X-Received: by 2002:a05:6512:1255:b0:539:dca9:19a2 with SMTP id 2adb3069b0e04-53b3491c152mr10884832e87.39.1730465709822;
        Fri, 01 Nov 2024 05:55:09 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] xen/common: Move gic_dt_preinit() to common code
Date: Fri,  1 Nov 2024 13:55:07 +0100
Message-ID: <0fa60e73eccb620ad37037e2128deea7a97f726b.1730457699.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce intc_dt_preinit() in the common codebase, as it is not
architecture-specific and can be reused by both PPC and RISC-V.
This function identifies the node with the interrupt-controller property
in the device tree and calls device_init() to handle architecture-specific
initialization of the interrupt controller.

Make minor adjustments compared to the original ARM implementation of
gic_dt_preinit():
 - Remove the local rc variable in gic_dt_preinit() since it is only used once.
 - Change the prefix from gic to intc to clarify that the function is not
   specific to ARM’s GIC, making it suitable for other architectures as well.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - s/ic/intc.
 - Update the commit message.
 - Move intc_dt_preinit() to common/device-tree/intc.c.
 - Add declaration of intc_dt_preinit() in xen/device_tree.h.
 - Revert intc_preinit()-related changes and just back gic_preinit() in
   Arm's gic.c.
 - Revert ACPI-related changes.
---
Changes in v2:
 - Revert changes connected to moving of gic_acpi_preinit() to common code as
   it isn't really architecture indepent part.
 - Update the commit message.
 - Move stub of ic_acpi_preinit() to <asm-generic/device.h> for the case when
   CONFIG_ACPI=n.
---
 xen/arch/arm/gic.c              | 32 +------------------------------
 xen/common/device-tree/Makefile |  1 +
 xen/common/device-tree/intc.c   | 34 +++++++++++++++++++++++++++++++++
 xen/include/xen/device_tree.h   |  6 ++++++
 4 files changed, 42 insertions(+), 31 deletions(-)
 create mode 100644 xen/common/device-tree/intc.c

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 3eaf670fd7..acf61a4de3 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -214,36 +214,6 @@ int gic_map_hwdom_extra_mappings(struct domain *d)
     return 0;
 }
 
-static void __init gic_dt_preinit(void)
-{
-    int rc;
-    struct dt_device_node *node;
-    uint8_t num_gics = 0;
-
-    dt_for_each_device_node( dt_host, node )
-    {
-        if ( !dt_get_property(node, "interrupt-controller", NULL) )
-            continue;
-
-        if ( !dt_get_parent(node) )
-            continue;
-
-        rc = device_init(node, DEVICE_INTERRUPT_CONTROLLER, NULL);
-        if ( !rc )
-        {
-            /* NOTE: Only one GIC is supported */
-            num_gics = 1;
-            break;
-        }
-    }
-    if ( !num_gics )
-        panic("Unable to find compatible GIC in the device tree\n");
-
-    /* Set the GIC as the primary interrupt controller */
-    dt_interrupt_controller = node;
-    dt_device_set_used_by(node, DOMID_XEN);
-}
-
 #ifdef CONFIG_ACPI
 static void __init gic_acpi_preinit(void)
 {
@@ -269,7 +239,7 @@ static void __init gic_acpi_preinit(void) { }
 void __init gic_preinit(void)
 {
     if ( acpi_disabled )
-        gic_dt_preinit();
+        intc_dt_preinit();
     else
         gic_acpi_preinit();
 }
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 58052d074e..7c549be38a 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -2,3 +2,4 @@ obj-y += bootfdt.init.o
 obj-y += bootinfo.init.o
 obj-y += device-tree.o
 obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
+obj-y += intc.o
diff --git a/xen/common/device-tree/intc.c b/xen/common/device-tree/intc.c
new file mode 100644
index 0000000000..e726daeb26
--- /dev/null
+++ b/xen/common/device-tree/intc.c
@@ -0,0 +1,34 @@
+
+#include <xen/device_tree.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+
+void __init intc_dt_preinit(void)
+{
+    struct dt_device_node *node;
+    uint8_t num_gics = 0;
+
+    dt_for_each_device_node( dt_host, node )
+    {
+        if ( !dt_get_property(node, "interrupt-controller", NULL) )
+            continue;
+
+        if ( !dt_get_parent(node) )
+            continue;
+
+        if ( !device_init(node, DEVICE_INTERRUPT_CONTROLLER, NULL) )
+        {
+            /* NOTE: Only one GIC is supported */
+            num_gics = 1;
+            break;
+        }
+    }
+
+    if ( !num_gics )
+        panic("Unable to find compatible interrupt contoller"
+              "in the device tree\n");
+
+    /* Set the interrupt controller as the primary interrupt controller */
+    dt_interrupt_controller = node;
+    dt_device_set_used_by(node, DOMID_XEN);
+}
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index e6287305a7..33d70b9594 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -238,6 +238,12 @@ extern rwlock_t dt_host_lock;
 struct dt_device_node *
 dt_find_interrupt_controller(const struct dt_device_match *matches);
 
+#ifdef CONFIG_HAS_DEVICE_TREE
+void intc_dt_preinit(void);
+#else
+static inline void intc_dt_preinit(void) { }
+#endif
+
 #define dt_prop_cmp(s1, s2) strcmp((s1), (s2))
 #define dt_node_cmp(s1, s2) strcasecmp((s1), (s2))
 #define dt_compat_cmp(s1, s2) strcasecmp((s1), (s2))
-- 
2.47.0


