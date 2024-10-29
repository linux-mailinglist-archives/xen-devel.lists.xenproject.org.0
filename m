Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 875EE9B4FBA
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 17:48:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827726.1242419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5pNo-0003it-DM; Tue, 29 Oct 2024 16:47:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827726.1242419; Tue, 29 Oct 2024 16:47:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5pNo-0003gf-AJ; Tue, 29 Oct 2024 16:47:52 +0000
Received: by outflank-mailman (input) for mailman id 827726;
 Tue, 29 Oct 2024 16:47:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/ws=RZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t5pNm-0003fi-67
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 16:47:50 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 864b5b44-9615-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 17:47:46 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a9a0ec0a94fso788637466b.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 09:47:46 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1e0b2356sm488340466b.30.2024.10.29.09.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 09:47:44 -0700 (PDT)
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
X-Inumbo-ID: 864b5b44-9615-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmYiLCJoZWxvIjoibWFpbC1lajEteDYyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijg2NGI1YjQ0LTk2MTUtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjIwNDY2LjU3MjcyNSwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730220466; x=1730825266; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2y4qvQ5WrMUCS2XvWiD5MyBVG2WMwuZ3/t2R/u7r1Qk=;
        b=Dp6FFnG1osaNCEMKJJDpAAFavsVzEunRqSWgVcAO65MICxtWud1Fiaim9mkXU4KyqH
         ZOgH4DOOZ3RHjY/iT8lVmH6fmkYIsYx9gQR8w06EhjTQnAHvHHuVxHKYdYGS+NnHq5Tt
         D3ulLfx64FOELsLAC3IKPlSOc05w0JTpJrBfyhv3wZC49JykZ7ZLGqaYvrFtuqnW30Bq
         8egG9bPJuuknasyIanvtyNoGN4NzoeqfFoYEDGqyPnmIN/sIv6/e8dTpbwO/5df0vonL
         jTEwTKOJBZbKYMGpE0hF5jojgqii8Rv7E51GWST5pElnULxlxeV6mxLhnhPhvNINXNgR
         E/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730220466; x=1730825266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2y4qvQ5WrMUCS2XvWiD5MyBVG2WMwuZ3/t2R/u7r1Qk=;
        b=TjHW3jTU+c8Er4OM0norJ7HTlwmUg/gBwVvI0hQ1OQ7c+cFp156zNmDNdfheQYXKA3
         HXR4GOq7lrO2UGj8qtUnM4HyVB5VMBE7e2w5RFPHwy3RDbqlNjplkNYuTTgLhXuMOAmI
         j/50IF33+cL3A5lEPGlMUp+m7QPZGYtMuBUo6FU8OBORZsKnoaOpJKNqvgkd6CKcrnrT
         rj9CwPy2FhMHBYnDnqQ1rNWBvoXonq4OXvc/ONWffMWIodfGoCXuevqW5L3q7JRUyNOO
         X6b7PrIyNwhjy/AOEhlpW6jC/dUPjlXYh4nfEnnWTGkT0vdhthFznLHmCJtKJJjceYYJ
         JUCQ==
X-Gm-Message-State: AOJu0YyImrw1xA/qyVFMDb4RXkQCmNVPqZTnPE0lSKqJYancwtrlrE94
	ZGetmmf8AbEoMvmChWzjwUy3GL6BYY2MlSP6AJL3eyPCr0Cq+gJyYlScDQ==
X-Google-Smtp-Source: AGHT+IH5rl7AM6zQYXAG+aJ0ffbLNSu0/309FlZoo/vT7vZuT1A5+3u/qubZDlJ2YVnTMYNCeoVUyw==
X-Received: by 2002:a17:907:3204:b0:a9a:825:4c46 with SMTP id a640c23a62f3a-a9de5f66095mr1058498866b.28.1730220465378;
        Tue, 29 Oct 2024 09:47:45 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v1] xen/common: move gic_preinit() to common code
Date: Tue, 29 Oct 2024 17:47:42 +0100
Message-ID: <b1ded26dcebf9a3228fe4062825273720e0c59fe.1730220384.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce ic_preinit() in common code, as it is not architecture-specific
and can be reused by both PPC and RISC-V. The function identifies the node
with the interrupt-controller property and calls device_init() for
architecture-specific initialization of the interrupt controller when
using the device tree. And the similar is done in case of ACPI but instead of
searching of the interrupt-controller property it is searching for entry in
MADT and call acpi_device_init().

