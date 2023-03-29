Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 930306CF4CC
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 22:52:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516351.800353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phclw-0006iy-1K; Wed, 29 Mar 2023 20:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516351.800353; Wed, 29 Mar 2023 20:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phclv-0006fG-Sr; Wed, 29 Mar 2023 20:51:55 +0000
Received: by outflank-mailman (input) for mailman id 516351;
 Wed, 29 Mar 2023 20:51:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PU7e=7V=citrix.com=prvs=445237bd4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1phclt-0005Jv-Qk
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 20:51:54 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86292ea5-ce73-11ed-b464-930f4c7d94ae;
 Wed, 29 Mar 2023 22:51:48 +0200 (CEST)
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
X-Inumbo-ID: 86292ea5-ce73-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680123108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zvhL6MDVp+UugXW+gKRectJQUjkcGArPimIjKtjWVf8=;
  b=ZOn44zS3oqlTpRxSMt66gx3pT5zMpnTexXqZVLPkUSM5nrPPVJyMn7a8
   QVM5eksohyTwEMr2n0sJQoNO/qRE7vRacuw2XqWwUKEiC2J7l9CBw3XQT
   O5bcIgYVKFJ1p0LZ3Z3fen53cYkHZNbuggTkOojJ4H4iLxNq47EfBcS0k
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103500085
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:PqQBc69KmrfMan8bTauXDrUD+n6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 mAaCGiGOPqINmPzKY8lO4Wwo09Q68eEyt9kHFY/+ys8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqoa5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklIx
 OMZJGkfUyyRvNmKnOyRUOc1o5kaeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0Mxh3F/
 jqerzmR7hcyPdKb7xq5q1+XrMjLpRvhB6QcC5aS6as/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJhZebPQ2uclwQiYlv
 mJlhPuwW2Yp6ufMDyvAqPHN92ja1TUpwXEqYx4bTAdc8eTfsroIsk6RZMxtSYvot4igcd3v+
 AxmvBTSlp1K05FahvXroQyX696/jsOXF1Bov207Skrgt1okP9D9OuRE/HCBtZ59wJClok5tV
 ZTus+yX96gwAJ6Ej0Rhq81dTejyt55p3NAx6GOD/qXNFBz3oRZPhagKvFlDyL5Ba67ogwPBb
 k7Joh9275ROJnasZqIfS9vvW5xzlPS+Soq1CK68gj9yjn5ZLlfvEMZGOyatM53FyhBwwcnTx
 7/AGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvueHwP9Dz+ieD2TCfMGd843K6mMrhRAFWs/F+Er
 L6y9qKil31ibQEJSnKJodNMcQhTdSFT6FKfg5U/S9Nv6zFOQAkJY8I9C5t4E2C5t8y5Ttv1w
 0w=
IronPort-HdrOrdr: A9a23:z/TMsKG0IC78w7Y4pLqELMeALOsnbusQ8zAXPiBKJCC9E/bo8v
 xG+c5w6faaslkssR0b9+xoW5PwI080l6QU3WB5B97LMDUO0FHCEGgI1/qA/9SPIUzDHu4279
 YbT0B9YueAcGSTW6zBkXWF+9VL+qj5zEix792uq0uE1WtRGtldBwESMHf9LmRGADNoKLAeD5
 Sm6s9Ot1ObCA8qhpTSPAhiYwDbzee77a7bXQ==
X-IronPort-AV: E=Sophos;i="5.98,301,1673931600"; 
   d="scan'208";a="103500085"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 9/9] RFC: Everything else
Date: Wed, 29 Mar 2023 21:51:37 +0100
Message-ID: <20230329205137.323253-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230329205137.323253-1-andrew.cooper3@citrix.com>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Looking at this diff, I'm wondering whether keeping

    union {
        struct cpu_policy *cpuid;
        struct cpu_policy *cpu_policy;
    };

permentantly might be a good idea, because d->arch.cpuid->$X reads rather
better than d->arch.cpu_policy->$X

Thoughts?

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/fuzz/cpu-policy/afl-policy-fuzzer.c     |  12 +-
 .../fuzz/x86_instruction_emulator/fuzz-emul.c |   2 +-
 tools/tests/cpu-policy/test-cpu-policy.c      |  10 +-
 tools/tests/x86_emulator/test_x86_emulator.c  |   2 +-
 tools/tests/x86_emulator/x86-emulate.c        |   2 +-
 xen/arch/x86/cpu/mcheck/mce_intel.c           |   2 +-
 xen/arch/x86/cpu/vpmu_intel.c                 |   4 +-
 xen/arch/x86/cpuid.c                          |  26 +--
 xen/arch/x86/domain.c                         |   2 +-
 xen/arch/x86/hvm/emulate.c                    |   2 +-
 xen/arch/x86/hvm/hvm.c                        |  38 ++--
 xen/arch/x86/hvm/ioreq.c                      |   4 +-
 xen/arch/x86/hvm/mtrr.c                       |   2 +-
 xen/arch/x86/hvm/svm/svm.c                    |  18 +-
 xen/arch/x86/hvm/svm/svmdebug.c               |   2 +-
 xen/arch/x86/hvm/vlapic.c                     |   2 +-
 xen/arch/x86/hvm/vmx/vmx.c                    |  12 +-
 xen/arch/x86/hvm/vmx/vvmx.c                   |   2 +-
 xen/arch/x86/include/asm/domain.h             |   5 +-
 xen/arch/x86/include/asm/guest_pt.h           |   4 +-
 xen/arch/x86/include/asm/msr.h                |   2 +-
 xen/arch/x86/include/asm/paging.h             |   2 +-
 xen/arch/x86/mm/shadow/hvm.c                  |   2 +-
 xen/arch/x86/msr.c                            |  24 +--
 xen/arch/x86/pv/domain.c                      |   2 +-
 xen/arch/x86/pv/emul-priv-op.c                |   6 +-
 xen/arch/x86/pv/ro-page-fault.c               |   2 +-
 xen/arch/x86/sysctl.c                         |   4 +-
 xen/arch/x86/traps.c                          |   2 +-
 xen/arch/x86/x86_emulate.c                    |   2 +-
 xen/arch/x86/x86_emulate/x86_emulate.c        | 166 +++++++++---------
 xen/arch/x86/x86_emulate/x86_emulate.h        |   4 +-
 xen/arch/x86/xstate.c                         |   4 +-
 xen/include/xen/lib/x86/cpu-policy.h          |  28 ++-
 xen/lib/x86/cpuid.c                           |  10 +-
 xen/lib/x86/msr.c                             |   4 +-
 36 files changed, 205 insertions(+), 212 deletions(-)

diff --git a/tools/fuzz/cpu-policy/afl-policy-fuzzer.c b/tools/fuzz/cpu-policy/afl-policy-fuzzer.c
index 0ce3d8e16626..58b4dbacf96b 100644
--- a/tools/fuzz/cpu-policy/afl-policy-fuzzer.c
+++ b/tools/fuzz/cpu-policy/afl-policy-fuzzer.c
@@ -16,9 +16,9 @@ static bool debug;
 
 #define EMPTY_LEAF ((struct cpuid_leaf){})
 
-static void check_cpuid(struct cpuid_policy *cp)
+static void check_cpuid(struct cpu_policy *cp)
 {
-    struct cpuid_policy new = {};
+    struct cpu_policy new = {};
     size_t data_end;
     xen_cpuid_leaf_t *leaves = malloc(CPUID_MAX_SERIALISED_LEAVES *
                                       sizeof(xen_cpuid_leaf_t));
@@ -76,9 +76,9 @@ static void check_cpuid(struct cpuid_policy *cp)
     free(leaves);
 }
 
