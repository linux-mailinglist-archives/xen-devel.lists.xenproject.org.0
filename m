Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3256939C5D
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 10:16:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762708.1172973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWAgv-0003f4-Un; Tue, 23 Jul 2024 08:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762708.1172973; Tue, 23 Jul 2024 08:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWAgv-0003cA-RV; Tue, 23 Jul 2024 08:16:13 +0000
Received: by outflank-mailman (input) for mailman id 762708;
 Tue, 23 Jul 2024 08:16:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0IL=OX=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sWAgp-0008AN-5Z
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 08:16:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce620007-48cb-11ef-bbfe-fd08da9f4363;
 Tue, 23 Jul 2024 10:16:05 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-79-35-51-193.retail.telecomitalia.it [79.35.51.193])
 by support.bugseng.com (Postfix) with ESMTPSA id 7E3FB4EE0744;
 Tue, 23 Jul 2024 10:16:04 +0200 (CEST)
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
X-Inumbo-ID: ce620007-48cb-11ef-bbfe-fd08da9f4363
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [XEN PATCH v5 17/17] include/asm-generic: rename inclusion guards for consistency
Date: Tue, 23 Jul 2024 10:15:09 +0200
Message-Id: <79c020c608d59c1c5d4156e307acba046b1ad17e.1721720583.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721720583.git.alessandro.zucchelli@bugseng.com>
References: <cover.1721720583.git.alessandro.zucchelli@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Edit inclusion guards in asm-generic header files in order to make them
consistent with the estabilished naming convention.

No functional change.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
 xen/include/asm-generic/altp2m.h     | 6 +++---
 xen/include/asm-generic/atomic-ops.h | 6 +++---
 xen/include/asm-generic/device.h     | 6 +++---
 xen/include/asm-generic/div64.h      | 6 +++---
 xen/include/asm-generic/hardirq.h    | 6 +++---
 xen/include/asm-generic/iocap.h      | 6 +++---
 xen/include/asm-generic/monitor.h    | 6 +++---
 xen/include/asm-generic/paging.h     | 6 +++---
 xen/include/asm-generic/percpu.h     | 6 +++---
 xen/include/asm-generic/random.h     | 6 +++---
 xen/include/asm-generic/softirq.h    | 6 +++---
 xen/include/asm-generic/vm_event.h   | 6 +++---
 12 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/xen/include/asm-generic/altp2m.h b/xen/include/asm-generic/altp2m.h
index 39865a842a..34ae943145 100644
--- a/xen/include/asm-generic/altp2m.h
+++ b/xen/include/asm-generic/altp2m.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_GENERIC_ALTP2M_H
-#define __ASM_GENERIC_ALTP2M_H
+#ifndef ASM_GENERIC__ALTP2M_H
+#define ASM_GENERIC__ALTP2M_H
 
 #include <xen/bug.h>
 
@@ -22,7 +22,7 @@ static inline unsigned int altp2m_vcpu_idx(const struct vcpu *v)
     return 0;
 }
 
-#endif /* __ASM_GENERIC_ALTP2M_H */
+#endif /* ASM_GENERIC__ALTP2M_H */
 
 /*
  * Local variables:
diff --git a/xen/include/asm-generic/atomic-ops.h b/xen/include/asm-generic/atomic-ops.h
index 98dd907942..50f1db909d 100644
--- a/xen/include/asm-generic/atomic-ops.h
+++ b/xen/include/asm-generic/atomic-ops.h
@@ -4,8 +4,8 @@
  * forward inline declaration that can be synthesized from other atomic
  * functions or being created from scratch.
  */
-#ifndef _ASM_GENERIC_ATOMIC_OPS_H_
-#define _ASM_GENERIC_ATOMIC_OPS_H_
+#ifndef ASM_GENERIC__ATOMIC_OPS_H_
+#define ASM_GENERIC__ATOMIC_OPS_H_
 
 #include <xen/atomic.h>
 #include <xen/lib.h>
@@ -94,4 +94,4 @@ static inline int atomic_add_negative(int i, atomic_t *v)
 }
 #endif
 
