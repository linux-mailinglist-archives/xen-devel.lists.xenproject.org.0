Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7A16CF4C3
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 22:52:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516350.800342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phclt-0006Ow-N4; Wed, 29 Mar 2023 20:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516350.800342; Wed, 29 Mar 2023 20:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phclt-0006MD-Jb; Wed, 29 Mar 2023 20:51:53 +0000
Received: by outflank-mailman (input) for mailman id 516350;
 Wed, 29 Mar 2023 20:51:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PU7e=7V=citrix.com=prvs=445237bd4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1phcls-0005Jv-IC
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 20:51:52 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 859ad8a9-ce73-11ed-b464-930f4c7d94ae;
 Wed, 29 Mar 2023 22:51:49 +0200 (CEST)
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
X-Inumbo-ID: 859ad8a9-ce73-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680123108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Mqm7QCo3n2EwRQAGYx14tifW4C01FUu/01xeUdpee00=;
  b=LoFUlaNF4RFtjoQAzHrB7ikb6oYcQvYLGTkKBF5vOjw92mv2ca+UHNdT
   83ofLNC0AEURVPAbhkiEStWRUBH5eQWK72L2xied++5jbGmbzr6wGP4WZ
   4ww1JKElOu7xjhyytuYgpQUbgiWOKf10p1pljbpxwb6ue/qL9UEvzDWL1
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103989105
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:84F7lquryR7gWwoqDEdULTk2bufnVCxeMUV32f8akzHdYApBsoF/q
 tZmKW6POffbNjP1ctkgb4ix9E1T75aGzNNqHQdp+X1gQixE+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASExiFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwBSEETSi7itOP8OyUTchupt0cdpH6BdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw/
 zqdrjSoW0lHXDCZ4Si740ucnf7vpDP2VpkYCYSi8KZyo3TGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8UYwgyQzqvf4y6CG3MJCDVGbbQOq8seVTEsk
 FiTkLvU6SdH6ePPDyjHr/HN8G30YHJORYMfWcMaZSYU6vrbmIwCtyKRYdFCEo6ssYetCAill
 lhmsxMCa6UvYd8jjvvkrAGX027w9vAlXSZuuFyJAzvNAhdRIdf8Otf2sQWzAeNodt7xc7WXg
 JQTdyFyBsgqBIrFqiGCSf5l8FqBt6fca220bbKC8vAcG9WRF52LJ9o4DMlWfhsBDyr9UWaBj
 LXvkQ1Q/oRPG3ChcLV6ZYm8Y+xzk/i4TI25CK+KPoQQCnSUSONh1Hs2DaJ39z6FraTRuftnZ
 cfznTiEVh729piLPBLpHrxAgNfHNwg1xH/JRICT8ilLJYG2PSbPIZ9caQvmUwzMxP/cyOkj2
 4oFZpTiJtQ2eLGWXxQ7BqZIcwBXciRjXMivwyGVH8baSjdb9KgaI6e56dscl0ZNxsy5Ss+gE
 qmBZ3Jl
IronPort-HdrOrdr: A9a23:l+k576gxorRVfXO5vD4lV1r8r3BQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-IronPort-AV: E=Sophos;i="5.98,301,1673931600"; 
   d="scan'208";a="103989105"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 4/9] x86: Merge struct msr_policy into struct cpu_policy
Date: Wed, 29 Mar 2023 21:51:32 +0100
Message-ID: <20230329205137.323253-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230329205137.323253-1-andrew.cooper3@citrix.com>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

As with the cpuid side, use a temporary define to make struct msr_policy still
work.

Note, this means that domains now have two separate struct cpu_policy
allocations with disjoint information, and system policies are in a similar
position.  Both will be deduplicated in the following patches.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/fuzz/cpu-policy/afl-policy-fuzzer.c |   1 -
 xen/arch/x86/include/asm/msr.h            |   3 +-
 xen/include/xen/lib/x86/cpu-policy.h      |  81 ++++++++++++++++-
 xen/include/xen/lib/x86/msr.h             | 104 ----------------------
 xen/lib/x86/msr.c                         |   2 +-
 5 files changed, 83 insertions(+), 108 deletions(-)
 delete mode 100644 xen/include/xen/lib/x86/msr.h

diff --git a/tools/fuzz/cpu-policy/afl-policy-fuzzer.c b/tools/fuzz/cpu-policy/afl-policy-fuzzer.c
index 79e42e8bfd04..0ce3d8e16626 100644
--- a/tools/fuzz/cpu-policy/afl-policy-fuzzer.c
+++ b/tools/fuzz/cpu-policy/afl-policy-fuzzer.c
@@ -10,7 +10,6 @@
 
 #include <xen-tools/common-macros.h>
 #include <xen/lib/x86/cpu-policy.h>
-#include <xen/lib/x86/msr.h>
 #include <xen/domctl.h>
 
 static bool debug;
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 7946b6b24c11..02eddd919c27 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -6,8 +6,9 @@
 #include <xen/types.h>
 #include <xen/percpu.h>
 #include <xen/errno.h>
