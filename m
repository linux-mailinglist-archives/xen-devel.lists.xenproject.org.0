Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E81C79D6144
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 16:20:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841944.1257416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEVRi-0007ce-JK; Fri, 22 Nov 2024 15:19:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841944.1257416; Fri, 22 Nov 2024 15:19:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEVRi-0007aF-Fw; Fri, 22 Nov 2024 15:19:46 +0000
Received: by outflank-mailman (input) for mailman id 841944;
 Fri, 22 Nov 2024 15:19:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvYz=SR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tEVRg-0007a9-Bm
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2024 15:19:44 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30599a52-a8e5-11ef-a0cc-8be0dac302b0;
 Fri, 22 Nov 2024 16:19:38 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2fb5111747cso26806091fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Nov 2024 07:19:38 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b52fe94sm110268766b.96.2024.11.22.07.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 07:19:36 -0800 (PST)
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
X-Inumbo-ID: 30599a52-a8e5-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzIiLCJoZWxvIjoibWFpbC1sajEteDIzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjMwNTk5YTUyLWE4ZTUtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMjg4Nzc4LjUxMjgyMywic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732288778; x=1732893578; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nuM013zxcMBhaTjQpIKcYjopYLoD/j3oW8CjHL2l0N8=;
        b=Livl4zuF7O0waKy7XHUqJkzbXXOriX+keoLPEntKehvSgMmy8JjLVVLDiXf8VrzcRe
         7gPlKYw7ynri4wA+rlynT99BBY6H8FNkpSXX/1Xkjr2xgFmMbCzste3iYqcaVA6nZ7oz
         1/ImefnE/wRCuiedF1s6+s3I0vLcO5Cz0NgjHnCFEy8eTFS34aRFYZhsnxF/4Izdwssx
         nWDwHcdZvInB6iqe/qNoLchH/j2bGYhBd4zpzFFbvItVFnLnFp4EJ/9nqhMiFqAwH7Wg
         79V0ACeHgZO57o5A+PxPQL8qgY9QAt1vpOTXAKWIRNGsC65hKVGxyy/rhJUkjHNf3KLf
         Y64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732288778; x=1732893578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nuM013zxcMBhaTjQpIKcYjopYLoD/j3oW8CjHL2l0N8=;
        b=qeL+afZd9ogIKW4C8UwUezDt+d04KAAhWPlGGckEd4CSztqKVsAK9YMKXOJxV7+QV4
         3OqKYP1pkvTznIZCH8n2AGVnbc0lEqZT1y7QIUgpt/g0u5hUAjuxnezx+TQQdn8cAGz+
         3FBX/2bhnDIXsg7ucEaJIzMyYEEumtIObS7+urvTkSP6Yu/YDetq3HR9U20O2JP6ZSnF
         ul6vcKPadMG2mmv10vbqcCfZuQ1+1XoNIxAxzjf9LWcwBADCLbbq5FlavZlVHO2grMab
         aFxEexhY022HlnJD3AJuwqhgYwz32QNHCrx0dt02x5+XeCOg8onvoyaqLvsrhDSlCXpq
         uiSg==
X-Gm-Message-State: AOJu0YxDueNnMoHqLjwQopCXxE3/2JdoTI0aLeOk5BRsgL42JWlO0Ma5
	kNIG3bfpAiVAiTIjpoDApmUTffu+3/XxqPI4A2loLWeEpyCcK/NTouR7AA==
X-Gm-Gg: ASbGncvO1/gTMAhLBFcyfbRn7z1gvu8gEAd9EqoG1ATe8/i+tpFAiA6gz4ZxgGu+wHj
	fE0KEks3EQJ3BRKdQQBZF+BjxjBMkUgPkUvaAvLsynwvVJNkJqNKmLkPkGvxB05y7qMZlhfQWuU
	xD97Zue0jLyo6ePH4zA/YNaXRTBkZx3FzkotZO/oqjmvkfSCO0eWYiJ+++QIvCQylIrMCZ2XZyU
	P6x0lW7qnUKrGkGDEDQz4vmsUsnY7eIHr5JozgBs6h97ccMAVA=
X-Google-Smtp-Source: AGHT+IHJUYEGAhWPSkkJT6y3hsJZ0p+KvGum3Vld0p0jzMZ973GaXmq03iaVKM0OJAsyarysJC7dlA==
X-Received: by 2002:a2e:be8b:0:b0:2fb:6465:3198 with SMTP id 38308e7fff4ca-2ffa70f6acfmr18106261fa.5.1732288777319;
        Fri, 22 Nov 2024 07:19:37 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5] xen/common: Move gic_dt_preinit() to common code
Date: Fri, 22 Nov 2024 16:19:34 +0100
Message-ID: <151ac176ff02d2ff9b7f87e3c02b9ce0472720fa.1732288620.git.oleksii.kurochko@gmail.com>
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
Changes in V5:
 - Fix a typo in panic()'s message: s/contoller/controller/
 - Remove splitting of panic() message.
 - Add EMACS block at the end of intc.c.
 - Drop stub and guards around declaration of intc_dt_preinit() in
   xen/device_tree.h.
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
 xen/arch/arm/gic.c              | 32 +-----------------------
 xen/common/device-tree/Makefile |  1 +
 xen/common/device-tree/intc.c   | 43 +++++++++++++++++++++++++++++++++
 xen/include/xen/device_tree.h   |  2 ++
 4 files changed, 47 insertions(+), 31 deletions(-)
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
index 0000000000..b09fbf6a49
--- /dev/null
+++ b/xen/common/device-tree/intc.c
@@ -0,0 +1,43 @@
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
+        panic("Unable to find compatible interrupt controller in the device tree\n");
+
+    /* Set the interrupt controller as the primary interrupt controller */
+    dt_interrupt_controller = node;
+    dt_device_set_used_by(node, DOMID_XEN);
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index e6287305a7..5ff763bb80 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -238,6 +238,8 @@ extern rwlock_t dt_host_lock;
 struct dt_device_node *
 dt_find_interrupt_controller(const struct dt_device_match *matches);
 
+void intc_dt_preinit(void);
+
 #define dt_prop_cmp(s1, s2) strcmp((s1), (s2))
 #define dt_node_cmp(s1, s2) strcasecmp((s1), (s2))
 #define dt_compat_cmp(s1, s2) strcasecmp((s1), (s2))
-- 
2.47.0


