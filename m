Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C3C939C6A
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 10:17:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762751.1173052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWAhw-0008N2-HI; Tue, 23 Jul 2024 08:17:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762751.1173052; Tue, 23 Jul 2024 08:17:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWAhw-0008LS-E9; Tue, 23 Jul 2024 08:17:16 +0000
Received: by outflank-mailman (input) for mailman id 762751;
 Tue, 23 Jul 2024 08:17:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0IL=OX=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sWAgo-0007w0-B7
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 08:16:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cda0c08d-48cb-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 10:16:03 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-79-35-51-193.retail.telecomitalia.it [79.35.51.193])
 by support.bugseng.com (Postfix) with ESMTPSA id 4C3AB4EE073F;
 Tue, 23 Jul 2024 10:16:03 +0200 (CEST)
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
X-Inumbo-ID: cda0c08d-48cb-11ef-8776-851b0ebba9a2
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Subject: [XEN PATCH v5 14/17] xen/x86: rename inclusion guards for consistency
Date: Tue, 23 Jul 2024 10:15:06 +0200
Message-Id: <dc082174b2a7feda3860bf8655180af90065e60f.1721720583.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721720583.git.alessandro.zucchelli@bugseng.com>
References: <cover.1721720583.git.alessandro.zucchelli@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

Edit inclusion guards in order to make them consistent with the
estabilished naming conventions.

No functional change.

Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

---
Changs in v5:
- edit inclusion guards, according to feedback received
Changes in v4:
- Improve commit message
Commit introduced in v3
---
 xen/arch/x86/include/asm/domain.h      | 6 +++---
 xen/arch/x86/include/asm/event.h       | 6 +++---
 xen/arch/x86/include/asm/grant_table.h | 6 +++---
 xen/arch/x86/include/asm/io.h          | 6 +++---
 xen/arch/x86/include/asm/irq.h         | 6 +++---
 xen/arch/x86/include/asm/smp.h         | 6 +++---
 xen/arch/x86/include/asm/spinlock.h    | 6 +++---
 xen/arch/x86/include/asm/system.h      | 6 +++---
 8 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index f5daeb182b..9818835805 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_DOMAIN_H__
-#define __ASM_DOMAIN_H__
+#ifndef ASM__X86__DOMAIN_H
+#define ASM__X86__DOMAIN_H
 
 #include <xen/mm.h>
 #include <xen/radix-tree.h>
