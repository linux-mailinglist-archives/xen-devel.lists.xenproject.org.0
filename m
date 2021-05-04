Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7273731F3
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 23:33:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122722.231489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1le2dq-0000ec-5A; Tue, 04 May 2021 21:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122722.231489; Tue, 04 May 2021 21:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1le2dq-0000eD-1X; Tue, 04 May 2021 21:31:42 +0000
Received: by outflank-mailman (input) for mailman id 122722;
 Tue, 04 May 2021 21:31:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Poa=J7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1le2do-0000e8-JO
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 21:31:40 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 23da2c29-fc50-4385-afbb-46e6f4840b6a;
 Tue, 04 May 2021 21:31:39 +0000 (UTC)
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
X-Inumbo-ID: 23da2c29-fc50-4385-afbb-46e6f4840b6a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620163898;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iN1qtu5eTkaQjuDskxiwa8CLM7Iy3U/d+exGSEFZ19E=;
  b=QLoWXeoHAwgk5AMSJMcMhagoxoKDC3eh2oNPg/xG7wfURgqhKBDpxD5a
   dfnmsARE2gqGRfct/pzmqcOBshtogh6qYCgupVO9hsYSYUdR/vTqdi0J0
   LZMF/u7iKyG3a2y1Xjm72d1NGaZ+F4hVLcrvt4YZkCPDUgoXoCS2avtuS
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: PwvmcrGaVqCWE91Y1AP4NeRQoNLeqbubh6VFpJiiqWIZ84KydYhUbLPFvrCFBOCiRgwZZxzTw+
 fRr4vKJKRkQglFqPqOJYAvCTtiPQ7XkEIxpKQugj6BdsxG78ya0y+z2iZKuAeHaK4wzXbrkvyw
 /r4nSRgml5RX4VB8w29DCtOsRoE+pF32lwGhM5Plm7MI3NVRfKZzvjGah8w9sBqJExpDCLz9XI
 f24Jg8YLLzLyPBFacNX1hAz6wXYGxmkBugfaJzGzM0GSG2G7LpuUbEK1o7XuBt0JhOg+xXveTi
 m1A=
X-SBRS: 5.1
X-MesageID: 42875491
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:A3qW86sXVK3aAbxvGaFOXU5E7skDkNV00zAX/kB9WHVpW+az/v
 rOoN0w0xjohDENHEw6kdebN6WaBV/a/5h54Y4eVI3SOjXOkm2uMY1k8M/e0yTtcheOkdJ1+K
 98f8FFeb7NJHdgi8KS2maFOvIB5PXCz6yyn+fZyB5WPGVXQoVt9R1wBAreMmAefnglObMDGJ
 CR5tVKqlObEBx9BKnWOlA/U/XevNqOrZr6YHc9dmcawTOThjCl4qOSKXil9yoZOgkg/Z4StU
 zMkwn0/cyYwpSG9iM=
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="42875491"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] libx86: Introduce x86_cpu_policy_calculate_compatible() with MSR_ARCH_CAPS handling
Date: Tue, 4 May 2021 22:31:20 +0100
Message-ID: <20210504213120.4179-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Just as with x86_cpu_policies_are_compatible(), make a start on this function
with some token handling.

Add levelling support for MSR_ARCH_CAPS, because RSBA has interesting
properties, and introduce test_calculate_compatible_success() to the unit
tests, covering various cases where the arch_caps CPUID bit falls out, and
with RSBA accumulating rather than intersecting across the two.

Extend x86_cpu_policies_are_compatible() with a check for MSR_ARCH_CAPS, which
was arguably missing from c/s e32605b07ef "x86: Begin to introduce support for
MSR_ARCH_CAPS".

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/include/xen-tools/libs.h           |   5 ++
 tools/tests/cpu-policy/test-cpu-policy.c | 150 +++++++++++++++++++++++++++++++
 xen/include/xen/lib/x86/cpu-policy.h     |  22 +++++
 xen/lib/x86/policy.c                     |  47 ++++++++++
 4 files changed, 224 insertions(+)

diff --git a/tools/include/xen-tools/libs.h b/tools/include/xen-tools/libs.h
index a16e0c3807..4de10efdea 100644
--- a/tools/include/xen-tools/libs.h
+++ b/tools/include/xen-tools/libs.h
@@ -63,4 +63,9 @@
 #define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))-1))
 #endif
 
