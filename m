Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 206BC877C21
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 10:00:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691274.1077155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbWE-0001K7-0U; Mon, 11 Mar 2024 09:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691274.1077155; Mon, 11 Mar 2024 09:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbWD-00016O-7o; Mon, 11 Mar 2024 09:00:25 +0000
Received: by outflank-mailman (input) for mailman id 691274;
 Mon, 11 Mar 2024 09:00:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xWeI=KR=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rjbW8-0006j9-7r
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 09:00:20 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8a8545d-df85-11ee-a1ee-f123f15fe8a2;
 Mon, 11 Mar 2024 10:00:18 +0100 (CET)
Received: from beta.station (net-93-144-106-196.cust.vodafonedsl.it
 [93.144.106.196])
 by support.bugseng.com (Postfix) with ESMTPSA id 0C5F54EE0C99;
 Mon, 11 Mar 2024 10:00:18 +0100 (CET)
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
X-Inumbo-ID: c8a8545d-df85-11ee-a1ee-f123f15fe8a2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v3 14/16] xen/x86: address violations of MISRA C:2012 Directive 4.10
Date: Mon, 11 Mar 2024 09:59:23 +0100
Message-Id: <305d6474a84e16d44c193a93e2c2ca91d6dd0f7e.1710145041.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710145041.git.simone.ballarin@bugseng.com>
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

Edit inclusion guards to address violations of
MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order to
prevent the contents of a header file being included more than once").
Mechanical change.
 ---
 Commit introduced in v3

 Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
 Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
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
index 622d22bef2..cb7b01f7ef 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_DOMAIN_H__
-#define __ASM_DOMAIN_H__
+#ifndef ASM_X86_DOMAIN_H
+#define ASM_X86_DOMAIN_H
 
 #include <xen/mm.h>
 #include <xen/radix-tree.h>
