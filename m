Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C11991E106
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 15:43:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751637.1159653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHJR-0006du-F9; Mon, 01 Jul 2024 13:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751637.1159653; Mon, 01 Jul 2024 13:43:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHJR-0006bZ-CL; Mon, 01 Jul 2024 13:43:21 +0000
Received: by outflank-mailman (input) for mailman id 751637;
 Mon, 01 Jul 2024 13:43:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FOPt=OB=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sOHJP-0006bT-Kz
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 13:43:19 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df458d27-37af-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 15:43:17 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id E353F4EE0738;
 Mon,  1 Jul 2024 15:43:14 +0200 (CEST)
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
X-Inumbo-ID: df458d27-37af-11ef-b4bb-af5377834399
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: nicola.vetrini@bugseng.com,
	consulting@bugseng.com,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 11/17] xen/arm: address violations of MISRA C:2012 Directive 4.10
Date: Mon,  1 Jul 2024 15:43:00 +0200
Message-Id: <8e9fee0a3dac64c0c7e49489f55256a37cab7a76.1719829101.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

Add or modify inclusion guards to address violations of
MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order to
prevent the contents of a header file being included more than once").
Mechanical change.

Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
Signed-off-by: Nicola Vetrini  <nicola.vetrini@bugseng.com>
Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

--
Changes in v4:
- fix typo in include guard for arm efibind.

Commit introduced in v3
---
 xen/arch/arm/include/asm/domain.h      | 6 +++---
 xen/arch/arm/include/asm/efibind.h     | 5 +++++
 xen/arch/arm/include/asm/event.h       | 6 +++---
 xen/arch/arm/include/asm/grant_table.h | 6 +++---
 xen/arch/arm/include/asm/io.h          | 6 +++---
 xen/arch/arm/include/asm/irq.h         | 6 +++---
 xen/arch/arm/include/asm/smp.h         | 6 +++---
 xen/arch/arm/include/asm/spinlock.h    | 6 +++---
 xen/arch/arm/include/asm/system.h      | 6 +++---
 9 files changed, 29 insertions(+), 24 deletions(-)

diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index f1d72c6e48..e5f011c2fa 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_DOMAIN_H__
-#define __ASM_DOMAIN_H__
+#ifndef ASM_ARM_DOMAIN_H
+#define ASM_ARM_DOMAIN_H
 
 #include <xen/cache.h>
 #include <xen/timer.h>
@@ -310,7 +310,7 @@ static inline void update_guest_memory_policy(struct vcpu *v,
                                               struct guest_memory_policy *gmp)
 {}
 
-#endif /* __ASM_DOMAIN_H__ */
+#endif /* ASM_ARM_DOMAIN_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/efibind.h b/xen/arch/arm/include/asm/efibind.h
index 09dca7a8c9..61e23c6510 100644
--- a/xen/arch/arm/include/asm/efibind.h
+++ b/xen/arch/arm/include/asm/efibind.h
@@ -1,2 +1,7 @@
+#ifndef ASM_ARM_EFIBIND_H
+#define ASM_ARM_EFIBIND_H
+
 #include <xen/types.h>
 #include <asm/arm64/efibind.h>
+
+#endif /* ASM_ARM_EFIBIND_H */
diff --git a/xen/arch/arm/include/asm/event.h b/xen/arch/arm/include/asm/event.h
index b14c166ad6..db5d5ea37a 100644
--- a/xen/arch/arm/include/asm/event.h
+++ b/xen/arch/arm/include/asm/event.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_EVENT_H__
-#define __ASM_EVENT_H__
+#ifndef ASM_ARM_EVENT_H
+#define ASM_ARM_EVENT_H
 
 #include <asm/domain.h>
 
@@ -52,7 +52,7 @@ static inline bool arch_virq_is_global(unsigned int virq)
     return true;
 }
 
-#endif
+#endif /* ASM_ARM_EVENT_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/grant_table.h b/xen/arch/arm/include/asm/grant_table.h
index d3c518a926..0363c6aa1e 100644
--- a/xen/arch/arm/include/asm/grant_table.h
+++ b/xen/arch/arm/include/asm/grant_table.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_GRANT_TABLE_H__
-#define __ASM_GRANT_TABLE_H__
+#ifndef ASM_ARM_GRANT_TABLE_H
+#define ASM_ARM_GRANT_TABLE_H
 
 #include <xen/grant_table.h>
 #include <xen/kernel.h>
