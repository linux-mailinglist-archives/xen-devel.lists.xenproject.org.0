Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8689B63DA
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 14:16:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828212.1243061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t68XH-0003tc-Fg; Wed, 30 Oct 2024 13:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828212.1243061; Wed, 30 Oct 2024 13:14:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t68XH-0003ro-Ck; Wed, 30 Oct 2024 13:14:55 +0000
Received: by outflank-mailman (input) for mailman id 828212;
 Wed, 30 Oct 2024 13:14:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhn2=R2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t68XG-0003rh-My
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 13:14:54 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f23a0484-96c0-11ef-a0c3-8be0dac302b0;
 Wed, 30 Oct 2024 14:14:51 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2fb49510250so67513551fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 06:14:51 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53bc0d52c15sm246912e87.154.2024.10.30.06.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 06:14:49 -0700 (PDT)
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
X-Inumbo-ID: f23a0484-96c0-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzYiLCJoZWxvIjoibWFpbC1sajEteDIzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImYyM2EwNDg0LTk2YzAtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjk0MDkxLjU4NzY2NSwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730294091; x=1730898891; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x3YodAKAWV7uViaJXs9SCjgCFQ72aJyLCu8ZCk+VIN0=;
        b=RYObvT413p4QIADNyy5o0iUoyK+YewvkcMNPcF/vRkTdKmuRARE36w4l1PK0l5AdZP
         lvK7xQL3J8OZpdg+YAv6q+weHUq2ZAZlWoQ31hR4D/IWeaIuxK4GmKaCF6KO52C+aJib
         CsrumdaDHefCDpk+NuYOWriNQNrOSzd796UH39ZfLWwryglL2kqLHAEAGw/fENS93qa5
         IXgFUQ5hsoQSP3a7LvHRHfblMlcBNCOzTKyUUyBIiftNFJ1FiVnMWLxJNgWP/DwGnAEu
         9s0pPbeL/I42/x2Vb+RNwWTKwxMQ6AzwxcHVloLLNHZ2XvWGSLLO+ze8NZ8jG20E93iF
         gUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730294091; x=1730898891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3YodAKAWV7uViaJXs9SCjgCFQ72aJyLCu8ZCk+VIN0=;
        b=scFrD7Bghdj0Q/YCFep8xVAu19idc8o+m59X//57Jmu9rUzepG7QPnWyXPTMIEpLLf
         y/otIgAnXVc/ARw1ImpbGUb+tw1s5JmoJzUHXJsJlqbde8b/aobEUf2mZCykJZU7YkNi
         Iiv8WrX8IDqIWwFj7XklINJoxJl7RhZlBWc8Sb/uTSGU/lhUeQpno5iDx+P4zS0QPb/3
         5hxewjmX3aDVs0htk8oycT518jTK5RSvHhv/wgnC68qL5rxGYtCfF7GXLv6/8IlDgdhE
         BOf2Xe+eZKwAplQIh702aZ8yto61kHZtc95ttPt+2Vtw3phWWw0r5m+6xaGheG0koXQu
         FS3Q==
X-Gm-Message-State: AOJu0YwZ8AZ7vgZCqkw3mYhJn4dBBTvfkOp/QNio9QbM0WMPqT+0SaCD
	bxFCeVg8AMUxPelDvw+9w+sf+0Y7F8U22gZNa3kPTqZ/PkgZRbxiuCODnA==
X-Google-Smtp-Source: AGHT+IFeUQPerEMfaoARhTrM7z5e8snG5muD7chF11rpWvIiJE3c02VJ+GfP37JBuApshSvfQ6Hx0A==
X-Received: by 2002:a05:6512:39c7:b0:53a:d8b:95c0 with SMTP id 2adb3069b0e04-53b348d87e6mr7926235e87.30.1730294090256;
        Wed, 30 Oct 2024 06:14:50 -0700 (PDT)
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
Subject: [PATCH v2] xen/common: Move gic_preinit() to common code
Date: Wed, 30 Oct 2024 14:14:47 +0100
Message-ID: <e906b538aba684ab108cc70e8c60ed35ddfad74e.1730292286.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce ic_preinit() in the common codebase, as it is not
architecture-specific and can be reused by both PPC and RISC-V.
This function identifies the node with the interrupt-controller property
in the device tree and calls device_init() to handle architecture-specific
initialization of the interrupt controller.

Additionally, rename gic_acpi_preinit() to ic_acpi_preinit() as it is used
by ic_preinit(), while keeping it defined in architecture-specific as this
part is architecture-specific. In case if CONFIG_ACPI=n a stub for
ic_acpi_preinit() is provided. To declaration/defintion of ic_acpi_preint()
is added `inline` to deal with the compilation issue:
  error: 'ic_acpi_preinit' defined but not used [-Werror=unused-function]

Make minor adjustments compared to the original ARM implementation of
gic_dt_preinit():
 - Remove the local rc variable in gic_dt_preinit() since it is only used once.
 - Change the prefix from gic to ic to clarify that the function is not
   specific to ARM’s GIC, making it suitable for other architectures as well.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Revert changes connected to moving of gic_acpi_preinit() to common code as
   it isn't really architecture indepent part.
 - Update the commit message.
 - Move stub of ic_acpi_preinit() to <asm-generic/device.h> for the case when
   CONFIG_ACPI=n.
---
 xen/arch/arm/gic.c               | 45 +------------------------------
 xen/arch/arm/setup.c             |  3 ++-
 xen/common/device.c              | 46 ++++++++++++++++++++++++++++++++
 xen/include/asm-generic/device.h | 10 +++++++
 4 files changed, 59 insertions(+), 45 deletions(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 3eaf670fd7..b4a1e769df 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -214,38 +214,8 @@ int gic_map_hwdom_extra_mappings(struct domain *d)
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
-static void __init gic_acpi_preinit(void)
+void __init ic_acpi_preinit(void)
 {
     struct acpi_subtable_header *header;
     struct acpi_madt_generic_distributor *dist;
@@ -259,21 +229,8 @@ static void __init gic_acpi_preinit(void)
     if ( acpi_device_init(DEVICE_INTERRUPT_CONTROLLER, NULL, dist->version) )
         panic("Unable to find compatible GIC in the ACPI table\n");
 }
-#else
-static void __init gic_acpi_preinit(void) { }
 #endif
 
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
index 33e0d58f2f..f440d8be88 100644
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
@@ -80,3 +118,11 @@ int __init acpi_device_init(enum device_class class, const void *data, int class
 }
 
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
index 1acd1ba1d8..0ce2bb3cdf 100644
--- a/xen/include/asm-generic/device.h
+++ b/xen/include/asm-generic/device.h
@@ -127,6 +127,16 @@ __section(".adev.info") = {                                         \
 
 #endif /* CONFIG_ACPI */
 
+void ic_preinit(void);
+
+#ifdef CONFIG_ACPI
+void ic_acpi_preinit(void);
+#else
+#include <xen/init.h>
+
+static inline void __init ic_acpi_preinit(void) { }
+#endif
+
 #endif /* __ASM_GENERIC_DEVICE_H__ */
 
 /*
-- 
2.47.0