-#endif /* _ASM_GENERIC_ATOMIC_OPS_H_ */
+#endif /* ASM_GENERIC__ATOMIC_OPS_H_ */
diff --git a/xen/include/asm-generic/device.h b/xen/include/asm-generic/device.h
index 1acd1ba1d8..eccd3159a9 100644
--- a/xen/include/asm-generic/device.h
+++ b/xen/include/asm-generic/device.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_GENERIC_DEVICE_H__
-#define __ASM_GENERIC_DEVICE_H__
+#ifndef ASM_GENERIC__DEVICE_H
+#define ASM_GENERIC__DEVICE_H
 
 #include <xen/stdbool.h>
 
@@ -127,7 +127,7 @@ __section(".adev.info") = {                                         \
 
 #endif /* CONFIG_ACPI */
 
-#endif /* __ASM_GENERIC_DEVICE_H__ */
+#endif /* ASM_GENERIC__DEVICE_H */
 
 /*
  * Local variables:
diff --git a/xen/include/asm-generic/div64.h b/xen/include/asm-generic/div64.h
index 068d8a11ad..c1770561c6 100644
--- a/xen/include/asm-generic/div64.h
+++ b/xen/include/asm-generic/div64.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_GENERIC_DIV64
-#define __ASM_GENERIC_DIV64
+#ifndef ASM_GENERIC__DIV64_H
+#define ASM_GENERIC__DIV64_H
 
 #include <xen/types.h>
 
@@ -15,7 +15,7 @@
 
 #endif /* BITS_PER_LONG */
 
-#endif
+#endif /* ASM_GENERIC__DIV64_H */
 
 /*
  * Local variables:
diff --git a/xen/include/asm-generic/hardirq.h b/xen/include/asm-generic/hardirq.h
index ddccf460b9..09260b1b08 100644
--- a/xen/include/asm-generic/hardirq.h
+++ b/xen/include/asm-generic/hardirq.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_GENERIC_HARDIRQ_H
-#define __ASM_GENERIC_HARDIRQ_H
+#ifndef ASM_GENERIC__HARDIRQ_H
+#define ASM_GENERIC__HARDIRQ_H
 
 #include <xen/cache.h>
 #include <xen/smp.h>
@@ -17,7 +17,7 @@ typedef struct {
 #define irq_enter()     (local_irq_count(smp_processor_id())++)
 #define irq_exit()      (local_irq_count(smp_processor_id())--)
 
-#endif /* __ASM_GENERIC_HARDIRQ_H */
+#endif /* ASM_GENERIC__HARDIRQ_H */
 
 /*
  * Local variables:
diff --git a/xen/include/asm-generic/iocap.h b/xen/include/asm-generic/iocap.h
index dd7cb45488..1001fb629a 100644
--- a/xen/include/asm-generic/iocap.h
+++ b/xen/include/asm-generic/iocap.h
@@ -1,11 +1,11 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_GENERIC_IOCAP_H__
-#define __ASM_GENERIC_IOCAP_H__
+#ifndef ASM_GENERIC__IOCAP_H
+#define ASM_GENERIC__IOCAP_H
 
 #define cache_flush_permitted(d)                        \
     (!rangeset_is_empty((d)->iomem_caps))
 
-#endif /* __ASM_GENERIC_IOCAP_H__ */
+#endif /* ASM_GENERIC__IOCAP_H */
 
 /*
  * Local variables:
diff --git a/xen/include/asm-generic/monitor.h b/xen/include/asm-generic/monitor.h
index 1ade289099..e53f0823cb 100644
--- a/xen/include/asm-generic/monitor.h
+++ b/xen/include/asm-generic/monitor.h
@@ -9,8 +9,8 @@
  *
  */
 
-#ifndef __ASM_GENERIC_MONITOR_H__
-#define __ASM_GENERIC_MONITOR_H__
+#ifndef ASM_GENERIC__MONITOR_H
+#define ASM_GENERIC__MONITOR_H
 
 #include <xen/errno.h>
 #include <xen/lib.h>
@@ -52,7 +52,7 @@ void arch_monitor_cleanup_domain(struct domain *d)
     /* No arch-specific domain cleanup on GENERIC. */
 }
 
