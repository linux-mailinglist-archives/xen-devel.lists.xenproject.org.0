Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F296CF4C7
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 22:52:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516348.800323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phclr-0005rm-1S; Wed, 29 Mar 2023 20:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516348.800323; Wed, 29 Mar 2023 20:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phclq-0005oR-RQ; Wed, 29 Mar 2023 20:51:50 +0000
Received: by outflank-mailman (input) for mailman id 516348;
 Wed, 29 Mar 2023 20:51:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PU7e=7V=citrix.com=prvs=445237bd4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1phclp-0005Jv-F5
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 20:51:49 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 826f04fa-ce73-11ed-b464-930f4c7d94ae;
 Wed, 29 Mar 2023 22:51:44 +0200 (CEST)
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
X-Inumbo-ID: 826f04fa-ce73-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680123104;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IZ6DEE+RFa670gQsj58OFOod0mp2818DgUWPUPcoRus=;
  b=QszRaQMoDlFK2iIUtVpEydzBv814NHT5uB7hZRrhDJ7kKo77pxfZgOZh
   WLoiJVhXrkOzVGPqRPbysx+RmV9YpkcFX0GsyQM5T3CeXqGCvnTzLDV0R
   HD1LJw1F88IDIXdbocff9u/ooIyAZLFDB46xHJjKjTNPdQI52sqUT0Sti
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103500084
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:aZTFVaJU4NEfzBhiFE+Rq5UlxSXFcZb7ZxGr2PjKsXjdYENSg2RVz
 DAeC2GFPa3cZmqmLd93PYrk9kpSvpbVzNFnTlBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QZvPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5xMH5P+
 aUKFQwfVSu/27yc2rzib7RV05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTHZ4Ixh7A9
 j6uE2LRG08nGcW94xq8/3f1veKIkhrUcdkwG+jtnhJtqALKnTFCYPEMbnOkpdGph0j4XMhQQ
 2QE9yxroaUs+UiDStjmQwb+sHOCpgQbWddbD6s98g7l4oj+7hudB2MEZiVcc9Fgv8gzLQHGz
 XfQwYmvX2Y29uTIFzTErOz8QS6O1TY9K14dZCNdXzY58eLYnN1tpAjBF/M+Kfvg5jHqIg0c0
 wxmvQBn2epC3J5bi/nrlbzUq2ny/8aUF2bZ8i2SBzv4tV0hOeZJcqTysTDmAeB8wJF1p7Vrl
 FwNgICg4e8HFvlhfwTdEbxWTNlFCxtoWQAwYGKD/LF7rVxBA1b5IehtDMhWfS+FyPosdz7ze
 1P0sghM/pJVN3bCRfYpM9roUph0kvawS4qNuhXogjxmOMAZmOivoklTibO4hTixwCDAb4lkU
 XtkTSpcJSlDUvk2pNZHb+wczaUq1kgD+I8nfriil07P+ePHNBaopUItbAPmghYRsPnV/204M
 r93a6O39vmoeLagMnSIrdZKdQliwLpSLcmelvG7v9WremJOcFzNwdeIqV/9U+SJR5hoq9o=
IronPort-HdrOrdr: A9a23:ev/R+aNdLJvTTcBcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-IronPort-AV: E=Sophos;i="5.98,301,1673931600"; 
   d="scan'208";a="103500084"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 5/9] x86: Merge the system {cpuid,msr} policy objects
Date: Wed, 29 Mar 2023 21:51:33 +0100
Message-ID: <20230329205137.323253-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230329205137.323253-1-andrew.cooper3@citrix.com>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Right now, they're the same underlying type, containing disjoint information.

Introduce a new cpu-policy.{h,c} to be the new location for all policy
handling logic.  Place the combined objects in __ro_after_init, which has
appeared since the original logic was written.

As we're trying to phase out the use of struct old_cpu_policy entirely, rework
update_domain_cpu_policy() to not pointer-chase through system_policies[].

This in turn allows system_policies[] in sysctl.c to become static and reduced
in scope to XEN_SYSCTL_get_cpu_policy.