@@ -780,7 +780,7 @@ struct arch_vcpu_io {
 /* Maxphysaddr supportable by the paging infrastructure. */
 unsigned int domain_max_paddr_bits(const struct domain *d);
 
-#endif /* __ASM_DOMAIN_H__ */
+#endif /* ASM_X86_DOMAIN_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/event.h b/xen/arch/x86/include/asm/event.h
index 5e09ede6d7..c0b6088c91 100644
--- a/xen/arch/x86/include/asm/event.h
+++ b/xen/arch/x86/include/asm/event.h
@@ -6,8 +6,8 @@
  *
  */
 
-#ifndef __ASM_EVENT_H__
-#define __ASM_EVENT_H__
+#ifndef ASM_X86_EVENT_H
+#define ASM_X86_EVENT_H
 
 #include <xen/shared.h>
 
@@ -53,4 +53,4 @@ static inline bool arch_virq_is_global(unsigned int virq)
              (pv_shim && (chn)->port && (chn)->state == ECS_RESERVED)
 #endif
 
-#endif
+#endif /* ASM_X86_EVENT_H */
diff --git a/xen/arch/x86/include/asm/grant_table.h b/xen/arch/x86/include/asm/grant_table.h
index 5c23cec90c..2468f21ad6 100644
--- a/xen/arch/x86/include/asm/grant_table.h
+++ b/xen/arch/x86/include/asm/grant_table.h
@@ -4,8 +4,8 @@
  * Copyright (c) 2004-2005 K A Fraser
  */
 
-#ifndef __ASM_GRANT_TABLE_H__
-#define __ASM_GRANT_TABLE_H__
+#ifndef ASM_X86_GRANT_TABLE_H
+#define ASM_X86_GRANT_TABLE_H
 
 #include <asm/paging.h>
 
@@ -72,4 +72,4 @@ static inline void gnttab_clear_flags(struct domain *d,
 #define gnttab_need_iommu_mapping(d)                \
     (!paging_mode_translate(d) && need_iommu_pt_sync(d))
 
-#endif /* __ASM_GRANT_TABLE_H__ */
+#endif /* ASM_X86_GRANT_TABLE_H */
diff --git a/xen/arch/x86/include/asm/io.h b/xen/arch/x86/include/asm/io.h
index 9b19d2d389..9371784584 100644
--- a/xen/arch/x86/include/asm/io.h
+++ b/xen/arch/x86/include/asm/io.h
@@ -1,5 +1,5 @@
-#ifndef _ASM_IO_H
-#define _ASM_IO_H
+#ifndef ASM_X86_IO_H
+#define ASM_X86_IO_H
 
 #include <xen/vmap.h>
 #include <xen/types.h>
@@ -57,4 +57,4 @@ struct cpu_user_regs;
 unsigned int ioemul_handle_proliant_quirk(
     uint8_t opcode, char *io_emul_stub, const struct cpu_user_regs *regs);
 
-#endif
+#endif /* ASM_X86_IO_H */
diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index 082a3d6bbc..f8139842b4 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -1,5 +1,5 @@
-#ifndef _ASM_HW_IRQ_H
-#define _ASM_HW_IRQ_H
+#ifndef ASM_X86_IRQ_H
+#define ASM_X86_IRQ_H
 
 /* (C) 1992, 1993 Linus Torvalds, (C) 1997 Ingo Molnar */
 
@@ -192,4 +192,4 @@ int allocate_and_map_gsi_pirq(struct domain *d, int index, int *pirq_p);
 int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
                               int type, struct msi_info *msi);
 
-#endif /* _ASM_HW_IRQ_H */
+#endif /* ASM_X86_IRQ_H */
diff --git a/xen/arch/x86/include/asm/smp.h b/xen/arch/x86/include/asm/smp.h
index c8c7960134..cdfe9ea96f 100644
--- a/xen/arch/x86/include/asm/smp.h
+++ b/xen/arch/x86/include/asm/smp.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_SMP_H
-#define __ASM_SMP_H
+#ifndef ASM_X86_SMP_H
+#define ASM_X86_SMP_H
 
 /*
  * We need the APIC definitions automatically as part of 'smp.h'
@@ -81,4 +81,4 @@ void *cpu_alloc_stack(unsigned int cpu);
 
 #endif /* !__ASSEMBLY__ */
 
-#endif
+#endif /* ASM_X86_SMP_H */
diff --git a/xen/arch/x86/include/asm/spinlock.h b/xen/arch/x86/include/asm/spinlock.h
index 56f6095752..2a86560343 100644
--- a/xen/arch/x86/include/asm/spinlock.h
+++ b/xen/arch/x86/include/asm/spinlock.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_SPINLOCK_H
-#define __ASM_SPINLOCK_H
+#ifndef ASM_X86_SPINLOCK_H
+#define ASM_X86_SPINLOCK_H
 
 #define _raw_read_unlock(l) \
     BUILD_BUG_ON(sizeof((l)->lock) != 4); /* Clang doesn't support %z in asm. */ \
@@ -24,4 +24,4 @@
     arch_lock_signal();             \
 })
 
-#endif /* __ASM_SPINLOCK_H */
+#endif /* ASM_X86_SPINLOCK_H */
diff --git a/xen/arch/x86/include/asm/system.h b/xen/arch/x86/include/asm/system.h
index 73cb16ca68..12e8b974b1 100644
--- a/xen/arch/x86/include/asm/system.h
+++ b/xen/arch/x86/include/asm/system.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_SYSTEM_H
-#define __ASM_SYSTEM_H
+#ifndef ASM_X86_SYSTEM_H
+#define ASM_X86_SYSTEM_H
 
 #include <xen/bitops.h>
 #include <xen/bug.h>
@@ -269,4 +269,4 @@ void load_system_tables(void);
 void percpu_traps_init(void);
 void subarch_percpu_traps_init(void);
 
-#endif
+#endif /* ASM_X86_SYSTEM_H */
-- 
2.34.1