-static void check_msr(struct msr_policy *mp)
+static void check_msr(struct cpu_policy *mp)
 {
-    struct msr_policy new = {};
+    struct cpu_policy new = {};
     xen_msr_entry_t *msrs = malloc(MSR_MAX_SERIALISED_ENTRIES *
                                    sizeof(xen_msr_entry_t));
     unsigned int nr = MSR_MAX_SERIALISED_ENTRIES;
@@ -144,8 +144,8 @@ int main(int argc, char **argv)
     while ( __AFL_LOOP(1000) )
 #endif
     {
-        struct cpuid_policy *cp = NULL;
-        struct msr_policy *mp = NULL;
+        struct cpu_policy *cp = NULL;
+        struct cpu_policy *mp = NULL;
 
         if ( fp != stdin )
         {
diff --git a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
index 966e46bee199..4885a68210d0 100644
--- a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
+++ b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
@@ -893,7 +893,7 @@ int LLVMFuzzerTestOneInput(const uint8_t *data_p, size_t size)
     struct x86_emulate_ctxt ctxt = {
         .data = &state,
         .regs = &input.regs,
-        .cpuid = &cp,
+        .cpu_policy = &cp,
         .addr_size = 8 * sizeof(void *),
         .sp_size = 8 * sizeof(void *),
     };
diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index 5b38702b1c62..a4ca07f33973 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -98,7 +98,7 @@ static bool msrs_are_sorted(const xen_msr_entry_t *entries, unsigned int nr)
 
 static void test_cpuid_current(void)
 {
-    struct cpuid_policy p;
+    struct cpu_policy p;
     xen_cpuid_leaf_t leaves[CPUID_MAX_SERIALISED_LEAVES];
     unsigned int nr = ARRAY_SIZE(leaves);
     int rc;
@@ -118,7 +118,7 @@ static void test_cpuid_current(void)
 static void test_cpuid_serialise_success(void)
 {
     static const struct test {
-        struct cpuid_policy p;
+        struct cpu_policy p;
         const char *name;
         unsigned int nr_leaves;
     } tests[] = {
@@ -242,7 +242,7 @@ static void test_cpuid_serialise_success(void)
 static void test_msr_serialise_success(void)
 {
     static const struct test {
-        struct msr_policy p;
+        struct cpu_policy p;
         const char *name;
         unsigned int nr_msrs;
     } tests[] = {
@@ -430,7 +430,7 @@ static void test_cpuid_out_of_range_clearing(void)
     static const struct test {
         const char *name;
         unsigned int nr_markers;
-        struct cpuid_policy p;
+        struct cpu_policy p;
     } tests[] = {
         {
             .name = "basic",
@@ -550,7 +550,7 @@ static void test_cpuid_out_of_range_clearing(void)
     for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
     {
         const struct test *t = &tests[i];
-        struct cpuid_policy *p = memdup(&t->p);
+        struct cpu_policy *p = memdup(&t->p);
         void *ptr;
         unsigned int nr_markers;
 
diff --git a/tools/tests/x86_emulator/test_x86_emulator.c b/tools/tests/x86_emulator/test_x86_emulator.c
index 31586f805726..7b7fbaaf45ec 100644
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -909,7 +909,7 @@ int main(int argc, char **argv)
 
     ctxt.regs = &regs;
     ctxt.force_writeback = 0;
-    ctxt.cpuid     = &cp;
+    ctxt.cpu_policy = &cp;
     ctxt.lma       = sizeof(void *) == 8;
     ctxt.addr_size = 8 * sizeof(void *);
     ctxt.sp_size   = 8 * sizeof(void *);
diff --git a/tools/tests/x86_emulator/x86-emulate.c b/tools/tests/x86_emulator/x86-emulate.c
index ea286d6ad87b..5ad282b57545 100644
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -38,7 +38,7 @@
 #define put_stub(stb) ((stb).addr = 0)
 
 uint32_t mxcsr_mask = 0x0000ffbf;
-struct cpuid_policy cp;
+struct cpu_policy cp;
 
 static char fpu_save_area[0x4000] __attribute__((__aligned__((64))));
 static bool use_xsave;
diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/mce_intel.c
index 301533722d1a..2f23f02923d2 100644
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -1008,7 +1008,7 @@ int vmce_intel_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
 
 int vmce_intel_rdmsr(const struct vcpu *v, uint32_t msr, uint64_t *val)
 {
-    const struct cpuid_policy *cp = v->domain->arch.cpuid;
+    const struct cpu_policy *cp = v->domain->arch.cpu_policy;
     unsigned int bank = msr - MSR_IA32_MC0_CTL2;
 
     switch ( msr )
diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index bcfa187a14b6..045f40dd582e 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -839,8 +839,8 @@ static int cf_check core2_vpmu_initialise(struct vcpu *v)
     u64 msr_content;
     static bool_t ds_warned;
 
-    if ( v->domain->arch.cpuid->basic.pmu_version <= 1 ||
-         v->domain->arch.cpuid->basic.pmu_version >= 6 )
+    if ( v->domain->arch.cpu_policy->basic.pmu_version <= 1 ||
+         v->domain->arch.cpu_policy->basic.pmu_version >= 6 )
         return -EINVAL;
 
     if ( (arch_pmc_cnt + fixed_pmc_cnt) == 0 )
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index df3e503ced9d..c7e268e14918 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -178,7 +178,7 @@ static void sanitise_featureset(uint32_t *fs)
     }
 }
 
-static void recalculate_xstate(struct cpuid_policy *p)
+static void recalculate_xstate(struct cpu_policy *p)
 {
     uint64_t xstates = XSTATE_FP_SSE;
     uint32_t xstate_size = XSTATE_AREA_MIN_SIZE;
@@ -256,7 +256,7 @@ static void recalculate_xstate(struct cpuid_policy *p)
  * Misc adjustments to the policy.  Mostly clobbering reserved fields and
  * duplicating shared fields.  Intentionally hidden fields are annotated.
  */
-static void recalculate_misc(struct cpuid_policy *p)
+static void recalculate_misc(struct cpu_policy *p)
 {
     p->basic.raw_fms &= 0x0fff0fff; /* Clobber Processor Type on Intel. */
     p->basic.apic_id = 0; /* Dynamic. */
@@ -334,7 +334,7 @@ static void recalculate_misc(struct cpuid_policy *p)
 
 static void __init calculate_raw_policy(void)
 {
-    struct cpuid_policy *p = &raw_cpu_policy;
+    struct cpu_policy *p = &raw_cpu_policy;
 
     x86_cpuid_policy_fill_native(p);
 
@@ -344,7 +344,7 @@ static void __init calculate_raw_policy(void)
 
 static void __init calculate_host_policy(void)
 {
-    struct cpuid_policy *p = &host_cpu_policy;
+    struct cpu_policy *p = &host_cpu_policy;
     unsigned int max_extd_leaf;
 
     *p = raw_cpu_policy;
@@ -445,7 +445,7 @@ static void __init guest_common_feature_adjustments(uint32_t *fs)
 
 static void __init calculate_pv_max_policy(void)
 {
-    struct cpuid_policy *p = &pv_max_cpu_policy;
+    struct cpu_policy *p = &pv_max_cpu_policy;
     uint32_t pv_featureset[FSCAPINTS];
     unsigned int i;
 
@@ -476,7 +476,7 @@ static void __init calculate_pv_max_policy(void)
 
 static void __init calculate_pv_def_policy(void)
 {
-    struct cpuid_policy *p = &pv_def_cpu_policy;
+    struct cpu_policy *p = &pv_def_cpu_policy;
     uint32_t pv_featureset[FSCAPINTS];
     unsigned int i;
 
@@ -496,7 +496,7 @@ static void __init calculate_pv_def_policy(void)
 
 static void __init calculate_hvm_max_policy(void)
 {
-    struct cpuid_policy *p = &hvm_max_cpu_policy;
+    struct cpu_policy *p = &hvm_max_cpu_policy;
     uint32_t hvm_featureset[FSCAPINTS];
     unsigned int i;
     const uint32_t *hvm_featuremask;
@@ -587,7 +587,7 @@ static void __init calculate_hvm_max_policy(void)
 
 static void __init calculate_hvm_def_policy(void)
 {
-    struct cpuid_policy *p = &hvm_def_cpu_policy;
+    struct cpu_policy *p = &hvm_def_cpu_policy;
     uint32_t hvm_featureset[FSCAPINTS];
     unsigned int i;
     const uint32_t *hvm_featuremask;
@@ -658,8 +658,8 @@ bool recheck_cpu_features(unsigned int cpu)
 
 void recalculate_cpuid_policy(struct domain *d)
 {
-    struct cpuid_policy *p = d->arch.cpuid;
-    const struct cpuid_policy *max = is_pv_domain(d)
+    struct cpu_policy *p = d->arch.cpu_policy;
+    const struct cpu_policy *max = is_pv_domain(d)
         ? (IS_ENABLED(CONFIG_PV)  ?  &pv_max_cpu_policy : NULL)
         : (IS_ENABLED(CONFIG_HVM) ? &hvm_max_cpu_policy : NULL);
     uint32_t fs[FSCAPINTS], max_fs[FSCAPINTS];
@@ -786,7 +786,7 @@ void recalculate_cpuid_policy(struct domain *d)
 
 void __init init_dom0_cpuid_policy(struct domain *d)
 {
-    struct cpuid_policy *p = d->arch.cpuid;
+    struct cpu_policy *p = d->arch.cpu_policy;
 
     /* dom0 can't migrate.  Give it ITSC if available. */
     if ( cpu_has_itsc )
@@ -824,7 +824,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
                  uint32_t subleaf, struct cpuid_leaf *res)
 {
     const struct domain *d = v->domain;
-    const struct cpuid_policy *p = d->arch.cpuid;
+    const struct cpu_policy *p = d->arch.cpu_policy;
 
     *res = EMPTY_LEAF;
 
@@ -1199,7 +1199,7 @@ static void __init __maybe_unused build_assertions(void)
     BUILD_BUG_ON(ARRAY_SIZE(deep_features) != FSCAPINTS);
 
     /* Find some more clever allocation scheme if this trips. */
-    BUILD_BUG_ON(sizeof(struct cpuid_policy) > PAGE_SIZE);
+    BUILD_BUG_ON(sizeof(struct cpu_policy) > PAGE_SIZE);
 
     BUILD_BUG_ON(sizeof(raw_cpu_policy.basic) !=
                  sizeof(raw_cpu_policy.basic.raw));
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 7cf66aee042c..c628619ead2c 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -283,7 +283,7 @@ void update_guest_memory_policy(struct vcpu *v,
 
 void domain_cpu_policy_changed(struct domain *d)
 {
-    const struct cpuid_policy *p = d->arch.cpuid;
+    const struct cpu_policy *p = d->arch.cpu_policy;
     struct vcpu *v;
 
     if ( is_pv_domain(d) )
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 95364deb1996..53f58c805185 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2846,7 +2846,7 @@ void hvm_emulate_init_once(
 
     hvmemul_ctxt->validate = validate;
     hvmemul_ctxt->ctxt.regs = regs;
-    hvmemul_ctxt->ctxt.cpuid = curr->domain->arch.cpuid;
+    hvmemul_ctxt->ctxt.cpu_policy = curr->domain->arch.cpu_policy;
     hvmemul_ctxt->ctxt.force_writeback = true;
 }
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index d326fa1c0136..0cf1b483dbbe 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -925,7 +925,7 @@ const char *hvm_efer_valid(const struct vcpu *v, uint64_t value,
                            signed int cr0_pg)
 {
     const struct domain *d = v->domain;
-    const struct cpuid_policy *p = d->arch.cpuid;
+    const struct cpu_policy *p = d->arch.cpu_policy;
 
     if ( value & ~EFER_KNOWN_MASK )
         return "Unknown bits set";
@@ -962,7 +962,7 @@ const char *hvm_efer_valid(const struct vcpu *v, uint64_t value,
 /* These bits in CR4 can be set by the guest. */
 unsigned long hvm_cr4_guest_valid_bits(const struct domain *d)
 {
-    const struct cpuid_policy *p = d->arch.cpuid;
+    const struct cpu_policy *p = d->arch.cpu_policy;
     bool mce, vmxe, cet;
 
     /* Logic broken out simply to aid readability below. */
@@ -1040,7 +1040,7 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
         return -EINVAL;
     }
 
-    if ( ctxt.cr3 >> d->arch.cpuid->extd.maxphysaddr )
+    if ( ctxt.cr3 >> d->arch.cpu_policy->extd.maxphysaddr )
     {
         printk(XENLOG_G_ERR "HVM%d restore: bad CR3 %#" PRIx64 "\n",
                d->domain_id, ctxt.cr3);
@@ -1418,7 +1418,7 @@ static int cf_check hvm_save_cpu_msrs(struct vcpu *v, hvm_domain_context_t *h)
         switch ( msr )
         {
         case MSR_SPEC_CTRL:
-            val &= msr_spec_ctrl_valid_bits(d->arch.cpuid);
+            val &= msr_spec_ctrl_valid_bits(d->arch.cpu_policy);
             break;
         }
 
@@ -2397,7 +2397,7 @@ int hvm_set_cr3(unsigned long value, bool noflush, bool may_defer)
     struct vcpu *curr = current;
     struct domain *currd = curr->domain;
 
-    if ( value >> currd->arch.cpuid->extd.maxphysaddr )
+    if ( value >> currd->arch.cpu_policy->extd.maxphysaddr )
     {
         HVM_DBG_LOG(DBG_LEVEL_1,
                     "Attempt to set reserved CR3 bit(s): %lx", value);
@@ -2666,7 +2666,7 @@ bool hvm_vcpu_virtual_to_linear(
         else if ( last_byte > reg->limit )
             goto out; /* last byte is beyond limit */
         else if ( last_byte < offset &&
-                  v->domain->arch.cpuid->x86_vendor == X86_VENDOR_AMD )
+                  v->domain->arch.cpu_policy->x86_vendor == X86_VENDOR_AMD )
             goto out; /* access wraps */
     }
 
@@ -3554,12 +3554,12 @@ int hvm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
         break;
 
     case MSR_MTRRcap:
-        if ( !d->arch.cpuid->basic.mtrr )
+        if ( !d->arch.cpu_policy->basic.mtrr )
             goto gp_fault;
         *msr_content = v->arch.hvm.mtrr.mtrr_cap;
         break;
     case MSR_MTRRdefType:
-        if ( !d->arch.cpuid->basic.mtrr )
+        if ( !d->arch.cpu_policy->basic.mtrr )
             goto gp_fault;
         *msr_content = v->arch.hvm.mtrr.def_type |
                        MASK_INSR(v->arch.hvm.mtrr.enabled, MTRRdefType_E) |
@@ -3567,27 +3567,27 @@ int hvm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
                                  MTRRdefType_FE);
         break;
     case MSR_MTRRfix64K_00000:
-        if ( !d->arch.cpuid->basic.mtrr )
+        if ( !d->arch.cpu_policy->basic.mtrr )
             goto gp_fault;
         *msr_content = fixed_range_base[0];
         break;
     case MSR_MTRRfix16K_80000:
     case MSR_MTRRfix16K_A0000:
-        if ( !d->arch.cpuid->basic.mtrr )
+        if ( !d->arch.cpu_policy->basic.mtrr )
             goto gp_fault;
         index = msr - MSR_MTRRfix16K_80000;
         *msr_content = fixed_range_base[array_index_nospec(index + 1,
                                    ARRAY_SIZE(v->arch.hvm.mtrr.fixed_ranges))];
         break;
     case MSR_MTRRfix4K_C0000...MSR_MTRRfix4K_F8000:
-        if ( !d->arch.cpuid->basic.mtrr )
+        if ( !d->arch.cpu_policy->basic.mtrr )
             goto gp_fault;
         index = msr - MSR_MTRRfix4K_C0000;
         *msr_content = fixed_range_base[array_index_nospec(index + 3,
                                    ARRAY_SIZE(v->arch.hvm.mtrr.fixed_ranges))];
         break;
     case MSR_IA32_MTRR_PHYSBASE(0)...MSR_IA32_MTRR_PHYSMASK(MTRR_VCNT_MAX - 1):
-        if ( !d->arch.cpuid->basic.mtrr )
+        if ( !d->arch.cpu_policy->basic.mtrr )
             goto gp_fault;
         index = msr - MSR_IA32_MTRR_PHYSBASE(0);
         if ( (index / 2) >=
@@ -3693,14 +3693,14 @@ int hvm_msr_write_intercept(unsigned int msr, uint64_t msr_content,
         goto gp_fault;
 
     case MSR_MTRRdefType:
-        if ( !d->arch.cpuid->basic.mtrr )
+        if ( !d->arch.cpu_policy->basic.mtrr )
             goto gp_fault;
         if ( !mtrr_def_type_msr_set(v->domain, &v->arch.hvm.mtrr,
                                     msr_content) )
            goto gp_fault;
         break;
     case MSR_MTRRfix64K_00000:
-        if ( !d->arch.cpuid->basic.mtrr )
+        if ( !d->arch.cpu_policy->basic.mtrr )
             goto gp_fault;
         if ( !mtrr_fix_range_msr_set(v->domain, &v->arch.hvm.mtrr, 0,
                                      msr_content) )
@@ -3708,7 +3708,7 @@ int hvm_msr_write_intercept(unsigned int msr, uint64_t msr_content,
         break;
     case MSR_MTRRfix16K_80000:
     case MSR_MTRRfix16K_A0000:
-        if ( !d->arch.cpuid->basic.mtrr )
+        if ( !d->arch.cpu_policy->basic.mtrr )
             goto gp_fault;
         index = msr - MSR_MTRRfix16K_80000 + 1;
         if ( !mtrr_fix_range_msr_set(v->domain, &v->arch.hvm.mtrr,
@@ -3716,7 +3716,7 @@ int hvm_msr_write_intercept(unsigned int msr, uint64_t msr_content,
             goto gp_fault;
         break;
     case MSR_MTRRfix4K_C0000...MSR_MTRRfix4K_F8000:
-        if ( !d->arch.cpuid->basic.mtrr )
+        if ( !d->arch.cpu_policy->basic.mtrr )
             goto gp_fault;
         index = msr - MSR_MTRRfix4K_C0000 + 3;
         if ( !mtrr_fix_range_msr_set(v->domain, &v->arch.hvm.mtrr,
@@ -3724,7 +3724,7 @@ int hvm_msr_write_intercept(unsigned int msr, uint64_t msr_content,
             goto gp_fault;
         break;
     case MSR_IA32_MTRR_PHYSBASE(0)...MSR_IA32_MTRR_PHYSMASK(MTRR_VCNT_MAX - 1):
-        if ( !d->arch.cpuid->basic.mtrr )
+        if ( !d->arch.cpu_policy->basic.mtrr )
             goto gp_fault;
         index = msr - MSR_IA32_MTRR_PHYSBASE(0);
         if ( ((index / 2) >=
@@ -3830,7 +3830,7 @@ void hvm_ud_intercept(struct cpu_user_regs *regs)
 {
     struct vcpu *cur = current;
     bool should_emulate =
-        cur->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor;
+        cur->domain->arch.cpu_policy->x86_vendor != boot_cpu_data.x86_vendor;
     struct hvm_emulate_ctxt ctxt;
 
     hvm_emulate_init_once(&ctxt, opt_hvm_fep ? NULL : is_cross_vendor, regs);
@@ -4737,7 +4737,7 @@ static int do_altp2m_op(
 
     case HVMOP_altp2m_set_suppress_ve_multi:
     {
-        uint64_t max_phys_addr = (1UL << d->arch.cpuid->extd.maxphysaddr) - 1;
+        uint64_t max_phys_addr = (1UL << d->arch.cpu_policy->extd.maxphysaddr) - 1;
 
         a.u.suppress_ve_multi.last_gfn = min(a.u.suppress_ve_multi.last_gfn,
                                              max_phys_addr);
diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 0bdcca1e1a5f..f397ce68cdb5 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -295,9 +295,9 @@ bool arch_ioreq_server_get_type_addr(const struct domain *d,
         *addr = ((uint64_t)sbdf.sbdf << 32) | reg;
         /* AMD extended configuration space access? */
         if ( CF8_ADDR_HI(cf8) &&
-             d->arch.cpuid->x86_vendor == X86_VENDOR_AMD &&
+             d->arch.cpu_policy->x86_vendor == X86_VENDOR_AMD &&
              (x86_fam = get_cpu_family(
-                 d->arch.cpuid->basic.raw_fms, NULL, NULL)) >= 0x10 &&
+                 d->arch.cpu_policy->basic.raw_fms, NULL, NULL)) >= 0x10 &&
              x86_fam < 0x17 )
         {
             uint64_t msr_val;
diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index f1a88d761635..805e6d4ff243 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -460,7 +460,7 @@ bool_t mtrr_var_range_msr_set(
         return 0;
 
     if ( d == current->domain )
-        phys_addr = d->arch.cpuid->extd.maxphysaddr;
+        phys_addr = d->arch.cpu_policy->extd.maxphysaddr;
     else
         phys_addr = paddr_bits;
     msr_mask = ~((((uint64_t)1) << phys_addr) - 1);
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 02563e4b7027..5c2399e3eaba 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -328,7 +328,7 @@ static void svm_save_dr(struct vcpu *v)
     v->arch.hvm.flag_dr_dirty = 0;
     vmcb_set_dr_intercepts(vmcb, ~0u);
 
-    if ( v->domain->arch.cpuid->extd.dbext )
+    if ( v->domain->arch.cpu_policy->extd.dbext )
     {
         svm_intercept_msr(v, MSR_AMD64_DR0_ADDRESS_MASK, MSR_INTERCEPT_RW);
         svm_intercept_msr(v, MSR_AMD64_DR1_ADDRESS_MASK, MSR_INTERCEPT_RW);
@@ -359,7 +359,7 @@ static void __restore_debug_registers(struct vmcb_struct *vmcb, struct vcpu *v)
 
     ASSERT(v == current);
 
-    if ( v->domain->arch.cpuid->extd.dbext )
+    if ( v->domain->arch.cpu_policy->extd.dbext )
     {
         svm_intercept_msr(v, MSR_AMD64_DR0_ADDRESS_MASK, MSR_INTERCEPT_NONE);
         svm_intercept_msr(v, MSR_AMD64_DR1_ADDRESS_MASK, MSR_INTERCEPT_NONE);
@@ -583,11 +583,11 @@ static void cf_check svm_cpuid_policy_changed(struct vcpu *v)
 {
     struct svm_vcpu *svm = &v->arch.hvm.svm;
     struct vmcb_struct *vmcb = svm->vmcb;
-    const struct cpuid_policy *cp = v->domain->arch.cpuid;
+    const struct cpu_policy *cp = v->domain->arch.cpu_policy;
     u32 bitmap = vmcb_get_exception_intercepts(vmcb);
 
     if ( opt_hvm_fep ||
-         (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor) )
+         (v->domain->arch.cpu_policy->x86_vendor != boot_cpu_data.x86_vendor) )
         bitmap |= (1U << TRAP_invalid_op);
     else
         bitmap &= ~(1U << TRAP_invalid_op);
@@ -967,7 +967,7 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
      */
     if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
     {
-        ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
+        ASSERT(v->domain->arch.cpu_policy->extd.virt_ssbd);
         amd_set_legacy_ssbd(false);
     }
 }
@@ -1001,7 +1001,7 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
     /* Load SSBD if set by the guest. */
     if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
     {
-        ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
+        ASSERT(v->domain->arch.cpu_policy->extd.virt_ssbd);
         amd_set_legacy_ssbd(true);
     }
 }
@@ -1928,7 +1928,7 @@ static int cf_check svm_msr_read_intercept(
 
     case MSR_AMD_OSVW_ID_LENGTH:
     case MSR_AMD_OSVW_STATUS:
-        if ( !d->arch.cpuid->extd.osvw )
+        if ( !d->arch.cpu_policy->extd.osvw )
             goto gpf;
         *msr_content = d->arch.hvm.svm.osvw.raw[msr - MSR_AMD_OSVW_ID_LENGTH];
         break;
@@ -2121,7 +2121,7 @@ static int cf_check svm_msr_write_intercept(
 
     case MSR_AMD_OSVW_ID_LENGTH:
     case MSR_AMD_OSVW_STATUS:
-        if ( !d->arch.cpuid->extd.osvw )
+        if ( !d->arch.cpu_policy->extd.osvw )
             goto gpf;
         /* Write-discard */
         break;
@@ -2187,7 +2187,7 @@ static void svm_vmexit_do_rdtsc(struct cpu_user_regs *regs, bool rdtscp)
     const struct domain *currd = curr->domain;
     unsigned int inst_len;
 
-    if ( rdtscp && !currd->arch.cpuid->extd.rdtscp )
+    if ( rdtscp && !currd->arch.cpu_policy->extd.rdtscp )
     {
         hvm_inject_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC);
         return;
diff --git a/xen/arch/x86/hvm/svm/svmdebug.c b/xen/arch/x86/hvm/svm/svmdebug.c
index bce86f0ef706..05a2d119c744 100644
--- a/xen/arch/x86/hvm/svm/svmdebug.c
+++ b/xen/arch/x86/hvm/svm/svmdebug.c
@@ -130,7 +130,7 @@ bool svm_vmcb_isvalid(const char *from, const struct vmcb_struct *vmcb,
          ((cr3 & 7) ||
           ((!(cr4 & X86_CR4_PAE) || (efer & EFER_LMA)) && (cr3 & 0xfe0)) ||
           ((efer & EFER_LMA) &&
-           (cr3 >> v->domain->arch.cpuid->extd.maxphysaddr))) )
+           (cr3 >> v->domain->arch.cpu_policy->extd.maxphysaddr))) )
         PRINTF("CR3: MBZ bits are set (%#"PRIx64")\n", cr3);
 
     valid = hvm_cr4_guest_valid_bits(v->domain);
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index dc93b5e930b1..f4f5ffc673e5 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1083,7 +1083,7 @@ static void set_x2apic_id(struct vlapic *vlapic)
 
 int guest_wrmsr_apic_base(struct vcpu *v, uint64_t value)
 {
-    const struct cpuid_policy *cp = v->domain->arch.cpuid;
+    const struct cpu_policy *cp = v->domain->arch.cpu_policy;
     struct vlapic *vlapic = vcpu_vlapic(v);
 
     if ( !has_vlapic(v->domain) )
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index e05588505871..593400a8608f 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -710,7 +710,7 @@ static void vmx_restore_host_msrs(void)
 
 static void vmx_save_guest_msrs(struct vcpu *v)
 {
-    const struct cpuid_policy *cp = v->domain->arch.cpuid;
+    const struct cpu_policy *cp = v->domain->arch.cpu_policy;
     struct vcpu_msrs *msrs = v->arch.msrs;
 
     /*
@@ -731,7 +731,7 @@ static void vmx_save_guest_msrs(struct vcpu *v)
 
 static void vmx_restore_guest_msrs(struct vcpu *v)
 {
-    const struct cpuid_policy *cp = v->domain->arch.cpuid;
+    const struct cpu_policy *cp = v->domain->arch.cpu_policy;
     const struct vcpu_msrs *msrs = v->arch.msrs;
 
     write_gs_shadow(v->arch.hvm.vmx.shadow_gs);
@@ -784,11 +784,11 @@ void vmx_update_exception_bitmap(struct vcpu *v)
 
 static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
 {
-    const struct cpuid_policy *cp = v->domain->arch.cpuid;
+    const struct cpu_policy *cp = v->domain->arch.cpu_policy;
     int rc = 0;
 
     if ( opt_hvm_fep ||
-         (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor) )
+         (v->domain->arch.cpu_policy->x86_vendor != boot_cpu_data.x86_vendor) )
         v->arch.hvm.vmx.exception_bitmap |= (1U << TRAP_invalid_op);
     else
         v->arch.hvm.vmx.exception_bitmap &= ~(1U << TRAP_invalid_op);
@@ -3521,7 +3521,7 @@ static int cf_check vmx_msr_write_intercept(
     unsigned int msr, uint64_t msr_content)
 {
     struct vcpu *v = current;
-    const struct cpuid_policy *cp = v->domain->arch.cpuid;
+    const struct cpu_policy *cp = v->domain->arch.cpu_policy;
 
     HVM_DBG_LOG(DBG_LEVEL_MSR, "ecx=%#x, msr_value=%#"PRIx64, msr, msr_content);
 
@@ -4451,7 +4451,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         vmx_invlpg_intercept(exit_qualification);
         break;
     case EXIT_REASON_RDTSCP:
-        if ( !currd->arch.cpuid->extd.rdtscp )
+        if ( !currd->arch.cpu_policy->extd.rdtscp )
         {
             hvm_inject_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC);
             break;
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 674cdabb0736..f78247d9122c 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -2175,7 +2175,7 @@ int nvmx_msr_read_intercept(unsigned int msr, u64 *msr_content)
     int r = 1;
 
     /* VMX capablity MSRs are available only when guest supports VMX. */
-    if ( !nestedhvm_enabled(d) || !d->arch.cpuid->basic.vmx )
+    if ( !nestedhvm_enabled(d) || !d->arch.cpu_policy->basic.vmx )
         return 0;
 
     /*
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index a1deab1d0dcc..6ab396c28589 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -386,10 +386,7 @@ struct arch_domain
      */
     uint8_t x87_fip_width;
 
-    union {
-        struct cpu_policy *cpuid; /* Temporary */
-        struct cpu_policy *cpu_policy;
-    };
+    struct cpu_policy *cpu_policy;
 
     struct PITState vpit;
 
diff --git a/xen/arch/x86/include/asm/guest_pt.h b/xen/arch/x86/include/asm/guest_pt.h
index 6802db2a415a..bb5e5c4b9fba 100644
--- a/xen/arch/x86/include/asm/guest_pt.h
+++ b/xen/arch/x86/include/asm/guest_pt.h
@@ -293,7 +293,7 @@ static always_inline bool guest_pks_enabled(const struct vcpu *v)
 static always_inline uint64_t guest_rsvd_bits(const struct vcpu *v)
 {
     return ((PADDR_MASK &
-             ~((1ul << v->domain->arch.cpuid->extd.maxphysaddr) - 1)) |
+             ~((1ul << v->domain->arch.cpu_policy->extd.maxphysaddr) - 1)) |
             (guest_nx_enabled(v) ? 0 : put_pte_flags(_PAGE_NX_BIT)));
 }
 
@@ -332,7 +332,7 @@ static always_inline bool guest_l4e_rsvd_bits(const struct vcpu *v,
                                               guest_l4e_t l4e)
 {
     return l4e.l4 & (guest_rsvd_bits(v) | GUEST_L4_PAGETABLE_RSVD |
-                     ((v->domain->arch.cpuid->x86_vendor == X86_VENDOR_AMD)
+                     ((v->domain->arch.cpu_policy->x86_vendor == X86_VENDOR_AMD)
                       ? _PAGE_GLOBAL : 0));
 }
 #endif /* GUEST_PAGING_LEVELS >= 4 */
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index b59a51d238a7..3efa4b02449e 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -290,7 +290,7 @@ static inline void wrmsr_tsc_aux(uint32_t val)
     }
 }
 
-uint64_t msr_spec_ctrl_valid_bits(const struct cpuid_policy *cp);
+uint64_t msr_spec_ctrl_valid_bits(const struct cpu_policy *cp);
 
 /* Container object for per-vCPU MSRs */
 struct vcpu_msrs
diff --git a/xen/arch/x86/include/asm/paging.h b/xen/arch/x86/include/asm/paging.h
index 2647b95e67a7..5ae8745bb190 100644
--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -346,7 +346,7 @@ int paging_set_allocation(struct domain *d, unsigned int pages,
 /* Is gfn within maxphysaddr for the domain? */
 static inline bool gfn_valid(const struct domain *d, gfn_t gfn)
 {
-    return !(gfn_x(gfn) >> (d->arch.cpuid->extd.maxphysaddr - PAGE_SHIFT));
+    return !(gfn_x(gfn) >> (d->arch.cpu_policy->extd.maxphysaddr - PAGE_SHIFT));
 }
 
 /* Maxphysaddr supportable by the paging infrastructure. */
diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c
index e2ee1c77056f..cc84af01925a 100644
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -319,7 +319,7 @@ const struct x86_emulate_ops *shadow_init_emulation(
     memset(sh_ctxt, 0, sizeof(*sh_ctxt));
 
     sh_ctxt->ctxt.regs = regs;
-    sh_ctxt->ctxt.cpuid = curr->domain->arch.cpuid;
+    sh_ctxt->ctxt.cpu_policy = curr->domain->arch.cpu_policy;
     sh_ctxt->ctxt.lma = hvm_long_mode_active(curr);
 
     /* Segment cache initialisation. Primed with CS. */
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 672961dd3ac1..bf6c8f5f36ec 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -40,7 +40,7 @@ DEFINE_PER_CPU(uint32_t, tsc_aux);
 
 static void __init calculate_raw_policy(void)
 {
-    struct msr_policy *mp = &raw_cpu_policy;
+    struct cpu_policy *mp = &raw_cpu_policy;
 
     /* 0x000000ce  MSR_INTEL_PLATFORM_INFO */
     /* Was already added by probe_cpuid_faulting() */
@@ -51,7 +51,7 @@ static void __init calculate_raw_policy(void)
 
 static void __init calculate_host_policy(void)
 {
-    struct msr_policy *mp = &host_cpu_policy;
+    struct cpu_policy *mp = &host_cpu_policy;
 
     *mp = raw_cpu_policy;
 
@@ -71,7 +71,7 @@ static void __init calculate_host_policy(void)
 
 static void __init calculate_pv_max_policy(void)
 {
-    struct msr_policy *mp = &pv_max_cpu_policy;
+    struct cpu_policy *mp = &pv_max_cpu_policy;
 
     *mp = host_cpu_policy;
 
@@ -80,14 +80,14 @@ static void __init calculate_pv_max_policy(void)
 
 static void __init calculate_pv_def_policy(void)
 {
-    struct msr_policy *mp = &pv_def_cpu_policy;
+    struct cpu_policy *mp = &pv_def_cpu_policy;
 
     *mp = pv_max_cpu_policy;
 }
 
 static void __init calculate_hvm_max_policy(void)
 {
-    struct msr_policy *mp = &hvm_max_cpu_policy;
+    struct cpu_policy *mp = &hvm_max_cpu_policy;
 
     *mp = host_cpu_policy;
 
@@ -99,7 +99,7 @@ static void __init calculate_hvm_max_policy(void)
 
 static void __init calculate_hvm_def_policy(void)
 {
-    struct msr_policy *mp = &hvm_def_cpu_policy;
+    struct cpu_policy *mp = &hvm_def_cpu_policy;
 
     *mp = hvm_max_cpu_policy;
 }
@@ -138,7 +138,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
 {
     const struct vcpu *curr = current;
     const struct domain *d = v->domain;
-    const struct cpuid_policy *cp = d->arch.cpuid;
+    const struct cpu_policy *cp = d->arch.cpu_policy;
     const struct vcpu_msrs *msrs = v->arch.msrs;
     int ret = X86EMUL_OKAY;
 
@@ -409,7 +409,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
  * separate CPUID features for this functionality, but only set will be
  * active.
  */
-uint64_t msr_spec_ctrl_valid_bits(const struct cpuid_policy *cp)
+uint64_t msr_spec_ctrl_valid_bits(const struct cpu_policy *cp)
 {
     bool ssbd = cp->feat.ssbd || cp->extd.amd_ssbd;
     bool psfd = cp->feat.intel_psfd || cp->extd.psfd;
@@ -428,7 +428,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
 {
     const struct vcpu *curr = current;
     struct domain *d = v->domain;
-    const struct cpuid_policy *cp = d->arch.cpuid;
+    const struct cpu_policy *cp = d->arch.cpu_policy;
     struct vcpu_msrs *msrs = v->arch.msrs;
     int ret = X86EMUL_OKAY;
 
@@ -469,7 +469,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
          * for backwards compatiblity, the OS should write 0 to it before
          * trying to access the current microcode version.
          */
-        if ( d->arch.cpuid->x86_vendor != X86_VENDOR_INTEL || val != 0 )
+        if ( d->arch.cpu_policy->x86_vendor != X86_VENDOR_INTEL || val != 0 )
             goto gp_fault;
         break;
 
@@ -479,7 +479,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
          * to AMD CPUs as well (at least the architectural/CPUID part does).
          */
         if ( is_pv_domain(d) ||
-             d->arch.cpuid->x86_vendor != X86_VENDOR_AMD )
+             d->arch.cpu_policy->x86_vendor != X86_VENDOR_AMD )
             goto gp_fault;
         break;
 
@@ -491,7 +491,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
          * by any CPUID bit.
          */
         if ( is_pv_domain(d) ||
-             d->arch.cpuid->x86_vendor != X86_VENDOR_INTEL )
+             d->arch.cpu_policy->x86_vendor != X86_VENDOR_INTEL )
             goto gp_fault;
         break;
 
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index f94f28c8e271..dbda57894543 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -145,7 +145,7 @@ static void release_compat_l4(struct vcpu *v)
 
 unsigned long pv_fixup_guest_cr4(const struct vcpu *v, unsigned long cr4)
 {
-    const struct cpuid_policy *p = v->domain->arch.cpuid;
+    const struct cpu_policy *p = v->domain->arch.cpu_policy;
 
     /* Discard attempts to set guest controllable bits outside of the policy. */
     cr4 &= ~((p->basic.tsc     ? 0 : X86_CR4_TSD)      |
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 5da00e24e4ff..04416f197951 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -885,7 +885,7 @@ static int cf_check read_msr(
 {
     struct vcpu *curr = current;
     const struct domain *currd = curr->domain;
-    const struct cpuid_policy *cp = currd->arch.cpuid;
+    const struct cpu_policy *cp = currd->arch.cpu_policy;
     bool vpmu_msr = false, warn = false;
     uint64_t tmp;
     int ret;
@@ -1034,7 +1034,7 @@ static int cf_check write_msr(
 {
     struct vcpu *curr = current;
     const struct domain *currd = curr->domain;
-    const struct cpuid_policy *cp = currd->arch.cpuid;
+    const struct cpu_policy *cp = currd->arch.cpu_policy;
     bool vpmu_msr = false;
     int ret;
 
@@ -1327,7 +1327,7 @@ int pv_emulate_privileged_op(struct cpu_user_regs *regs)
     struct domain *currd = curr->domain;
     struct priv_op_ctxt ctxt = {
         .ctxt.regs = regs,
-        .ctxt.cpuid = currd->arch.cpuid,
+        .ctxt.cpu_policy = currd->arch.cpu_policy,
         .ctxt.lma = !is_pv_32bit_domain(currd),
     };
     int rc;
diff --git a/xen/arch/x86/pv/ro-page-fault.c b/xen/arch/x86/pv/ro-page-fault.c
index 5963f5ee2d51..0d02c7d2ab10 100644
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -356,7 +356,7 @@ int pv_ro_page_fault(unsigned long addr, struct cpu_user_regs *regs)
     unsigned int addr_size = is_pv_32bit_domain(currd) ? 32 : BITS_PER_LONG;
     struct x86_emulate_ctxt ctxt = {
         .regs      = regs,
-        .cpuid     = currd->arch.cpuid,
+        .cpu_policy = currd->arch.cpu_policy,
         .addr_size = addr_size,
         .sp_size   = addr_size,
         .lma       = addr_size > 32,
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 3b2efecede2f..14d3dbca147b 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -295,7 +295,7 @@ long arch_do_sysctl(
 
     case XEN_SYSCTL_get_cpu_featureset:
     {
-        static const struct cpuid_policy *const policy_table[6] = {
+        static const struct cpu_policy *policy_table[6] = {
             [XEN_SYSCTL_cpu_featureset_raw]     = &raw_cpu_policy,
             [XEN_SYSCTL_cpu_featureset_host]    = &host_cpu_policy,
 #ifdef CONFIG_PV
@@ -307,7 +307,7 @@ long arch_do_sysctl(
             [XEN_SYSCTL_cpu_featureset_hvm_max] = &hvm_max_cpu_policy,
 #endif
         };
-        const struct cpuid_policy *p = NULL;
+        const struct cpu_policy *p = NULL;
         uint32_t featureset[FSCAPINTS];
         unsigned int nr;
 
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index cade9e12f8fa..d12004b1c6fc 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1035,7 +1035,7 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
                              uint32_t subleaf, struct cpuid_leaf *res)
 {
     const struct domain *d = v->domain;
-    const struct cpuid_policy *p = d->arch.cpuid;
+    const struct cpu_policy *p = d->arch.cpu_policy;
     uint32_t base = is_viridian_domain(d) ? 0x40000100 : 0x40000000;
     uint32_t idx  = leaf - base;
     unsigned int limit = is_viridian_domain(d) ? p->hv2_limit : p->hv_limit;
diff --git a/xen/arch/x86/x86_emulate.c b/xen/arch/x86/x86_emulate.c
index 8c7d18521807..ff94758e0ebe 100644
--- a/xen/arch/x86/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate.c
@@ -74,7 +74,7 @@ int cf_check x86emul_read_xcr(
         return X86EMUL_OKAY;
 
     case 1:
-        if ( current->domain->arch.cpuid->xstate.xgetbv1 )
+        if ( current->domain->arch.cpu_policy->xstate.xgetbv1 )
             break;
         /* fall through */
     default:
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index e38f98b54726..a26a2934b6a7 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1923,7 +1923,7 @@ in_protmode(
 }
 
 static bool
-_amd_like(const struct cpuid_policy *cp)
+_amd_like(const struct cpu_policy *cp)
 {
     return cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON);
 }
@@ -1931,87 +1931,87 @@ _amd_like(const struct cpuid_policy *cp)
 static bool
 amd_like(const struct x86_emulate_ctxt *ctxt)
 {
-    return _amd_like(ctxt->cpuid);
+    return _amd_like(ctxt->cpu_policy);
 }
 
-#define vcpu_has_fpu()         (ctxt->cpuid->basic.fpu)
-#define vcpu_has_sep()         (ctxt->cpuid->basic.sep)
-#define vcpu_has_cx8()         (ctxt->cpuid->basic.cx8)
-#define vcpu_has_cmov()        (ctxt->cpuid->basic.cmov)
-#define vcpu_has_clflush()     (ctxt->cpuid->basic.clflush)
-#define vcpu_has_mmx()         (ctxt->cpuid->basic.mmx)
-#define vcpu_has_fxsr()        (ctxt->cpuid->basic.fxsr)
-#define vcpu_has_sse()         (ctxt->cpuid->basic.sse)
-#define vcpu_has_sse2()        (ctxt->cpuid->basic.sse2)
-#define vcpu_has_sse3()        (ctxt->cpuid->basic.sse3)
-#define vcpu_has_pclmulqdq()   (ctxt->cpuid->basic.pclmulqdq)
-#define vcpu_has_ssse3()       (ctxt->cpuid->basic.ssse3)
-#define vcpu_has_fma()         (ctxt->cpuid->basic.fma)
-#define vcpu_has_cx16()        (ctxt->cpuid->basic.cx16)
-#define vcpu_has_sse4_1()      (ctxt->cpuid->basic.sse4_1)
-#define vcpu_has_sse4_2()      (ctxt->cpuid->basic.sse4_2)
-#define vcpu_has_movbe()       (ctxt->cpuid->basic.movbe)
-#define vcpu_has_popcnt()      (ctxt->cpuid->basic.popcnt)
-#define vcpu_has_aesni()       (ctxt->cpuid->basic.aesni)
-#define vcpu_has_avx()         (ctxt->cpuid->basic.avx)
-#define vcpu_has_f16c()        (ctxt->cpuid->basic.f16c)
-#define vcpu_has_rdrand()      (ctxt->cpuid->basic.rdrand)
-
-#define vcpu_has_mmxext()      (ctxt->cpuid->extd.mmxext || vcpu_has_sse())
-#define vcpu_has_3dnow_ext()   (ctxt->cpuid->extd._3dnowext)
-#define vcpu_has_3dnow()       (ctxt->cpuid->extd._3dnow)
-#define vcpu_has_lahf_lm()     (ctxt->cpuid->extd.lahf_lm)
-#define vcpu_has_cr8_legacy()  (ctxt->cpuid->extd.cr8_legacy)
-#define vcpu_has_lzcnt()       (ctxt->cpuid->extd.abm)
-#define vcpu_has_sse4a()       (ctxt->cpuid->extd.sse4a)
-#define vcpu_has_misalignsse() (ctxt->cpuid->extd.misalignsse)
-#define vcpu_has_xop()         (ctxt->cpuid->extd.xop)
-#define vcpu_has_fma4()        (ctxt->cpuid->extd.fma4)
-#define vcpu_has_tbm()         (ctxt->cpuid->extd.tbm)
-#define vcpu_has_clzero()      (ctxt->cpuid->extd.clzero)
-#define vcpu_has_wbnoinvd()    (ctxt->cpuid->extd.wbnoinvd)
-#define vcpu_has_nscb()        (ctxt->cpuid->extd.nscb)
-
-#define vcpu_has_bmi1()        (ctxt->cpuid->feat.bmi1)
-#define vcpu_has_hle()         (ctxt->cpuid->feat.hle)
-#define vcpu_has_avx2()        (ctxt->cpuid->feat.avx2)
-#define vcpu_has_bmi2()        (ctxt->cpuid->feat.bmi2)
-#define vcpu_has_invpcid()     (ctxt->cpuid->feat.invpcid)
-#define vcpu_has_rtm()         (ctxt->cpuid->feat.rtm)
-#define vcpu_has_mpx()         (ctxt->cpuid->feat.mpx)
-#define vcpu_has_avx512f()     (ctxt->cpuid->feat.avx512f)
-#define vcpu_has_avx512dq()    (ctxt->cpuid->feat.avx512dq)
-#define vcpu_has_rdseed()      (ctxt->cpuid->feat.rdseed)
-#define vcpu_has_adx()         (ctxt->cpuid->feat.adx)
-#define vcpu_has_smap()        (ctxt->cpuid->feat.smap)
-#define vcpu_has_avx512_ifma() (ctxt->cpuid->feat.avx512_ifma)
-#define vcpu_has_clflushopt()  (ctxt->cpuid->feat.clflushopt)
-#define vcpu_has_clwb()        (ctxt->cpuid->feat.clwb)
-#define vcpu_has_avx512pf()    (ctxt->cpuid->feat.avx512pf)
-#define vcpu_has_avx512er()    (ctxt->cpuid->feat.avx512er)
-#define vcpu_has_avx512cd()    (ctxt->cpuid->feat.avx512cd)
-#define vcpu_has_sha()         (ctxt->cpuid->feat.sha)
-#define vcpu_has_avx512bw()    (ctxt->cpuid->feat.avx512bw)
-#define vcpu_has_avx512vl()    (ctxt->cpuid->feat.avx512vl)
-#define vcpu_has_avx512_vbmi() (ctxt->cpuid->feat.avx512_vbmi)
-#define vcpu_has_avx512_vbmi2() (ctxt->cpuid->feat.avx512_vbmi2)
-#define vcpu_has_gfni()        (ctxt->cpuid->feat.gfni)
-#define vcpu_has_vaes()        (ctxt->cpuid->feat.vaes)
-#define vcpu_has_vpclmulqdq()  (ctxt->cpuid->feat.vpclmulqdq)
-#define vcpu_has_avx512_vnni() (ctxt->cpuid->feat.avx512_vnni)
-#define vcpu_has_avx512_bitalg() (ctxt->cpuid->feat.avx512_bitalg)
-#define vcpu_has_avx512_vpopcntdq() (ctxt->cpuid->feat.avx512_vpopcntdq)
-#define vcpu_has_rdpid()       (ctxt->cpuid->feat.rdpid)
-#define vcpu_has_movdiri()     (ctxt->cpuid->feat.movdiri)
-#define vcpu_has_movdir64b()   (ctxt->cpuid->feat.movdir64b)
-#define vcpu_has_enqcmd()      (ctxt->cpuid->feat.enqcmd)
-#define vcpu_has_avx512_4vnniw() (ctxt->cpuid->feat.avx512_4vnniw)
-#define vcpu_has_avx512_4fmaps() (ctxt->cpuid->feat.avx512_4fmaps)
-#define vcpu_has_avx512_vp2intersect() (ctxt->cpuid->feat.avx512_vp2intersect)
-#define vcpu_has_serialize()   (ctxt->cpuid->feat.serialize)
-#define vcpu_has_tsxldtrk()    (ctxt->cpuid->feat.tsxldtrk)
-#define vcpu_has_avx_vnni()    (ctxt->cpuid->feat.avx_vnni)
-#define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
+#define vcpu_has_fpu()         (ctxt->cpu_policy->basic.fpu)
+#define vcpu_has_sep()         (ctxt->cpu_policy->basic.sep)
+#define vcpu_has_cx8()         (ctxt->cpu_policy->basic.cx8)
+#define vcpu_has_cmov()        (ctxt->cpu_policy->basic.cmov)
+#define vcpu_has_clflush()     (ctxt->cpu_policy->basic.clflush)
+#define vcpu_has_mmx()         (ctxt->cpu_policy->basic.mmx)
+#define vcpu_has_fxsr()        (ctxt->cpu_policy->basic.fxsr)
+#define vcpu_has_sse()         (ctxt->cpu_policy->basic.sse)
+#define vcpu_has_sse2()        (ctxt->cpu_policy->basic.sse2)
+#define vcpu_has_sse3()        (ctxt->cpu_policy->basic.sse3)
+#define vcpu_has_pclmulqdq()   (ctxt->cpu_policy->basic.pclmulqdq)
+#define vcpu_has_ssse3()       (ctxt->cpu_policy->basic.ssse3)
+#define vcpu_has_fma()         (ctxt->cpu_policy->basic.fma)
+#define vcpu_has_cx16()        (ctxt->cpu_policy->basic.cx16)
+#define vcpu_has_sse4_1()      (ctxt->cpu_policy->basic.sse4_1)
+#define vcpu_has_sse4_2()      (ctxt->cpu_policy->basic.sse4_2)
+#define vcpu_has_movbe()       (ctxt->cpu_policy->basic.movbe)
+#define vcpu_has_popcnt()      (ctxt->cpu_policy->basic.popcnt)
+#define vcpu_has_aesni()       (ctxt->cpu_policy->basic.aesni)
+#define vcpu_has_avx()         (ctxt->cpu_policy->basic.avx)
+#define vcpu_has_f16c()        (ctxt->cpu_policy->basic.f16c)
+#define vcpu_has_rdrand()      (ctxt->cpu_policy->basic.rdrand)
+
+#define vcpu_has_mmxext()      (ctxt->cpu_policy->extd.mmxext || vcpu_has_sse())
+#define vcpu_has_3dnow_ext()   (ctxt->cpu_policy->extd._3dnowext)
+#define vcpu_has_3dnow()       (ctxt->cpu_policy->extd._3dnow)
+#define vcpu_has_lahf_lm()     (ctxt->cpu_policy->extd.lahf_lm)
+#define vcpu_has_cr8_legacy()  (ctxt->cpu_policy->extd.cr8_legacy)
+#define vcpu_has_lzcnt()       (ctxt->cpu_policy->extd.abm)
+#define vcpu_has_sse4a()       (ctxt->cpu_policy->extd.sse4a)
+#define vcpu_has_misalignsse() (ctxt->cpu_policy->extd.misalignsse)
+#define vcpu_has_xop()         (ctxt->cpu_policy->extd.xop)
+#define vcpu_has_fma4()        (ctxt->cpu_policy->extd.fma4)
+#define vcpu_has_tbm()         (ctxt->cpu_policy->extd.tbm)
+#define vcpu_has_clzero()      (ctxt->cpu_policy->extd.clzero)
+#define vcpu_has_wbnoinvd()    (ctxt->cpu_policy->extd.wbnoinvd)
+#define vcpu_has_nscb()        (ctxt->cpu_policy->extd.nscb)
+
+#define vcpu_has_bmi1()        (ctxt->cpu_policy->feat.bmi1)
+#define vcpu_has_hle()         (ctxt->cpu_policy->feat.hle)
+#define vcpu_has_avx2()        (ctxt->cpu_policy->feat.avx2)
+#define vcpu_has_bmi2()        (ctxt->cpu_policy->feat.bmi2)
+#define vcpu_has_invpcid()     (ctxt->cpu_policy->feat.invpcid)
+#define vcpu_has_rtm()         (ctxt->cpu_policy->feat.rtm)
+#define vcpu_has_mpx()         (ctxt->cpu_policy->feat.mpx)
+#define vcpu_has_avx512f()     (ctxt->cpu_policy->feat.avx512f)
+#define vcpu_has_avx512dq()    (ctxt->cpu_policy->feat.avx512dq)
+#define vcpu_has_rdseed()      (ctxt->cpu_policy->feat.rdseed)
+#define vcpu_has_adx()         (ctxt->cpu_policy->feat.adx)
+#define vcpu_has_smap()        (ctxt->cpu_policy->feat.smap)
+#define vcpu_has_avx512_ifma() (ctxt->cpu_policy->feat.avx512_ifma)
+#define vcpu_has_clflushopt()  (ctxt->cpu_policy->feat.clflushopt)
+#define vcpu_has_clwb()        (ctxt->cpu_policy->feat.clwb)
+#define vcpu_has_avx512pf()    (ctxt->cpu_policy->feat.avx512pf)
+#define vcpu_has_avx512er()    (ctxt->cpu_policy->feat.avx512er)
+#define vcpu_has_avx512cd()    (ctxt->cpu_policy->feat.avx512cd)
+#define vcpu_has_sha()         (ctxt->cpu_policy->feat.sha)
+#define vcpu_has_avx512bw()    (ctxt->cpu_policy->feat.avx512bw)
+#define vcpu_has_avx512vl()    (ctxt->cpu_policy->feat.avx512vl)
+#define vcpu_has_avx512_vbmi() (ctxt->cpu_policy->feat.avx512_vbmi)
+#define vcpu_has_avx512_vbmi2() (ctxt->cpu_policy->feat.avx512_vbmi2)
+#define vcpu_has_gfni()        (ctxt->cpu_policy->feat.gfni)
+#define vcpu_has_vaes()        (ctxt->cpu_policy->feat.vaes)
+#define vcpu_has_vpclmulqdq()  (ctxt->cpu_policy->feat.vpclmulqdq)
+#define vcpu_has_avx512_vnni() (ctxt->cpu_policy->feat.avx512_vnni)
+#define vcpu_has_avx512_bitalg() (ctxt->cpu_policy->feat.avx512_bitalg)
+#define vcpu_has_avx512_vpopcntdq() (ctxt->cpu_policy->feat.avx512_vpopcntdq)
+#define vcpu_has_rdpid()       (ctxt->cpu_policy->feat.rdpid)
+#define vcpu_has_movdiri()     (ctxt->cpu_policy->feat.movdiri)
+#define vcpu_has_movdir64b()   (ctxt->cpu_policy->feat.movdir64b)
+#define vcpu_has_enqcmd()      (ctxt->cpu_policy->feat.enqcmd)
+#define vcpu_has_avx512_4vnniw() (ctxt->cpu_policy->feat.avx512_4vnniw)
+#define vcpu_has_avx512_4fmaps() (ctxt->cpu_policy->feat.avx512_4fmaps)
+#define vcpu_has_avx512_vp2intersect() (ctxt->cpu_policy->feat.avx512_vp2intersect)
+#define vcpu_has_serialize()   (ctxt->cpu_policy->feat.serialize)
+#define vcpu_has_tsxldtrk()    (ctxt->cpu_policy->feat.tsxldtrk)
+#define vcpu_has_avx_vnni()    (ctxt->cpu_policy->feat.avx_vnni)
+#define vcpu_has_avx512_bf16() (ctxt->cpu_policy->feat.avx512_bf16)
 
 #define vcpu_must_have(feat) \
     generate_exception_if(!vcpu_has_##feat(), EXC_UD)
@@ -2078,7 +2078,7 @@ protmode_load_seg(
     struct x86_emulate_ctxt *ctxt,
     const struct x86_emulate_ops *ops)
 {
-    const struct cpuid_policy *cp = ctxt->cpuid;
+    const struct cpu_policy *cp = ctxt->cpu_policy;
     enum x86_segment sel_seg = (sel & 4) ? x86_seg_ldtr : x86_seg_gdtr;
     struct { uint32_t a, b; } desc, desc_hi = {};
     uint8_t dpl, rpl;
@@ -5888,7 +5888,7 @@ x86_emulate(
 
             base = ad_bytes == 8 ? _regs.r(ax) :
                    ad_bytes == 4 ? _regs.eax : _regs.ax;
-            limit = ctxt->cpuid->basic.clflush_size * 8;
+            limit = ctxt->cpu_policy->basic.clflush_size * 8;
             generate_exception_if(limit < sizeof(long) ||
                                   (limit & (limit - 1)), EXC_UD);
             base &= ~(limit - 1);
@@ -6211,7 +6211,7 @@ x86_emulate(
          * in fact risking to make guest OSes vulnerable to the equivalent of
          * XSA-7 (CVE-2012-0217).
          */
-        generate_exception_if(ctxt->cpuid->x86_vendor == X86_VENDOR_INTEL &&
+        generate_exception_if(ctxt->cpu_policy->x86_vendor == X86_VENDOR_INTEL &&
                               op_bytes == 8 && !is_canonical_address(_regs.rcx),
                               EXC_GP, 0);
 #endif
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index 75015104fbdb..8c98a398643a 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -565,8 +565,8 @@ struct x86_emulate_ctxt
      * Input-only state:
      */
 
-    /* CPUID Policy for the domain. */
-    const struct cpuid_policy *cpuid;
+    /* CPU Policy for the domain. */
+    const struct cpu_policy *cpu_policy;
 
     /* Set this if writes may have side effects. */
     bool force_writeback;
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index d481e1db3e7e..22038a251f6d 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -684,7 +684,7 @@ void xstate_init(struct cpuinfo_x86 *c)
 int validate_xstate(const struct domain *d, uint64_t xcr0, uint64_t xcr0_accum,
                     const struct xsave_hdr *hdr)
 {
-    uint64_t xcr0_max = cpuid_policy_xcr0_max(d->arch.cpuid);
+    uint64_t xcr0_max = cpuid_policy_xcr0_max(d->arch.cpu_policy);
     unsigned int i;
 
     if ( (hdr->xstate_bv & ~xcr0_accum) ||
@@ -708,7 +708,7 @@ int validate_xstate(const struct domain *d, uint64_t xcr0, uint64_t xcr0_accum,
 int handle_xsetbv(u32 index, u64 new_bv)
 {
     struct vcpu *curr = current;
-    uint64_t xcr0_max = cpuid_policy_xcr0_max(curr->domain->arch.cpuid);
+    uint64_t xcr0_max = cpuid_policy_xcr0_max(curr->domain->arch.cpu_policy);
     u64 mask;
 
     if ( index != XCR_XFEATURE_ENABLED_MASK )
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index 51f88f1e217e..82b4c1c0546f 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -94,7 +94,7 @@ const char *x86_cpuid_vendor_to_str(unsigned int vendor);
                                       CPUID_GUEST_NR_EXTD_AMD)
 
 /*
- * Maximum number of leaves a struct cpuid_policy turns into when serialised
+ * Maximum number of leaves a struct cpu_policy turns into when serialised
  * for interaction with the toolstack.  (Sum of all leaves in each union, less
  * the entries in basic which sub-unions hang off of.)
  */
@@ -375,10 +375,6 @@ struct cpu_policy
     uint8_t x86_vendor;
 };
 
-/* Temporary */
-#define cpuid_policy cpu_policy
-#define msr_policy cpu_policy
-
 struct cpu_policy_errors
 {
     uint32_t leaf, subleaf;
@@ -389,7 +385,7 @@ struct cpu_policy_errors
 
 /* Fill in a featureset bitmap from a CPUID policy. */
 static inline void cpuid_policy_to_featureset(
-    const struct cpuid_policy *p, uint32_t fs[FEATURESET_NR_ENTRIES])
+    const struct cpu_policy *p, uint32_t fs[FEATURESET_NR_ENTRIES])
 {
     fs[FEATURESET_1d]  = p->basic._1d;
     fs[FEATURESET_1c]  = p->basic._1c;
@@ -411,7 +407,7 @@ static inline void cpuid_policy_to_featureset(
 
 /* Fill in a CPUID policy from a featureset bitmap. */
 static inline void cpuid_featureset_to_policy(
-    const uint32_t fs[FEATURESET_NR_ENTRIES], struct cpuid_policy *p)
+    const uint32_t fs[FEATURESET_NR_ENTRIES], struct cpu_policy *p)
 {
     p->basic._1d  = fs[FEATURESET_1d];
     p->basic._1c  = fs[FEATURESET_1c];
@@ -431,12 +427,12 @@ static inline void cpuid_featureset_to_policy(
     p->feat._7d1  = fs[FEATURESET_7d1];
 }
 
-static inline uint64_t cpuid_policy_xcr0_max(const struct cpuid_policy *p)
+static inline uint64_t cpuid_policy_xcr0_max(const struct cpu_policy *p)
 {
     return ((uint64_t)p->xstate.xcr0_high << 32) | p->xstate.xcr0_low;
 }
 
-static inline uint64_t cpuid_policy_xstates(const struct cpuid_policy *p)
+static inline uint64_t cpuid_policy_xstates(const struct cpu_policy *p)
 {
     uint64_t val = p->xstate.xcr0_high | p->xstate.xss_high;
 
@@ -448,7 +444,7 @@ const uint32_t *x86_cpuid_lookup_deep_deps(uint32_t feature);
 /**
  * Recalculate the content in a CPUID policy which is derived from raw data.
  */
-void x86_cpuid_policy_recalc_synth(struct cpuid_policy *p);
+void x86_cpuid_policy_recalc_synth(struct cpu_policy *p);
 
 /**
  * Fill a CPUID policy using the native CPUID instruction.
@@ -457,7 +453,7 @@ void x86_cpuid_policy_recalc_synth(struct cpuid_policy *p);
  * Values may be influenced by a hypervisor or from masking/faulting
  * configuration.
  */
-void x86_cpuid_policy_fill_native(struct cpuid_policy *p);
+void x86_cpuid_policy_fill_native(struct cpu_policy *p);
 
 /**
  * Clear leaf data beyond the policies max leaf/subleaf settings.
@@ -468,7 +464,7 @@ void x86_cpuid_policy_fill_native(struct cpuid_policy *p);
  * with out-of-range leaves with stale content in them.  This helper clears
  * them.
  */
-void x86_cpuid_policy_clear_out_of_range_leaves(struct cpuid_policy *p);
+void x86_cpuid_policy_clear_out_of_range_leaves(struct cpu_policy *p);
 
 #ifdef __XEN__
 #include <public/arch-x86/xen.h>
@@ -492,7 +488,7 @@ typedef xen_msr_entry_t msr_entry_buffer_t[];
  * leaves array is too short.  On success, nr_entries is updated with the
  * actual number of leaves written.
  */
-int x86_cpuid_copy_to_buffer(const struct cpuid_policy *policy,
+int x86_cpuid_copy_to_buffer(const struct cpu_policy *policy,
                              cpuid_leaf_buffer_t leaves, uint32_t *nr_entries);
 
 /**
@@ -512,7 +508,7 @@ int x86_cpuid_copy_to_buffer(const struct cpuid_policy *policy,
  * No content validation of in-range leaves is performed.  Synthesised data is
  * recalculated.
  */
-int x86_cpuid_copy_from_buffer(struct cpuid_policy *policy,
+int x86_cpuid_copy_from_buffer(struct cpu_policy *policy,
                                const cpuid_leaf_buffer_t leaves,
                                uint32_t nr_entries, uint32_t *err_leaf,
                                uint32_t *err_subleaf);
@@ -529,7 +525,7 @@ int x86_cpuid_copy_from_buffer(struct cpuid_policy *policy,
  * buffer array is too short.  On success, nr_entries is updated with the
  * actual number of msrs written.
  */
-int x86_msr_copy_to_buffer(const struct msr_policy *policy,
+int x86_msr_copy_to_buffer(const struct cpu_policy *policy,
                            msr_entry_buffer_t msrs, uint32_t *nr_entries);
 
 /**
@@ -549,7 +545,7 @@ int x86_msr_copy_to_buffer(const struct msr_policy *policy,
  *
  * No content validation is performed on the data stored in the policy object.
  */
-int x86_msr_copy_from_buffer(struct msr_policy *policy,
+int x86_msr_copy_from_buffer(struct cpu_policy *policy,
                              const msr_entry_buffer_t msrs, uint32_t nr_entries,
                              uint32_t *err_msr);
 
diff --git a/xen/lib/x86/cpuid.c b/xen/lib/x86/cpuid.c
index e81f76c779c0..58a14163b1cb 100644
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -60,13 +60,13 @@ const char *x86_cpuid_vendor_to_str(unsigned int vendor)
     }
 }
 
-void x86_cpuid_policy_recalc_synth(struct cpuid_policy *p)
+void x86_cpuid_policy_recalc_synth(struct cpu_policy *p)
 {
     p->x86_vendor = x86_cpuid_lookup_vendor(
         p->basic.vendor_ebx, p->basic.vendor_ecx, p->basic.vendor_edx);
 }
 
-void x86_cpuid_policy_fill_native(struct cpuid_policy *p)
+void x86_cpuid_policy_fill_native(struct cpu_policy *p)
 {
     unsigned int i;
 
@@ -183,7 +183,7 @@ void x86_cpuid_policy_fill_native(struct cpuid_policy *p)
     x86_cpuid_policy_recalc_synth(p);
 }
 
-void x86_cpuid_policy_clear_out_of_range_leaves(struct cpuid_policy *p)
+void x86_cpuid_policy_clear_out_of_range_leaves(struct cpu_policy *p)
 {
     unsigned int i;
 
@@ -291,7 +291,7 @@ static int copy_leaf_to_buffer(uint32_t leaf, uint32_t subleaf,
     return 0;
 }
 
-int x86_cpuid_copy_to_buffer(const struct cpuid_policy *p,
+int x86_cpuid_copy_to_buffer(const struct cpu_policy *p,
                              cpuid_leaf_buffer_t leaves, uint32_t *nr_entries_p)
 {
     const uint32_t nr_entries = *nr_entries_p;
@@ -377,7 +377,7 @@ int x86_cpuid_copy_to_buffer(const struct cpuid_policy *p,
     return 0;
 }
 
-int x86_cpuid_copy_from_buffer(struct cpuid_policy *p,
+int x86_cpuid_copy_from_buffer(struct cpu_policy *p,
                                const cpuid_leaf_buffer_t leaves,
                                uint32_t nr_entries, uint32_t *err_leaf,
                                uint32_t *err_subleaf)
diff --git a/xen/lib/x86/msr.c b/xen/lib/x86/msr.c
index c4d885e7b568..e04b9ca01302 100644
--- a/xen/lib/x86/msr.c
+++ b/xen/lib/x86/msr.c
@@ -23,7 +23,7 @@ static int copy_msr_to_buffer(uint32_t idx, uint64_t val,
     return 0;
 }
 
-int x86_msr_copy_to_buffer(const struct msr_policy *p,
+int x86_msr_copy_to_buffer(const struct cpu_policy *p,
                            msr_entry_buffer_t msrs, uint32_t *nr_entries_p)
 {
     const uint32_t nr_entries = *nr_entries_p;
@@ -48,7 +48,7 @@ int x86_msr_copy_to_buffer(const struct msr_policy *p,
     return 0;
 }
 
-int x86_msr_copy_from_buffer(struct msr_policy *p,
+int x86_msr_copy_from_buffer(struct cpu_policy *p,
                              const msr_entry_buffer_t msrs, uint32_t nr_entries,
                              uint32_t *err_msr)
 {
-- 
2.30.2