@@ -76,7 +76,7 @@ int replace_grant_host_mapping(uint64_t gpaddr, mfn_t frame,
 #define gnttab_need_iommu_mapping(d)                    \
     (is_domain_direct_mapped(d) && is_iommu_enabled(d))
 
-#endif /* __ASM_GRANT_TABLE_H__ */
+#endif /* ASM_ARM_GRANT_TABLE_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/io.h b/xen/arch/arm/include/asm/io.h
index e426804424..8b5f811ec8 100644
--- a/xen/arch/arm/include/asm/io.h
+++ b/xen/arch/arm/include/asm/io.h
@@ -1,5 +1,5 @@
-#ifndef _ASM_IO_H
-#define _ASM_IO_H
+#ifndef ASM_ARM_IO_H
+#define ASM_ARM_IO_H
 
 #if defined(CONFIG_ARM_32)
 # include <asm/arm32/io.h>
@@ -9,7 +9,7 @@
 # error "unknown ARM variant"
 #endif
 
-#endif
+#endif /* ASM_ARM_IO_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.h
index ec437add09..5a1b2cd5ba 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -1,5 +1,5 @@
-#ifndef _ASM_HW_IRQ_H
-#define _ASM_HW_IRQ_H
+#ifndef ASM_ARM_IRQ_H
+#define ASM_ARM_IRQ_H
 
 #include <xen/device_tree.h>
 #include <public/device_tree_defs.h>
@@ -101,7 +101,7 @@ bool irq_type_set_by_domain(const struct domain *d);
 void irq_end_none(struct irq_desc *irq);
 #define irq_end_none irq_end_none
 
-#endif /* _ASM_HW_IRQ_H */
+#endif /* ASM_ARM_IRQ_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/smp.h b/xen/arch/arm/include/asm/smp.h
index e99a3a3f53..44e4183470 100644
--- a/xen/arch/arm/include/asm/smp.h
+++ b/xen/arch/arm/include/asm/smp.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_SMP_H
-#define __ASM_SMP_H
+#ifndef ASM_ARM_SMP_H
+#define ASM_ARM_SMP_H
 
 #ifndef __ASSEMBLY__
 #include <xen/cpumask.h>
@@ -39,7 +39,7 @@ extern unsigned int smp_get_max_cpus(void);
 
 #define cpu_physical_id(cpu) cpu_logical_map(cpu)
 
-#endif
+#endif /* ASM_ARM_SMP_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/spinlock.h b/xen/arch/arm/include/asm/spinlock.h
index 42b0f584fe..326005c39a 100644
--- a/xen/arch/arm/include/asm/spinlock.h
+++ b/xen/arch/arm/include/asm/spinlock.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_SPINLOCK_H
-#define __ASM_SPINLOCK_H
+#ifndef ASM_ARM_SPINLOCK_H
+#define ASM_ARM_SPINLOCK_H
 
 #define arch_lock_acquire_barrier() smp_mb()
 #define arch_lock_release_barrier() smp_mb()
@@ -12,4 +12,4 @@
 
 #define arch_lock_signal_wmb()  arch_lock_signal()
 
-#endif /* __ASM_SPINLOCK_H */
+#endif /* ASM_ARM_SPINLOCK_H */
diff --git a/xen/arch/arm/include/asm/system.h b/xen/arch/arm/include/asm/system.h
index 65d5c8e423..faf9227f53 100644
--- a/xen/arch/arm/include/asm/system.h
+++ b/xen/arch/arm/include/asm/system.h
@@ -1,6 +1,6 @@
 /* Portions taken from Linux arch arm */
-#ifndef __ASM_SYSTEM_H
-#define __ASM_SYSTEM_H
+#ifndef ASM_ARM_SYSTEM_H
+#define ASM_ARM_SYSTEM_H
 
 #include <xen/lib.h>
 #include <public/arch-arm.h>
@@ -62,7 +62,7 @@ static inline int local_abort_is_enabled(void)
 
 extern struct vcpu *__context_switch(struct vcpu *prev, struct vcpu *next);
 
-#endif
+#endif /* ASM_ARM_SYSTEM_H */
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