+#ifndef _AC
+#define __AC(X, Y)   (X ## Y)
+#define _AC(X, Y)    __AC(X, Y)
+#endif
+
 #endif	/* __XEN_TOOLS_LIBS__ */
diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index 75973298df..455b4fe3c0 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -775,6 +775,154 @@ static void test_is_compatible_failure(void)
     }
 }
 
+static void test_calculate_compatible_success(void)
+{
+    static struct test {
+        const char *name;
+        struct {
+            struct cpuid_policy p;
+            struct msr_policy m;
+        } a, b, out;
+    } tests[] = {
+        {
+            "arch_caps, b short max_leaf",
+            .a = {
+                .p.basic.max_leaf = 7,
+                .p.feat.arch_caps = true,
+                .m.arch_caps.rdcl_no = true,
+            },
+            .b = {
+                .p.basic.max_leaf = 6,
+                .p.feat.arch_caps = true,
+                .m.arch_caps.rdcl_no = true,
+            },
+            .out = {
+                .p.basic.max_leaf = 6,
+            },
+        },
+        {
+            "arch_caps, b feat missing",
+            .a = {
+                .p.basic.max_leaf = 7,
+                .p.feat.arch_caps = true,
+                .m.arch_caps.rdcl_no = true,
+            },
+            .b = {
+                .p.basic.max_leaf = 7,
+                .m.arch_caps.rdcl_no = true,
+            },
+            .out = {
+                .p.basic.max_leaf = 7,
+            },
+        },
+        {
+            "arch_caps, b rdcl_no missing",
+            .a = {
+                .p.basic.max_leaf = 7,
+                .p.feat.arch_caps = true,
+                .m.arch_caps.rdcl_no = true,
+            },
+            .b = {
+                .p.basic.max_leaf = 7,
+                .p.feat.arch_caps = true,
+            },
+            .out = {
+                .p.basic.max_leaf = 7,
+                .p.feat.arch_caps = true,
+            },
+        },
+        {
+            "arch_caps, rdcl_no ok",
+            .a = {
+                .p.basic.max_leaf = 7,
+                .p.feat.arch_caps = true,
+                .m.arch_caps.rdcl_no = true,
+            },
+            .b = {
+                .p.basic.max_leaf = 7,
+                .p.feat.arch_caps = true,
+                .m.arch_caps.rdcl_no = true,
+            },
+            .out = {
+                .p.basic.max_leaf = 7,
+                .p.feat.arch_caps = true,
+                .m.arch_caps.rdcl_no = true,
+            },
+        },
+        {
+            "arch_caps, rsba accum",
+            .a = {
+                .p.basic.max_leaf = 7,
+                .p.feat.arch_caps = true,
+                .m.arch_caps.rsba = true,
+            },
+            .b = {
+                .p.basic.max_leaf = 7,
+                .p.feat.arch_caps = true,
+            },
+            .out = {
+                .p.basic.max_leaf = 7,
+                .p.feat.arch_caps = true,
+                .m.arch_caps.rsba = true,
+            },
+        },
+    };
+    struct cpu_policy_errors no_errors = INIT_CPU_POLICY_ERRORS;
+
+    printf("Testing calculate compatibility success:\n");
+
+    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
+    {
+        struct test *t = &tests[i];
+        struct cpuid_policy *p = malloc(sizeof(struct cpuid_policy));
+        struct msr_policy *m = malloc(sizeof(struct msr_policy));
+        struct cpu_policy a = {
+            &t->a.p,
+            &t->a.m,
+        }, b = {
+            &t->b.p,
+            &t->b.m,
+        }, out = {
+            p,
+            m,
+        };
+        struct cpu_policy_errors e;
+        int res;
+
+        if ( !p || !m )
+            err(1, "%s() malloc failure", __func__);
+
+        res = x86_cpu_policy_calculate_compatible(&a, &b, &out, &e);
+
+        /* Check the expected error output. */
+        if ( res != 0 || memcmp(&no_errors, &e, sizeof(no_errors)) )
+        {
+            fail("  Test '%s' expected no errors\n"
+                 "    got res %d { leaf %08x, subleaf %08x, msr %08x }\n",
+                 t->name, res, e.leaf, e.subleaf, e.msr);
+            goto test_done;
+        }
+
+        if ( memcmp(&t->out.p, p, sizeof(*p)) )
+        {
+            fail("  Test '%s' resulting CPUID policy not as expected\n",
+                 t->name);
+            goto test_done;
+        }
+
+        if ( memcmp(&t->out.m, m, sizeof(*m)) )
+        {
+            fail("  Test '%s' resulting MSR policy not as expected\n",
+                 t->name);
+            goto test_done;
+        }
+
+    test_done:
+        free(p);
+        free(m);
+    }
+}
+
 int main(int argc, char **argv)
 {
     printf("CPU Policy unit tests\n");
@@ -793,6 +941,8 @@ int main(int argc, char **argv)
     test_is_compatible_success();
     test_is_compatible_failure();
 
+    test_calculate_compatible_success();
+
     if ( nr_failures )
         printf("Done: %u failures\n", nr_failures);
     else
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index 5a2c4c7b2d..0422a15557 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -37,6 +37,28 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
                                     const struct cpu_policy *guest,
                                     struct cpu_policy_errors *err);
 