No practical change, but we do half the amount of compile time space required
for the system policies, which saves 6x almost-2k at the moment.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/Makefile                 |  1 +
 xen/arch/x86/cpu-policy.c             | 18 +++++++
 xen/arch/x86/cpu/common.c             |  4 +-
 xen/arch/x86/cpuid.c                  | 66 +++++++++++---------------
 xen/arch/x86/domctl.c                 | 17 +++++--
 xen/arch/x86/include/asm/cpu-policy.h | 14 ++++++
 xen/arch/x86/include/asm/cpuid.h      |  6 ---
 xen/arch/x86/include/asm/msr.h        |  7 ---
 xen/arch/x86/msr.c                    | 38 ++++++---------
 xen/arch/x86/sysctl.c                 | 67 ++++++++++-----------------
 10 files changed, 114 insertions(+), 124 deletions(-)
 create mode 100644 xen/arch/x86/cpu-policy.c
 create mode 100644 xen/arch/x86/include/asm/cpu-policy.h

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 5accbe4c6746..f213a6b56a4d 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -18,6 +18,7 @@ obj-y += bitops.o
 obj-bin-y += bzimage.init.o
 obj-bin-y += clear_page.o
 obj-bin-y += copy_page.o
+obj-y += cpu-policy.o
 obj-y += cpuid.o
 obj-$(CONFIG_PV) += compat.o
 obj-$(CONFIG_PV32) += x86_64/compat.o
diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
new file mode 100644
index 000000000000..663e9a084c53
--- /dev/null
+++ b/xen/arch/x86/cpu-policy.c
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#include <xen/cache.h>
+#include <xen/kernel.h>
+
+#include <xen/lib/x86/cpu-policy.h>
+
+#include <asm/cpu-policy.h>
+
+struct cpu_policy __ro_after_init     raw_cpu_policy;
+struct cpu_policy __ro_after_init    host_cpu_policy;
+#ifdef CONFIG_PV
+struct cpu_policy __ro_after_init  pv_max_cpu_policy;
+struct cpu_policy __ro_after_init  pv_def_cpu_policy;
+#endif
+#ifdef CONFIG_HVM
+struct cpu_policy __ro_after_init hvm_max_cpu_policy;
+struct cpu_policy __ro_after_init hvm_def_cpu_policy;
+#endif
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 5ad347534a22..f11dcda57a69 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -3,6 +3,8 @@
 #include <xen/delay.h>
 #include <xen/param.h>
 #include <xen/smp.h>
+
+#include <asm/cpu-policy.h>
 #include <asm/current.h>
 #include <asm/debugreg.h>
 #include <asm/processor.h>
@@ -141,7 +143,7 @@ bool __init probe_cpuid_faulting(void)
 		return false;
 
 	if ((rc = rdmsr_safe(MSR_INTEL_PLATFORM_INFO, val)) == 0)