+#include <xen/kernel.h>
 
-#include <xen/lib/x86/msr.h>
+#include <xen/lib/x86/cpu-policy.h>
 
 #include <asm/asm_defns.h>
 #include <asm/cpufeature.h>
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index 5e430d848021..5af756a02da0 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -3,7 +3,6 @@
 #define XEN_LIB_X86_POLICIES_H
 
 #include <xen/lib/x86/cpuid-autogen.h>
-#include <xen/lib/x86/msr.h>
 
 #define FEATURESET_1d     0 /* 0x00000001.edx      */
 #define FEATURESET_1c     1 /* 0x00000001.ecx      */
@@ -107,6 +106,9 @@ const char *x86_cpuid_vendor_to_str(unsigned int vendor);
      CPUID_GUEST_NR_XSTATE - !!CPUID_GUEST_NR_XSTATE +  \
      CPUID_GUEST_NR_EXTD + 2 /* hv_limit and hv2_limit */ )
 
+/* Maximum number of MSRs written when serialising msr_policy. */
+#define MSR_MAX_SERIALISED_ENTRIES 2
+
 struct cpu_policy
 {
 #define DECL_BITFIELD(word) _DECL_BITFIELD(FEATURESET_ ## word)
@@ -324,6 +326,44 @@ struct cpu_policy
         };
     } extd;
 
+    /*
+     * 0x000000ce - MSR_INTEL_PLATFORM_INFO
+     *
+     * This MSR is non-architectural, but for simplicy we allow it to be read
+     * unconditionally.  CPUID Faulting support can be fully emulated for HVM
+     * guests so can be offered unconditionally, while support for PV guests
+     * is dependent on real hardware support.
+     */
+    union {
+        uint32_t raw;
+        struct {
+            uint32_t :31;
+            bool cpuid_faulting:1;
+        };
+    } platform_info;
+
+    /*
+     * 0x0000010a - MSR_ARCH_CAPABILITIES
+     *
+     * This is an Intel-only MSR, which provides miscellaneous enumeration,
+     * including those which indicate that microarchitectrual sidechannels are
+     * fixed in hardware.
+     */
+    union {
+        uint32_t raw;
+        struct {
+            bool rdcl_no:1;
+            bool ibrs_all:1;
+            bool rsba:1;
+            bool skip_l1dfl:1;
+            bool ssb_no:1;
+            bool mds_no:1;
+            bool if_pschange_mc_no:1;
+            bool tsx_ctrl:1;
+            bool taa_no:1;
+        };
+    } arch_caps;
+
 #undef __DECL_BITFIELD
 #undef _DECL_BITFIELD
 #undef DECL_BITFIELD
@@ -337,6 +377,7 @@ struct cpu_policy
 
 /* Temporary */
 #define cpuid_policy cpu_policy