+/*
+ * Given two policies, calculate one which is compatible with each.
+ *
+ * i.e. Given host @a and host @b, calculate what to give a VM so it can live
+ * migrate between the two.
+ *
+ * @param a        A cpu_policy.
+ * @param b        Another cpu_policy.
+ * @param out      A policy compatible with @a and @b.
+ * @param err      Optional hint for error diagnostics.
+ * @returns -errno
+ *
+ * For typical usage, @a and @b should be system policies of the same type
+ * (i.e. PV/HVM default/max) from different hosts.  In the case that an
+ * incompatibility is detected, the optional err pointer may identify the
+ * problematic leaf/subleaf and/or MSR.
+ */
+int x86_cpu_policy_calculate_compatible(const struct cpu_policy *a,
+                                        const struct cpu_policy *b,
+                                        struct cpu_policy *out,
+                                        struct cpu_policy_errors *err);
+
 #endif /* !XEN_LIB_X86_POLICIES_H */
 
 /*
diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
index f6cea4e2f9..06039e8aa8 100644
--- a/xen/lib/x86/policy.c
+++ b/xen/lib/x86/policy.c
@@ -29,6 +29,9 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
     if ( ~host->msr->platform_info.raw & guest->msr->platform_info.raw )
         FAIL_MSR(MSR_INTEL_PLATFORM_INFO);
 
+    if ( ~host->msr->arch_caps.raw & guest->msr->arch_caps.raw )
+        FAIL_MSR(MSR_ARCH_CAPABILITIES);
+
 #undef FAIL_MSR
 #undef FAIL_CPUID
 #undef NA
@@ -43,6 +46,50 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
     return ret;
 }
 
+int x86_cpu_policy_calculate_compatible(const struct cpu_policy *a,
+                                        const struct cpu_policy *b,
+                                        struct cpu_policy *out,
+                                        struct cpu_policy_errors *err)
+{
+    const struct cpuid_policy *ap = a->cpuid, *bp = b->cpuid;
+    const struct msr_policy *am = a->msr, *bm = b->msr;
+    struct cpuid_policy *cp = out->cpuid;
+    struct msr_policy *mp = out->msr;
+
+    memset(cp, 0, sizeof(*cp));
+    memset(mp, 0, sizeof(*mp));
+
+    cp->basic.max_leaf = min(ap->basic.max_leaf, bp->basic.max_leaf);
+
+    if ( cp->basic.max_leaf >= 7 )
+    {
+        cp->feat.max_subleaf = min(ap->feat.max_subleaf, bp->feat.max_subleaf);
+
+        cp->feat.raw[0].b = ap->feat.raw[0].b & bp->feat.raw[0].b;
+        cp->feat.raw[0].c = ap->feat.raw[0].c & bp->feat.raw[0].c;
+        cp->feat.raw[0].d = ap->feat.raw[0].d & bp->feat.raw[0].d;
+    }
+
+    /* TODO: Far more. */
+
+    mp->platform_info.raw = am->platform_info.raw & bm->platform_info.raw;
+
+    if ( cp->feat.arch_caps )
+    {
+        /*
+         * RSBA means "RSB Alternative", i.e. RSB stuffing not necesserily
+         * safe.  It needs to accumulate rather than intersect across a
+         * resource pool.
+         */
+#define POL_MASK ARCH_CAPS_RSBA
+        mp->arch_caps.raw = ((am->arch_caps.raw ^ POL_MASK) &
+                             (bm->arch_caps.raw ^ POL_MASK)) ^ POL_MASK;
+#undef POL_MASK
+    }
+
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.11.0