This patch makes minor changes compared to the Arm implementation:
- Removes the local rc variable in gic_dt_preinit() since it is only used once.
- Changes the prefix from gic to ic to generalize the code and avoid confusion
  with Arm’s GIC.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/gic.c               | 60 -----------------------------
 xen/arch/arm/setup.c             |  3 +-
 xen/common/device.c              | 65 ++++++++++++++++++++++++++++++++
 xen/include/asm-generic/device.h |  2 +
 4 files changed, 69 insertions(+), 61 deletions(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 3eaf670fd7..b18bb08eba 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -214,66 +214,6 @@ int gic_map_hwdom_extra_mappings(struct domain *d)
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
-#ifdef CONFIG_ACPI
-static void __init gic_acpi_preinit(void)
-{
-    struct acpi_subtable_header *header;
-    struct acpi_madt_generic_distributor *dist;
-
-    header = acpi_table_get_entry_madt(ACPI_MADT_TYPE_GENERIC_DISTRIBUTOR, 0);
-    if ( !header )
-        panic("No valid GICD entries exists\n");
-
-    dist = container_of(header, struct acpi_madt_generic_distributor, header);
-
-    if ( acpi_device_init(DEVICE_INTERRUPT_CONTROLLER, NULL, dist->version) )
-        panic("Unable to find compatible GIC in the ACPI table\n");
-}
-#else
-static void __init gic_acpi_preinit(void) { }
-#endif
-
-/* Find the interrupt controller and set up the callback to translate
- * device tree or ACPI IRQ.
- */
-void __init gic_preinit(void)
-{
-    if ( acpi_disabled )
-        gic_dt_preinit();
-    else
-        gic_acpi_preinit();
-}
-
 /* Set up the GIC */
 void __init gic_init(void)
 {
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 71ebaa77ca..1ea7db0bd4 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -38,6 +38,7 @@
 #include <asm/page.h>
 #include <asm/static-evtchn.h>
 #include <asm/current.h>
+#include <asm/device.h>
 #include <asm/setup.h>
 #include <asm/gic.h>
 #include <asm/cpuerrata.h>
@@ -359,7 +360,7 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
 
     preinit_xen_time();
 
-    gic_preinit();
+    ic_preinit();
 
     arm_uart_init();
     console_init_preirq();
diff --git a/xen/common/device.c b/xen/common/device.c
index 33e0d58f2f..cb07bd6e4f 100644
--- a/xen/common/device.c
+++ b/xen/common/device.c
@@ -4,10 +4,14 @@
  *   xen/arch/arm/device.c
  */
 
+#include <xen/acpi.h>
 #include <xen/bug.h>
 #include <xen/device_tree.h>
 #include <xen/errno.h>
 #include <xen/init.h>
+#include <xen/kernel.h>
+#include <xen/lib.h>
+#include <xen/types.h>
 
 #include <asm/device.h>
 
@@ -56,6 +60,40 @@ enum device_class device_get_class(const struct dt_device_node *dev)
     return DEVICE_UNKNOWN;
 }
 
+static void __init ic_dt_preinit(void)
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
+
+#else /* !CONFIG_HAS_DEVICE_TREE */
+
+static void __init ic_dt_preinit(void) { }
+
 #endif
 
 #ifdef CONFIG_ACPI
@@ -79,4 +117,31 @@ int __init acpi_device_init(enum device_class class, const void *data, int class
     return -EBADF;
 }
 
+static void __init ic_acpi_preinit(void)
+{
+    struct acpi_subtable_header *header;
+    struct acpi_madt_generic_distributor *dist;
+
+    header = acpi_table_get_entry_madt(ACPI_MADT_TYPE_GENERIC_DISTRIBUTOR, 0);
+    if ( !header )
+        panic("No valid interrupt controller entries exists\n");
+
+    dist = container_of(header, struct acpi_madt_generic_distributor, header);
+
+    if ( acpi_device_init(DEVICE_INTERRUPT_CONTROLLER, NULL, dist->version) )
+        panic("Unable to find compatible interrupt controller"
+              "in the ACPI table\n");
+}
+#else /* !CONFIG_ACPI */
+
+static void __init ic_acpi_preinit(void) { }
+
 #endif
+
+void __init ic_preinit(void)
+{
+    if ( acpi_disabled )
+        ic_dt_preinit();
+    else
+        ic_acpi_preinit();
+}
diff --git a/xen/include/asm-generic/device.h b/xen/include/asm-generic/device.h
index 1acd1ba1d8..ccfb062d6a 100644
--- a/xen/include/asm-generic/device.h
+++ b/xen/include/asm-generic/device.h
@@ -127,6 +127,8 @@ __section(".adev.info") = {                                         \
 
 #endif /* CONFIG_ACPI */
 
+void ic_preinit(void);
+
 #endif /* __ASM_GENERIC_DEVICE_H__ */
 
 /*
-- 
2.47.0


