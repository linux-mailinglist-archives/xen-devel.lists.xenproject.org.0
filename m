Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C809D28B3
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 15:57:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840337.1256105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDPew-0004eQ-FR; Tue, 19 Nov 2024 14:56:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840337.1256105; Tue, 19 Nov 2024 14:56:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDPew-0004bv-CX; Tue, 19 Nov 2024 14:56:54 +0000
Received: by outflank-mailman (input) for mailman id 840337;
 Tue, 19 Nov 2024 14:56:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i5yv=SO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tDPeu-0004bm-Sn
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 14:56:52 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8169e222-a686-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 15:56:49 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ff5d2b8f0eso40483341fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 06:56:49 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff6985119csm11897141fa.8.2024.11.19.06.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 06:56:48 -0800 (PST)
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
X-Inumbo-ID: 8169e222-a686-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMmUiLCJoZWxvIjoibWFpbC1sajEteDIyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjgxNjllMjIyLWE2ODYtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDI4MjA5Ljk2MDMxMywic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732028209; x=1732633009; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z6Ug0ZbHZNV2xFrmo7L+ZSB8sgvSeVlh42Jguj5Nn9A=;
        b=T95jOYT7Qf4XV6qKFgkMkw4Jc6Eth84OcTNpmp5GLbGY/vGshd14fK9CpX46M1W1H7
         C7ksOQson/b04NEcQ2ncIOm9vu8TRjF9cbsBeRLslsDtVJ1huqPtKnLRpNJk7t4c76fg
         HJJC7zxT2n709C2S6sD40j4AqSor4hrW8MODfz3hQU46537poScLbHq8Vta7EbEMiEr6
         KkDbq5wmIyZo/AU6y4iDTyR83sQrQcvtzNvz4wW9yGTlq2AMU26+PYNrGATN1DR91UmQ
         4FFEu5RQEx9oUsvSJVtOFlsi6Q8u1C4J7VcVh1kqwIHFL5qXqfmekVurLxKpzKOem4Y8
         Payg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732028209; x=1732633009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z6Ug0ZbHZNV2xFrmo7L+ZSB8sgvSeVlh42Jguj5Nn9A=;
        b=oR2LZAxcyyF4fjjxMY6ls8DB2kN2Cg87kValNvrL7UsRHqNUmHnBJxTieoUE8LePMD
         exwlpPLIIl3uo0osywBngrZKduVmkvkNuCO7cqVRuRb+QR+KV8I4I+A6LgdqMmtRlJCq
         MGQqG1YD4g4UMjTM/tiPY7yixLk1pKewAJWWUPK9adHJ06vJIPzHJVdixnLmgNdCilZx
         CsGIH+zNvMCwSS8yLsOxbl3cOKfuhYf+HBsVTNSwVFYj6xP7t1qWd/AsAvM+XIcnPMAO
         cgORVi2iIc2TxHD+NF9lLHEbop0XRW1rN//t6ZqDJqTx1wHX1obXMlL0STvkN+AC5WdA
         SIPw==
X-Gm-Message-State: AOJu0YxQOelCcOsBkBXFS87DAfbG/7imxVp6v0pZ5Dr49GgrdX4iCoPA
	b73Uwwd3CA9CbxSlWu45L6TDERVbJHqRkarL31d2Uyf9apTTZ0OK2CwA7A==
X-Google-Smtp-Source: AGHT+IHSyVLJekL0XVTgtj8MqleA3AseEnHlI0eVCxgbK+8L7MaAEQDi8nutjOCuRTS1tDkC/zw/Qw==
X-Received: by 2002:a05:651c:12cb:b0:2fa:c0fc:e3d8 with SMTP id 38308e7fff4ca-2ff606fd9bfmr76109241fa.38.1732028208937;
        Tue, 19 Nov 2024 06:56:48 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4] xen/common: Move gic_dt_preinit() to common code
Date: Tue, 19 Nov 2024 15:56:46 +0100
Message-ID: <54d0ff689e167b3f3137afea45307f762ce0a974.1732027385.git.oleksii.kurochko@gmail.com>
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
Changes in v4:
 - Add SPDX tag in intc.c
 - s/num_gics/num_intc
 - Update the comment: s/GIC/interrupt controller.
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
 xen/arch/arm/gic.c              | 32 +-----------------------------
 xen/common/device-tree/Makefile |  1 +
 xen/common/device-tree/intc.c   | 35 +++++++++++++++++++++++++++++++++
 xen/include/xen/device_tree.h   |  6 ++++++
 4 files changed, 43 insertions(+), 31 deletions(-)
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
index 0000000000..d2bcbc2d5e
--- /dev/null
+++ b/xen/common/device-tree/intc.c
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/device_tree.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+
+void __init intc_dt_preinit(void)
+{
+    struct dt_device_node *node;
+    uint8_t num_intc = 0;
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
+            /* NOTE: Only one interrupt controller is supported */
+            num_intc = 1;
+            break;
+        }
+    }
+
+    if ( !num_intc )
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