@@ -779,7 +779,7 @@ struct arch_vcpu_io {
 /* Maxphysaddr supportable by the paging infrastructure. */
 unsigned int domain_max_paddr_bits(const struct domain *d);
 
-#endif /* __ASM_DOMAIN_H__ */
+#endif /* ASM__X86__DOMAIN_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/event.h b/xen/arch/x86/include/asm/event.h
index 5e09ede6d7..8932727d5a 100644
--- a/xen/arch/x86/include/asm/event.h
+++ b/xen/arch/x86/include/asm/event.h
@@ -6,8 +6,8 @@
  *
  */
 
-#ifndef __ASM_EVENT_H__
-#define __ASM_EVENT_H__
+#ifndef ASM__X86__EVENT_H
+#define ASM__X86__EVENT_H
 
 #include <xen/shared.h>
 
@@ -53,4 +53,4 @@ static inline bool arch_virq_is_global(unsigned int virq)
              (pv_shim && (chn)->port && (chn)->state == ECS_RESERVED)
 #endif
 
-#endif
+#endif /* ASM__X86__EVENT_H */
diff --git a/xen/arch/x86/include/asm/grant_table.h b/xen/arch/x86/include/asm/grant_table.h
index 5c23cec90c..67a4f84cbb 100644
--- a/xen/arch/x86/include/asm/grant_table.h
+++ b/xen/arch/x86/include/asm/grant_table.h
@@ -4,8 +4,8 @@
  * Copyright (c) 2004-2005 K A Fraser
  */
 
-#ifndef __ASM_GRANT_TABLE_H__
-#define __ASM_GRANT_TABLE_H__
+#ifndef ASM__X86__GRANT_TABLE_H
+#define ASM__X86__GRANT_TABLE_H
 
 #include <asm/paging.h>
 
@@ -72,4 +72,4 @@ static inline void gnttab_clear_flags(struct domain *d,
 #define gnttab_need_iommu_mapping(d)                \
     (!paging_mode_translate(d) && need_iommu_pt_sync(d))
 
-#endif /* __ASM_GRANT_TABLE_H__ */
+#endif /* ASM__X86__GRANT_TABLE_H */
diff --git a/xen/arch/x86/include/asm/io.h b/xen/arch/x86/include/asm/io.h
index 1cb4217cff..6b56a18850 100644
--- a/xen/arch/x86/include/asm/io.h
+++ b/xen/arch/x86/include/asm/io.h
@@ -1,5 +1,5 @@
-#ifndef _ASM_IO_H
-#define _ASM_IO_H
+#ifndef ASM__X86__IO_H
+#define ASM__X86__IO_H
 
 #include <xen/vmap.h>
 #include <xen/types.h>
@@ -57,4 +57,4 @@ struct cpu_user_regs;
 unsigned int ioemul_handle_proliant_quirk(
     uint8_t opcode, char *io_emul_stub, const struct cpu_user_regs *regs);
 
-#endif
+#endif /* ASM__X86__IO_H */
diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index 5f445299be..a73141a15e 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -1,5 +1,5 @@
-#ifndef _ASM_HW_IRQ_H
-#define _ASM_HW_IRQ_H
+#ifndef ASM__X86__IRQ_H
+#define ASM__X86__IRQ_H
 
 /* (C) 1992, 1993 Linus Torvalds, (C) 1997 Ingo Molnar */
 
@@ -231,4 +231,4 @@ int allocate_and_map_gsi_pirq(struct domain *d, int index, int *pirq_p);
 int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
                               int type, struct msi_info *msi);
 
-#endif /* _ASM_HW_IRQ_H */
+#endif /* ASM__X86__IRQ_H */
diff --git a/xen/arch/x86/include/asm/smp.h b/xen/arch/x86/include/asm/smp.h
index c8c7960134..72cf218b8c 100644
--- a/xen/arch/x86/include/asm/smp.h
+++ b/xen/arch/x86/include/asm/smp.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_SMP_H
-#define __ASM_SMP_H
+#ifndef ASM__X86__SMP_H
+#define ASM__X86__SMP_H
 
 /*
  * We need the APIC definitions automatically as part of 'smp.h'
@@ -81,4 +81,4 @@ void *cpu_alloc_stack(unsigned int cpu);
 
 #endif /* !__ASSEMBLY__ */
 
-#endif
+#endif /* ASM__X86__SMP_H */
diff --git a/xen/arch/x86/include/asm/spinlock.h b/xen/arch/x86/include/asm/spinlock.h
index 56f6095752..11bec91e7f 100644
--- a/xen/arch/x86/include/asm/spinlock.h
+++ b/xen/arch/x86/include/asm/spinlock.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_SPINLOCK_H
-#define __ASM_SPINLOCK_H
+#ifndef ASM__X86__SPINLOCK_H
+#define ASM__X86__SPINLOCK_H
 
 #define _raw_read_unlock(l) \
     BUILD_BUG_ON(sizeof((l)->lock) != 4); /* Clang doesn't support %z in asm. */ \
@@ -24,4 +24,4 @@
     arch_lock_signal();             \
 })
 
-#endif /* __ASM_SPINLOCK_H */
+#endif /* ASM__X86__SPINLOCK_H */
diff --git a/xen/arch/x86/include/asm/system.h b/xen/arch/x86/include/asm/system.h
index 73cb16ca68..4e1480c497 100644
--- a/xen/arch/x86/include/asm/system.h
+++ b/xen/arch/x86/include/asm/system.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_SYSTEM_H
-#define __ASM_SYSTEM_H
+#ifndef ASM__X86__SYSTEM_H
+#define ASM__X86__SYSTEM_H
 
 #include <xen/bitops.h>
 #include <xen/bug.h>
@@ -269,4 +269,4 @@ void load_system_tables(void);
 void percpu_traps_init(void);
 void subarch_percpu_traps_init(void);
 
-#endif
+#endif /* ASM__X86__SYSTEM_H */
-- 
2.34.1