-		raw_msr_policy.platform_info.cpuid_faulting =
+		raw_cpu_policy.platform_info.cpuid_faulting =
 			val & MSR_PLATFORM_INFO_CPUID_FAULTING;
 
 	if (rc ||
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index b22725c492e7..0916bfe175c8 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -4,6 +4,7 @@
 #include <xen/sched.h>
 #include <xen/nospec.h>
 #include <asm/amd.h>
+#include <asm/cpu-policy.h>
 #include <asm/cpuid.h>
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/nestedhvm.h>
@@ -142,17 +143,6 @@ static void zero_leaves(struct cpuid_leaf *l,
     memset(&l[first], 0, sizeof(*l) * (last - first + 1));
 }
 
-struct cpuid_policy __read_mostly     raw_cpuid_policy,
-                    __read_mostly    host_cpuid_policy;
-#ifdef CONFIG_PV
-struct cpuid_policy __read_mostly  pv_max_cpuid_policy;
-struct cpuid_policy __read_mostly  pv_def_cpuid_policy;
-#endif
-#ifdef CONFIG_HVM
-struct cpuid_policy __read_mostly hvm_max_cpuid_policy;
-struct cpuid_policy __read_mostly hvm_def_cpuid_policy;
-#endif
-
 static void sanitise_featureset(uint32_t *fs)
 {
     /* for_each_set_bit() uses unsigned longs.  Extend with zeroes. */
@@ -344,7 +334,7 @@ static void recalculate_misc(struct cpuid_policy *p)
 
 static void __init calculate_raw_policy(void)
 {
-    struct cpuid_policy *p = &raw_cpuid_policy;
+    struct cpuid_policy *p = &raw_cpu_policy;
 
     x86_cpuid_policy_fill_native(p);
 
@@ -354,10 +344,10 @@ static void __init calculate_raw_policy(void)
 
 static void __init calculate_host_policy(void)
 {
-    struct cpuid_policy *p = &host_cpuid_policy;
+    struct cpuid_policy *p = &host_cpu_policy;
     unsigned int max_extd_leaf;
 
-    *p = raw_cpuid_policy;
+    *p = raw_cpu_policy;
 
     p->basic.max_leaf =
         min_t(uint32_t, p->basic.max_leaf,   ARRAY_SIZE(p->basic.raw) - 1);
@@ -449,17 +439,17 @@ static void __init guest_common_feature_adjustments(uint32_t *fs)
      * of IBRS by using the AMD feature bit.  An administrator may wish for
      * performance reasons to offer IBPB without IBRS.
      */
-    if ( host_cpuid_policy.feat.ibrsb )
+    if ( host_cpu_policy.feat.ibrsb )
         __set_bit(X86_FEATURE_IBPB, fs);
 }
 
 static void __init calculate_pv_max_policy(void)
 {
-    struct cpuid_policy *p = &pv_max_cpuid_policy;
+    struct cpuid_policy *p = &pv_max_cpu_policy;
     uint32_t pv_featureset[FSCAPINTS];
     unsigned int i;
 
-    *p = host_cpuid_policy;
+    *p = host_cpu_policy;
     cpuid_policy_to_featureset(p, pv_featureset);
 
     for ( i = 0; i < ARRAY_SIZE(pv_featureset); ++i )
@@ -486,11 +476,11 @@ static void __init calculate_pv_max_policy(void)
 
 static void __init calculate_pv_def_policy(void)
 {
-    struct cpuid_policy *p = &pv_def_cpuid_policy;
+    struct cpuid_policy *p = &pv_def_cpu_policy;
     uint32_t pv_featureset[FSCAPINTS];
     unsigned int i;
 
-    *p = pv_max_cpuid_policy;
+    *p = pv_max_cpu_policy;
     cpuid_policy_to_featureset(p, pv_featureset);
 
     for ( i = 0; i < ARRAY_SIZE(pv_featureset); ++i )
@@ -506,12 +496,12 @@ static void __init calculate_pv_def_policy(void)
 
 static void __init calculate_hvm_max_policy(void)
 {
-    struct cpuid_policy *p = &hvm_max_cpuid_policy;
+    struct cpuid_policy *p = &hvm_max_cpu_policy;
     uint32_t hvm_featureset[FSCAPINTS];
     unsigned int i;
     const uint32_t *hvm_featuremask;
 
-    *p = host_cpuid_policy;
+    *p = host_cpu_policy;
     cpuid_policy_to_featureset(p, hvm_featureset);
 
     hvm_featuremask = hvm_hap_supported() ?
@@ -539,7 +529,7 @@ static void __init calculate_hvm_max_policy(void)
      * HVM guests are able if running in protected mode.
      */
     if ( (boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
-         raw_cpuid_policy.basic.sep )
+         raw_cpu_policy.basic.sep )
         __set_bit(X86_FEATURE_SEP, hvm_featureset);
 
     /*
@@ -597,12 +587,12 @@ static void __init calculate_hvm_max_policy(void)
 
 static void __init calculate_hvm_def_policy(void)
 {
-    struct cpuid_policy *p = &hvm_def_cpuid_policy;
+    struct cpuid_policy *p = &hvm_def_cpu_policy;
     uint32_t hvm_featureset[FSCAPINTS];
     unsigned int i;
     const uint32_t *hvm_featuremask;
 
-    *p = hvm_max_cpuid_policy;
+    *p = hvm_max_cpu_policy;
     cpuid_policy_to_featureset(p, hvm_featureset);
 
     hvm_featuremask = hvm_hap_supported() ?
@@ -670,8 +660,8 @@ void recalculate_cpuid_policy(struct domain *d)
 {
     struct cpuid_policy *p = d->arch.cpuid;
     const struct cpuid_policy *max = is_pv_domain(d)
-        ? (IS_ENABLED(CONFIG_PV)  ?  &pv_max_cpuid_policy : NULL)
-        : (IS_ENABLED(CONFIG_HVM) ? &hvm_max_cpuid_policy : NULL);
+        ? (IS_ENABLED(CONFIG_PV)  ?  &pv_max_cpu_policy : NULL)
+        : (IS_ENABLED(CONFIG_HVM) ? &hvm_max_cpu_policy : NULL);
     uint32_t fs[FSCAPINTS], max_fs[FSCAPINTS];
     unsigned int i;
 
@@ -746,7 +736,7 @@ void recalculate_cpuid_policy(struct domain *d)
     /* Fold host's FDP_EXCP_ONLY and NO_FPU_SEL into guest's view. */
     fs[FEATURESET_7b0] &= ~(cpufeat_mask(X86_FEATURE_FDP_EXCP_ONLY) |
                             cpufeat_mask(X86_FEATURE_NO_FPU_SEL));
-    fs[FEATURESET_7b0] |= (host_cpuid_policy.feat._7b0 &
+    fs[FEATURESET_7b0] |= (host_cpu_policy.feat._7b0 &
                            (cpufeat_mask(X86_FEATURE_FDP_EXCP_ONLY) |
                             cpufeat_mask(X86_FEATURE_NO_FPU_SEL)));
 
@@ -797,8 +787,8 @@ void recalculate_cpuid_policy(struct domain *d)
 int init_domain_cpuid_policy(struct domain *d)
 {
     struct cpuid_policy *p = is_pv_domain(d)
-        ? (IS_ENABLED(CONFIG_PV)  ?  &pv_def_cpuid_policy : NULL)
-        : (IS_ENABLED(CONFIG_HVM) ? &hvm_def_cpuid_policy : NULL);
+        ? (IS_ENABLED(CONFIG_PV)  ?  &pv_def_cpu_policy : NULL)
+        : (IS_ENABLED(CONFIG_HVM) ? &hvm_def_cpu_policy : NULL);
 
     if ( !p )
     {
@@ -1102,7 +1092,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
         if ( is_pv_domain(d) && is_hardware_domain(d) &&
              guest_kernel_mode(v, regs) && cpu_has_monitor &&
              regs->entry_vector == TRAP_gp_fault )
-            *res = raw_cpuid_policy.basic.raw[5];
+            *res = raw_cpu_policy.basic.raw[5];
         break;
 
     case 0x7:
@@ -1234,14 +1224,14 @@ static void __init __maybe_unused build_assertions(void)
     /* Find some more clever allocation scheme if this trips. */
     BUILD_BUG_ON(sizeof(struct cpuid_policy) > PAGE_SIZE);
 
-    BUILD_BUG_ON(sizeof(raw_cpuid_policy.basic) !=
-                 sizeof(raw_cpuid_policy.basic.raw));
-    BUILD_BUG_ON(sizeof(raw_cpuid_policy.feat) !=
-                 sizeof(raw_cpuid_policy.feat.raw));
-    BUILD_BUG_ON(sizeof(raw_cpuid_policy.xstate) !=
-                 sizeof(raw_cpuid_policy.xstate.raw));
-    BUILD_BUG_ON(sizeof(raw_cpuid_policy.extd) !=
-                 sizeof(raw_cpuid_policy.extd.raw));
+    BUILD_BUG_ON(sizeof(raw_cpu_policy.basic) !=
+                 sizeof(raw_cpu_policy.basic.raw));
+    BUILD_BUG_ON(sizeof(raw_cpu_policy.feat) !=
+                 sizeof(raw_cpu_policy.feat.raw));
+    BUILD_BUG_ON(sizeof(raw_cpu_policy.xstate) !=
+                 sizeof(raw_cpu_policy.xstate.raw));
+    BUILD_BUG_ON(sizeof(raw_cpu_policy.extd) !=
+                 sizeof(raw_cpu_policy.extd.raw));
 }
 
 /*
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 944af63e68d0..5800bb10bc4a 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -35,18 +35,25 @@
 #include <asm/mem_sharing.h>
 #include <asm/xstate.h>
 #include <asm/psr.h>
-#include <asm/cpuid.h>
+#include <asm/cpu-policy.h>
 
 static int update_domain_cpu_policy(struct domain *d,
                                     xen_domctl_cpu_policy_t *xdpc)
 {
     struct old_cpu_policy new = {};
-    const struct old_cpu_policy *sys = is_pv_domain(d)
-        ? &system_policies[XEN_SYSCTL_cpu_policy_pv_max]
-        : &system_policies[XEN_SYSCTL_cpu_policy_hvm_max];
+    struct cpu_policy *sys = is_pv_domain(d)
+        ? (IS_ENABLED(CONFIG_PV)  ?  &pv_max_cpu_policy : NULL)
+        : (IS_ENABLED(CONFIG_HVM) ? &hvm_max_cpu_policy : NULL);
+    struct old_cpu_policy old_sys = { sys, sys };
     struct cpu_policy_errors err = INIT_CPU_POLICY_ERRORS;
     int ret = -ENOMEM;
 
+    if ( !sys )
+    {
+        ASSERT_UNREACHABLE();
+        return -EOPNOTSUPP;
+    }
+
     /* Start by copying the domain's existing policies. */
     if ( !(new.cpuid = xmemdup(d->arch.cpuid)) ||
          !(new.msr   = xmemdup(d->arch.msr)) )
@@ -64,7 +71,7 @@ static int update_domain_cpu_policy(struct domain *d,
     x86_cpuid_policy_clear_out_of_range_leaves(new.cpuid);
 
     /* Audit the combined dataset. */
-    ret = x86_cpu_policies_are_compatible(sys, &new, &err);
+    ret = x86_cpu_policies_are_compatible(&old_sys, &new, &err);
     if ( ret )
         goto out;
 
diff --git a/xen/arch/x86/include/asm/cpu-policy.h b/xen/arch/x86/include/asm/cpu-policy.h
new file mode 100644
index 000000000000..eef14bb4267e
--- /dev/null
+++ b/xen/arch/x86/include/asm/cpu-policy.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef X86_CPU_POLICY_H
+#define X86_CPU_POLICY_H
+
+struct cpu_policy;
+
+extern struct cpu_policy     raw_cpu_policy;
+extern struct cpu_policy    host_cpu_policy;
+extern struct cpu_policy  pv_max_cpu_policy;
+extern struct cpu_policy  pv_def_cpu_policy;
+extern struct cpu_policy hvm_max_cpu_policy;
+extern struct cpu_policy hvm_def_cpu_policy;
+
+#endif /* X86_CPU_POLICY_H */
diff --git a/xen/arch/x86/include/asm/cpuid.h b/xen/arch/x86/include/asm/cpuid.h
index d418e8100dde..ea0586277331 100644
--- a/xen/arch/x86/include/asm/cpuid.h
+++ b/xen/arch/x86/include/asm/cpuid.h
@@ -46,12 +46,6 @@ DECLARE_PER_CPU(struct cpuidmasks, cpuidmasks);
 /* Default masking MSR values, calculated at boot. */
 extern struct cpuidmasks cpuidmask_defaults;
 
-extern struct cpuid_policy raw_cpuid_policy, host_cpuid_policy,
-    pv_max_cpuid_policy, pv_def_cpuid_policy,
-    hvm_max_cpuid_policy, hvm_def_cpuid_policy;
-
-extern const struct old_cpu_policy system_policies[];
-
 /* Check that all previously present features are still available. */
 bool recheck_cpu_features(unsigned int cpu);
 
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 02eddd919c27..022230acc0af 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -292,13 +292,6 @@ static inline void wrmsr_tsc_aux(uint32_t val)
 
 uint64_t msr_spec_ctrl_valid_bits(const struct cpuid_policy *cp);
 
-extern struct msr_policy     raw_msr_policy,
-                            host_msr_policy,
-                          pv_max_msr_policy,
-                          pv_def_msr_policy,
-                         hvm_max_msr_policy,
-                         hvm_def_msr_policy;
-
 /* Container object for per-vCPU MSRs */
 struct vcpu_msrs
 {
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 7ddf0078c3a2..bff26bc4e2b5 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -25,6 +25,7 @@
 #include <xen/sched.h>
 
 #include <asm/amd.h>
+#include <asm/cpu-policy.h>
 #include <asm/debugreg.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/viridian.h>
@@ -37,20 +38,9 @@
 
 DEFINE_PER_CPU(uint32_t, tsc_aux);
 
-struct msr_policy __read_mostly     raw_msr_policy,
-                  __read_mostly    host_msr_policy;
-#ifdef CONFIG_PV
-struct msr_policy __read_mostly  pv_max_msr_policy;
-struct msr_policy __read_mostly  pv_def_msr_policy;
-#endif
-#ifdef CONFIG_HVM
-struct msr_policy __read_mostly hvm_max_msr_policy;
-struct msr_policy __read_mostly hvm_def_msr_policy;
-#endif
-
 static void __init calculate_raw_policy(void)
 {
-    struct msr_policy *mp = &raw_msr_policy;
+    struct msr_policy *mp = &raw_cpu_policy;
 
     /* 0x000000ce  MSR_INTEL_PLATFORM_INFO */
     /* Was already added by probe_cpuid_faulting() */
@@ -61,9 +51,9 @@ static void __init calculate_raw_policy(void)
 
 static void __init calculate_host_policy(void)
 {
-    struct msr_policy *mp = &host_msr_policy;
+    struct msr_policy *mp = &host_cpu_policy;
 
-    *mp = raw_msr_policy;
+    *mp = raw_cpu_policy;
 
     /* 0x000000ce  MSR_INTEL_PLATFORM_INFO */
     /* probe_cpuid_faulting() sanity checks presence of MISC_FEATURES_ENABLES */
@@ -81,25 +71,25 @@ static void __init calculate_host_policy(void)
 
 static void __init calculate_pv_max_policy(void)
 {
-    struct msr_policy *mp = &pv_max_msr_policy;
+    struct msr_policy *mp = &pv_max_cpu_policy;
 
-    *mp = host_msr_policy;
+    *mp = host_cpu_policy;
 
     mp->arch_caps.raw = 0; /* Not supported yet. */
 }
 
 static void __init calculate_pv_def_policy(void)
 {
-    struct msr_policy *mp = &pv_def_msr_policy;
+    struct msr_policy *mp = &pv_def_cpu_policy;
 
-    *mp = pv_max_msr_policy;
+    *mp = pv_max_cpu_policy;
 }
 
 static void __init calculate_hvm_max_policy(void)
 {
-    struct msr_policy *mp = &hvm_max_msr_policy;
+    struct msr_policy *mp = &hvm_max_cpu_policy;
 
-    *mp = host_msr_policy;
+    *mp = host_cpu_policy;
 
     /* It's always possible to emulate CPUID faulting for HVM guests */
     mp->platform_info.cpuid_faulting = true;
@@ -109,9 +99,9 @@ static void __init calculate_hvm_max_policy(void)
 
 static void __init calculate_hvm_def_policy(void)
 {
-    struct msr_policy *mp = &hvm_def_msr_policy;
+    struct msr_policy *mp = &hvm_def_cpu_policy;
 
-    *mp = hvm_max_msr_policy;
+    *mp = hvm_max_cpu_policy;
 }
 
 void __init init_guest_msr_policy(void)
@@ -135,8 +125,8 @@ void __init init_guest_msr_policy(void)
 int init_domain_msr_policy(struct domain *d)
 {
     struct msr_policy *mp = is_pv_domain(d)
-        ? (IS_ENABLED(CONFIG_PV)  ?  &pv_def_msr_policy : NULL)
-        : (IS_ENABLED(CONFIG_HVM) ? &hvm_def_msr_policy : NULL);
+        ? (IS_ENABLED(CONFIG_PV)  ?  &pv_def_cpu_policy : NULL)
+        : (IS_ENABLED(CONFIG_HVM) ? &hvm_def_cpu_policy : NULL);
 
     if ( !mp )
     {
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 3ed7c69f4315..3b2efecede2f 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -30,38 +30,7 @@
 #include <xen/cpu.h>
 #include <xsm/xsm.h>
 #include <asm/psr.h>
-#include <asm/cpuid.h>
-
-const struct old_cpu_policy system_policies[6] = {
-    [ XEN_SYSCTL_cpu_policy_raw ] = {
-        &raw_cpuid_policy,
-        &raw_msr_policy,
-    },
-    [ XEN_SYSCTL_cpu_policy_host ] = {
-        &host_cpuid_policy,
-        &host_msr_policy,
-    },
-#ifdef CONFIG_PV
-    [ XEN_SYSCTL_cpu_policy_pv_max ] = {
-        &pv_max_cpuid_policy,
-        &pv_max_msr_policy,
-    },
-    [ XEN_SYSCTL_cpu_policy_pv_default ] = {
-        &pv_def_cpuid_policy,
-        &pv_def_msr_policy,
-    },
-#endif
-#ifdef CONFIG_HVM
-    [ XEN_SYSCTL_cpu_policy_hvm_max ] = {
-        &hvm_max_cpuid_policy,
-        &hvm_max_msr_policy,
-    },
-    [ XEN_SYSCTL_cpu_policy_hvm_default ] = {
-        &hvm_def_cpuid_policy,
-        &hvm_def_msr_policy,
-    },
-#endif
-};
+#include <asm/cpu-policy.h>
 
 struct l3_cache_info {
     int ret;
@@ -327,15 +296,15 @@ long arch_do_sysctl(
     case XEN_SYSCTL_get_cpu_featureset:
     {
         static const struct cpuid_policy *const policy_table[6] = {
-            [XEN_SYSCTL_cpu_featureset_raw]  = &raw_cpuid_policy,
-            [XEN_SYSCTL_cpu_featureset_host] = &host_cpuid_policy,
+            [XEN_SYSCTL_cpu_featureset_raw]     = &raw_cpu_policy,
+            [XEN_SYSCTL_cpu_featureset_host]    = &host_cpu_policy,
 #ifdef CONFIG_PV
-            [XEN_SYSCTL_cpu_featureset_pv]   = &pv_def_cpuid_policy,
-            [XEN_SYSCTL_cpu_featureset_pv_max] = &pv_max_cpuid_policy,
+            [XEN_SYSCTL_cpu_featureset_pv]      = &pv_def_cpu_policy,
+            [XEN_SYSCTL_cpu_featureset_pv_max]  = &pv_max_cpu_policy,
 #endif
 #ifdef CONFIG_HVM
-            [XEN_SYSCTL_cpu_featureset_hvm]  = &hvm_def_cpuid_policy,
-            [XEN_SYSCTL_cpu_featureset_hvm_max] = &hvm_max_cpuid_policy,
+            [XEN_SYSCTL_cpu_featureset_hvm]     = &hvm_def_cpu_policy,
+            [XEN_SYSCTL_cpu_featureset_hvm_max] = &hvm_max_cpu_policy,
 #endif
         };
         const struct cpuid_policy *p = NULL;
@@ -391,7 +360,19 @@ long arch_do_sysctl(
 
     case XEN_SYSCTL_get_cpu_policy:
     {
-        const struct old_cpu_policy *policy;
+        static const struct cpu_policy *system_policies[6] = {
+            [XEN_SYSCTL_cpu_policy_raw]         = &raw_cpu_policy,
+            [XEN_SYSCTL_cpu_policy_host]        = &host_cpu_policy,
+#ifdef CONFIG_PV
+            [XEN_SYSCTL_cpu_policy_pv_max]      = &pv_max_cpu_policy,
+            [XEN_SYSCTL_cpu_policy_pv_default]  = &pv_def_cpu_policy,
+#endif
+#ifdef CONFIG_HVM
+            [XEN_SYSCTL_cpu_policy_hvm_max]     = &hvm_max_cpu_policy,
+            [XEN_SYSCTL_cpu_policy_hvm_default] = &hvm_def_cpu_policy,
+#endif
+        };
+        const struct cpu_policy *policy;
 
         /* Reserved field set, or bad policy index? */
         if ( sysctl->u.cpu_policy._rsvd ||
@@ -400,11 +381,11 @@ long arch_do_sysctl(
             ret = -EINVAL;
             break;
         }
-        policy = &system_policies[
+        policy = system_policies[
             array_index_nospec(sysctl->u.cpu_policy.index,
                                ARRAY_SIZE(system_policies))];
 
-        if ( !policy->cpuid || !policy->msr )
+        if ( !policy )
         {
             ret = -EOPNOTSUPP;
             break;
@@ -414,7 +395,7 @@ long arch_do_sysctl(
         if ( guest_handle_is_null(sysctl->u.cpu_policy.leaves) )
             sysctl->u.cpu_policy.nr_leaves = CPUID_MAX_SERIALISED_LEAVES;
         else if ( (ret = x86_cpuid_copy_to_buffer(
-                       policy->cpuid,
+                       policy,
                        sysctl->u.cpu_policy.leaves,
                        &sysctl->u.cpu_policy.nr_leaves)) )
             break;
@@ -430,7 +411,7 @@ long arch_do_sysctl(
         if ( guest_handle_is_null(sysctl->u.cpu_policy.msrs) )
             sysctl->u.cpu_policy.nr_msrs = MSR_MAX_SERIALISED_ENTRIES;
         else if ( (ret = x86_msr_copy_to_buffer(
-                       policy->msr,
+                       policy,
                        sysctl->u.cpu_policy.msrs,
                        &sysctl->u.cpu_policy.nr_msrs)) )
             break;
-- 
2.30.2