-#endif /* __ASM_GENERIC_MONITOR_H__ */
+#endif /* ASM_GENERIC__MONITOR_H */
 
 /*
  * Local variables:
diff --git a/xen/include/asm-generic/paging.h b/xen/include/asm-generic/paging.h
index 8df534cfdc..1a8fae6543 100644
--- a/xen/include/asm-generic/paging.h
+++ b/xen/include/asm-generic/paging.h
@@ -1,13 +1,13 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_GENERIC_PAGING_H__
-#define __ASM_GENERIC_PAGING_H__
+#ifndef ASM_GENERIC__PAGING_H
+#define ASM_GENERIC__PAGING_H
 
 #include <xen/stdbool.h>
 
 #define paging_mode_translate(d)    ((void)(d), true)
 #define paging_mode_external(d)     ((void)(d), true)
 
-#endif /* __ASM_GENERIC_PAGING_H__ */
+#endif /* ASM_GENERIC__PAGING_H */
 
 /*
  * Local variables:
diff --git a/xen/include/asm-generic/percpu.h b/xen/include/asm-generic/percpu.h
index 60af4f9ff9..7302edb00c 100644
--- a/xen/include/asm-generic/percpu.h
+++ b/xen/include/asm-generic/percpu.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_GENERIC_PERCPU_H__
-#define __ASM_GENERIC_PERCPU_H__
+#ifndef ASM_GENERIC__PERCPU_H
+#define ASM_GENERIC__PERCPU_H
 
 #ifndef __ASSEMBLY__
 
@@ -25,7 +25,7 @@ void percpu_init_areas(void);
 
 #endif
 
-#endif /* __ASM_GENERIC_PERCPU_H__ */
+#endif /* ASM_GENERIC__PERCPU_H */
 
 /*
  * Local variables:
diff --git a/xen/include/asm-generic/random.h b/xen/include/asm-generic/random.h
index d0d35dd217..f2e6c1c11c 100644
--- a/xen/include/asm-generic/random.h
+++ b/xen/include/asm-generic/random.h
@@ -1,13 +1,13 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_GENERIC_RANDOM_H__
-#define __ASM_GENERIC_RANDOM_H__
+#ifndef ASM_GENERIC__RANDOM_H
+#define ASM_GENERIC__RANDOM_H
 
 static inline unsigned int arch_get_random(void)
 {
     return 0;
 }
 
-#endif /* __ASM_GENERIC_RANDOM_H__ */
+#endif /* ASM_GENERIC__RANDOM_H */
 
 /*
  * Local variables:
diff --git a/xen/include/asm-generic/softirq.h b/xen/include/asm-generic/softirq.h
index 83be855e50..92144c7eca 100644
--- a/xen/include/asm-generic/softirq.h
+++ b/xen/include/asm-generic/softirq.h
@@ -1,12 +1,12 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_GENERIC_SOFTIRQ_H__
-#define __ASM_GENERIC_SOFTIRQ_H__
+#ifndef ASM_GENERIC__SOFTIRQ_H
+#define ASM_GENERIC__SOFTIRQ_H
 
 #define NR_ARCH_SOFTIRQS       0
 
 #define arch_skip_send_event_check(cpu) 0
 
-#endif /* __ASM_GENERIC_SOFTIRQ_H__ */
+#endif /* ASM_GENERIC__SOFTIRQ_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/asm-generic/vm_event.h b/xen/include/asm-generic/vm_event.h
index 620c7b971c..ff538b6ba4 100644
--- a/xen/include/asm-generic/vm_event.h
+++ b/xen/include/asm-generic/vm_event.h
@@ -5,8 +5,8 @@
  * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
  */
 
-#ifndef __ASM_GENERIC_VM_EVENT_H__
-#define __ASM_GENERIC_VM_EVENT_H__
+#ifndef ASM_GENERIC__VM_EVENT_H
+#define ASM_GENERIC__VM_EVENT_H
 
 #include <xen/sched.h>
 #include <public/vm_event.h>
@@ -52,4 +52,4 @@ void vm_event_reset_vmtrace(struct vcpu *v)
     /* Nothing to do. */
 }
 
-#endif /* __ASM_GENERIC_VM_EVENT_H__ */
+#endif /* ASM_GENERIC__VM_EVENT_H */
-- 
2.34.1