+#define msr_policy cpu_policy
 
 struct old_cpu_policy
 {
@@ -438,9 +479,11 @@ void x86_cpuid_policy_clear_out_of_range_leaves(struct cpuid_policy *p);
 #ifdef __XEN__
 #include <public/arch-x86/xen.h>
 typedef XEN_GUEST_HANDLE_64(xen_cpuid_leaf_t) cpuid_leaf_buffer_t;
+typedef XEN_GUEST_HANDLE_64(xen_msr_entry_t) msr_entry_buffer_t;
 #else
 #include <xen/arch-x86/xen.h>
 typedef xen_cpuid_leaf_t cpuid_leaf_buffer_t[];
+typedef xen_msr_entry_t msr_entry_buffer_t[];
 #endif
 
 /**
@@ -480,6 +523,42 @@ int x86_cpuid_copy_from_buffer(struct cpuid_policy *policy,
                                uint32_t nr_entries, uint32_t *err_leaf,
                                uint32_t *err_subleaf);
 
+/**
+ * Serialise an msr_policy object into an array.
+ *
+ * @param policy     The msr_policy to serialise.
+ * @param msrs       The array of msrs to serialise into.
+ * @param nr_entries The number of entries in 'msrs'.
+ * @returns -errno
+ *
+ * Writes at most MSR_MAX_SERIALISED_ENTRIES.  May fail with -ENOBUFS if the
+ * buffer array is too short.  On success, nr_entries is updated with the
+ * actual number of msrs written.
+ */
+int x86_msr_copy_to_buffer(const struct msr_policy *policy,
+                           msr_entry_buffer_t msrs, uint32_t *nr_entries);
+
+/**
+ * Unserialise an msr_policy object from an array of msrs.
+ *
+ * @param policy     The msr_policy object to unserialise into.
+ * @param msrs       The array of msrs to unserialise from.
+ * @param nr_entries The number of entries in 'msrs'.
+ * @param err_msr    Optional hint for error diagnostics.
+ * @returns -errno
+ *
+ * Reads at most MSR_MAX_SERIALISED_ENTRIES.  May fail for a number of reasons
+ * based on the content in an individual 'msrs' entry, including the MSR index
+ * not being valid in the policy, the flags field being nonzero, or if the
+ * value provided would truncate when stored in the policy.  In such cases,
+ * the optional err_* pointer will identify the problematic MSR.
+ *
+ * No content validation is performed on the data stored in the policy object.
+ */
+int x86_msr_copy_from_buffer(struct msr_policy *policy,
+                             const msr_entry_buffer_t msrs, uint32_t nr_entries,
+                             uint32_t *err_msr);
+
 /*
  * Calculate whether two policies are compatible.
  *
diff --git a/xen/include/xen/lib/x86/msr.h b/xen/include/xen/lib/x86/msr.h
deleted file mode 100644
index 48ba4a59c036..000000000000
--- a/xen/include/xen/lib/x86/msr.h
+++ /dev/null
@@ -1,104 +0,0 @@
-/* Common data structures and functions consumed by hypervisor and toolstack */
-#ifndef XEN_LIB_X86_MSR_H
-#define XEN_LIB_X86_MSR_H
-
-/* Maximum number of MSRs written when serialising msr_policy. */
-#define MSR_MAX_SERIALISED_ENTRIES 2
-
-/* MSR policy object for shared per-domain MSRs */
-struct msr_policy
-{
-    /*
-     * 0x000000ce - MSR_INTEL_PLATFORM_INFO
-     *
-     * This MSR is non-architectural, but for simplicy we allow it to be read
-     * unconditionally.  CPUID Faulting support can be fully emulated for HVM
-     * guests so can be offered unconditionally, while support for PV guests
-     * is dependent on real hardware support.
-     */
-    union {
-        uint32_t raw;
-        struct {
-            uint32_t :31;
-            bool cpuid_faulting:1;
-        };
-    } platform_info;
-
-    /*
-     * 0x0000010a - MSR_ARCH_CAPABILITIES
-     *
-     * This is an Intel-only MSR, which provides miscellaneous enumeration,
-     * including those which indicate that microarchitectrual sidechannels are
-     * fixed in hardware.
-     */
-    union {
-        uint32_t raw;
-        struct {
-            bool rdcl_no:1;
-            bool ibrs_all:1;
-            bool rsba:1;
-            bool skip_l1dfl:1;
-            bool ssb_no:1;
-            bool mds_no:1;
-            bool if_pschange_mc_no:1;
-            bool tsx_ctrl:1;
-            bool taa_no:1;
-        };
-    } arch_caps;
-};
-
-#ifdef __XEN__
-#include <public/arch-x86/xen.h>
-typedef XEN_GUEST_HANDLE_64(xen_msr_entry_t) msr_entry_buffer_t;
-#else
-#include <xen/arch-x86/xen.h>
-typedef xen_msr_entry_t msr_entry_buffer_t[];
-#endif
-
-/**
- * Serialise an msr_policy object into an array.
- *
- * @param policy     The msr_policy to serialise.
- * @param msrs       The array of msrs to serialise into.
- * @param nr_entries The number of entries in 'msrs'.
- * @returns -errno
- *
- * Writes at most MSR_MAX_SERIALISED_ENTRIES.  May fail with -ENOBUFS if the
- * buffer array is too short.  On success, nr_entries is updated with the
- * actual number of msrs written.
- */
-int x86_msr_copy_to_buffer(const struct msr_policy *policy,
-                           msr_entry_buffer_t msrs, uint32_t *nr_entries);
-
-/**
- * Unserialise an msr_policy object from an array of msrs.
- *
- * @param policy     The msr_policy object to unserialise into.
- * @param msrs       The array of msrs to unserialise from.
- * @param nr_entries The number of entries in 'msrs'.
- * @param err_msr    Optional hint for error diagnostics.
- * @returns -errno
- *
- * Reads at most MSR_MAX_SERIALISED_ENTRIES.  May fail for a number of reasons
- * based on the content in an individual 'msrs' entry, including the MSR index
- * not being valid in the policy, the flags field being nonzero, or if the
- * value provided would truncate when stored in the policy.  In such cases,
- * the optional err_* pointer will identify the problematic MSR.
- *
- * No content validation is performed on the data stored in the policy object.
- */
-int x86_msr_copy_from_buffer(struct msr_policy *policy,
-                             const msr_entry_buffer_t msrs, uint32_t nr_entries,
-                             uint32_t *err_msr);
-
-#endif /* !XEN_LIB_X86_MSR_H */
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/lib/x86/msr.c b/xen/lib/x86/msr.c
index 7d71e92a380a..c4d885e7b568 100644
--- a/xen/lib/x86/msr.c
+++ b/xen/lib/x86/msr.c
@@ -1,6 +1,6 @@
 #include "private.h"
 
-#include <xen/lib/x86/msr.h>
+#include <xen/lib/x86/cpu-policy.h>
 
 /*
  * Copy a single MSR into the provided msr_entry_buffer_t buffer, performing a
-- 
2.30.2


