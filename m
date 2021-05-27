Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5E2392F89
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 15:25:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133372.248644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmG11-0006aL-HT; Thu, 27 May 2021 13:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133372.248644; Thu, 27 May 2021 13:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmG11-0006Y4-Du; Thu, 27 May 2021 13:25:35 +0000
Received: by outflank-mailman (input) for mailman id 133372;
 Thu, 27 May 2021 13:25:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9d2D=KW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lmG0z-0006Vp-Bx
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 13:25:33 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5590923-66fe-478c-957a-1b070d481308;
 Thu, 27 May 2021 13:25:31 +0000 (UTC)
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
X-Inumbo-ID: d5590923-66fe-478c-957a-1b070d481308
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1622121931;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m9QjH0cMMuHCQVPpDVT4R/qor7cqmBRJec5W9WeQMWI=;
  b=CCvrJWHEFqL/KPm9u7kpq+Uv9f3MXekSOuzCymZoEeV3n21th/xziL9C
   GfV3bC8fwZvyA3+LPM9+Mu53rWCLBPwDaZGdwjfyR0a3P15xr5EPc7HlZ
   0xVC8JFrLiccPLjEXhElrJ0GrUIcBqt3/LRjCS0CIdpT8XIFLja8faFYr
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: RPC8Wl/AUgpsC6I+ScZyKvRYyEfw9QAESKL4QptfhG5ddSJOw/WTQQdTUsQxCkrGLfc4kbJblf
 v4bBHOObommyCNSwlKbezknANoDRFYsmrV9NQbLMUW+Zp3YAMhqGDa3ZqpZdNvy4KG7gQ3Ov6T
 YM2Bk2tXhOfGa8D6X4IddPhhc0vh18AbRt4kv3TjDYhIm+t9dwl1R2d8d0P5azv7CxmCbWlLhN
 6pFViN5H6FpMm9HXB2yKQk88jwwV9VJcJtMN+5Jtkik2cy4NjY3CKL8JL6qXOUmXa6gHIuczce
 K5w=
X-SBRS: 5.1
X-MesageID: 44745591
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:s3Gyoq/gv3zs8gQ3zrZuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re5cjztCWE7gr5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtBD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.82,334,1613451600"; 
   d="scan'208";a="44745591"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/3] x86/cpuid: Rework HLE and RTM handling
Date: Thu, 27 May 2021 14:25:17 +0100
Message-ID: <20210527132519.21730-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210527132519.21730-1-andrew.cooper3@citrix.com>
References: <20210527132519.21730-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The TAA mitigation offered the option to hide the HLE and RTM CPUID bits,
which has caused some migration compatibility problems.

These two bits are special.  Annotate them with ! to emphasise this point.

Hardware Lock Elision (HLE) may or may not be visible in CPUID, but is
disabled in microcode on all CPUs, and has been removed from the architecture.
Do not advertise it to VMs by default.

Restricted Transactional Memory (RTM) may or may not be visible in CPUID, and
may or may not be configured in force-abort mode.  Have tsx_init() note
whether RTM has been configured into force-abort mode, so
guest_common_feature_adjustments() can conditionally hide it from VMs by
default.

The host policy values for HLE/RTM may or may not be set, depending on any
previous running kernel's choice of visibility, and Xen's choice.  TSX is
available on any CPU which enumerates a TSX-hiding mechanism, so instead of
doing a two-step to clobber any hiding, scan CPUID, then set the visibility,
just force visibility of the bits in the first place.

With the HLE/RTM bits now unilaterally visible in the host policy,
xc_cpuid_apply_policy() can construct a more appropriate policy out of thin
air for pre-4.13 VMs with no CPUID data in their migration stream, and
specifically one where HLE/RTM doesn't potentially disappear behind the back
of a running VM.

Fixes: 8c4330818f6 ("x86/spec-ctrl: Mitigate the TSX Asynchronous Abort sidechannel")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/libs/guest/xg_cpuid_x86.c             |  2 ++
 xen/arch/x86/cpuid.c                        | 24 ++++++++++------------
 xen/arch/x86/spec_ctrl.c                    |  3 ---
 xen/arch/x86/tsx.c                          | 31 +++++++++++++++++++++++++++--
 xen/include/asm-x86/processor.h             |  1 +
 xen/include/public/arch-x86/cpufeatureset.h |  4 ++--
 6 files changed, 44 insertions(+), 21 deletions(-)

diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 1ebc108213..ec5a47fde4 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -511,6 +511,8 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
          * so migrated-in VM's don't risk seeing features disappearing.
          */
         p->basic.rdrand = test_bit(X86_FEATURE_RDRAND, host_featureset);
+        p->feat.hle = test_bit(X86_FEATURE_HLE, host_featureset);
+        p->feat.rtm = test_bit(X86_FEATURE_RTM, host_featureset);
 
         if ( di.hvm )
         {
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 752bf244ea..55a7b16342 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -375,6 +375,16 @@ static void __init guest_common_default_feature_adjustments(uint32_t *fs)
          boot_cpu_data.x86 == 6 && boot_cpu_data.x86_model == 0x3a &&
          cpu_has_rdrand && !is_forced_cpu_cap(X86_FEATURE_RDRAND) )
         __clear_bit(X86_FEATURE_RDRAND, fs);
+
+    /*
+     * On certain hardware, speculative or errata workarounds can result in
+     * TSX being placed in "force-abort" mode, where it doesn't actually
+     * function as expected, but is technically compatible with the ISA.
+     *
+     * Do not advertise RTM to guests by default if it won't actually work.
+     */
+    if ( rtm_disabled )
+        __clear_bit(X86_FEATURE_RTM, fs);
 }
 
 static void __init guest_common_feature_adjustments(uint32_t *fs)
@@ -652,20 +662,6 @@ void recalculate_cpuid_policy(struct domain *d)
             __clear_bit(X86_FEATURE_SYSCALL, max_fs);
     }
 
-    /*
-     * On hardware with MSR_TSX_CTRL, the admin may have elected to disable
-     * TSX and hide the feature bits.  Migrating-in VMs may have been booted
-     * pre-mitigation when the TSX features were visbile.
-     *
-     * This situation is compatible (albeit with a perf hit to any TSX code in
-     * the guest), so allow the feature bits to remain set.
-     */
-    if ( cpu_has_tsx_ctrl )
-    {
-        __set_bit(X86_FEATURE_HLE, max_fs);
-        __set_bit(X86_FEATURE_RTM, max_fs);
-    }
-
     /* Clamp the toolstacks choices to reality. */
     for ( i = 0; i < ARRAY_SIZE(fs); i++ )
         fs[i] &= max_fs[i];
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index cd05f42394..f2782b2d55 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -1158,9 +1158,6 @@ void __init init_speculation_mitigations(void)
          ((hw_smt_enabled && opt_smt) ||
           !boot_cpu_has(X86_FEATURE_SC_VERW_IDLE)) )
     {
-        setup_clear_cpu_cap(X86_FEATURE_HLE);
-        setup_clear_cpu_cap(X86_FEATURE_RTM);
-
         opt_tsx = 0;
         tsx_init();
     }
diff --git a/xen/arch/x86/tsx.c b/xen/arch/x86/tsx.c
index 39e483640a..e09e819dce 100644
--- a/xen/arch/x86/tsx.c
+++ b/xen/arch/x86/tsx.c
@@ -15,6 +15,7 @@
  */
 int8_t __read_mostly opt_tsx = -1;
 int8_t __read_mostly cpu_has_tsx_ctrl = -1;
+bool __read_mostly rtm_disabled;
 
 static int __init parse_tsx(const char *s)
 {
@@ -45,6 +46,30 @@ void tsx_init(void)
             rdmsrl(MSR_ARCH_CAPABILITIES, caps);
 
         cpu_has_tsx_ctrl = !!(caps & ARCH_CAPS_TSX_CTRL);
+
+        /*
+         * The TSX features (HLE/RTM) are handled specially.  They both
+         * enumerate features but, on certain parts, have mechanisms to be
+         * hidden without disrupting running software.
+         *
+         * At the moment, we're running in an unknown context (WRT hiding -
+         * particularly if another fully fledged kernel ran before us) and
+         * depending on user settings, may elect to continue hiding them from
+         * native CPUID instructions.
+         *
+         * Xen doesn't use TSX itself, but use cpu_has_{hle,rtm} for various
+         * system reasons, mostly errata detection, so the meaning is more
+         * useful as "TSX infrastructure available", as opposed to "features
+         * advertised and working".
+         *
+         * Force the features to be visible in Xen's view if we see any of the
+         * infrastructure capable of hiding them.
+         */
+        if ( cpu_has_tsx_ctrl )
+        {
+            setup_force_cpu_cap(X86_FEATURE_HLE);
+            setup_force_cpu_cap(X86_FEATURE_RTM);
+        }
     }
 
     if ( cpu_has_tsx_ctrl )
@@ -53,9 +78,11 @@ void tsx_init(void)
 
         rdmsrl(MSR_TSX_CTRL, val);
 
+        /* Check bottom bit only.  Higher bits are various sentinels. */
+        rtm_disabled = !(opt_tsx & 1);
+
         val &= ~(TSX_CTRL_RTM_DISABLE | TSX_CTRL_CPUID_CLEAR);
-        /* Check bottom bit only.  Higher bits are various sentinals. */
-        if ( !(opt_tsx & 1) )
+        if ( rtm_disabled )
             val |= TSX_CTRL_RTM_DISABLE | TSX_CTRL_CPUID_CLEAR;
 
         wrmsrl(MSR_TSX_CTRL, val);
diff --git a/xen/include/asm-x86/processor.h b/xen/include/asm-x86/processor.h
index 83143d4df8..bc4dc69253 100644
--- a/xen/include/asm-x86/processor.h
+++ b/xen/include/asm-x86/processor.h
@@ -627,6 +627,7 @@ static inline uint8_t get_cpu_family(uint32_t raw, uint8_t *model,
 }
 
 extern int8_t opt_tsx, cpu_has_tsx_ctrl;
+extern bool rtm_disabled;
 void tsx_init(void);
 
 enum ap_boot_method {
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index c42f56bdd4..b65af42436 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -197,14 +197,14 @@ XEN_CPUFEATURE(FSGSBASE,      5*32+ 0) /*A  {RD,WR}{FS,GS}BASE instructions */
 XEN_CPUFEATURE(TSC_ADJUST,    5*32+ 1) /*S  TSC_ADJUST MSR available */
 XEN_CPUFEATURE(SGX,           5*32+ 2) /*   Software Guard extensions */
 XEN_CPUFEATURE(BMI1,          5*32+ 3) /*A  1st bit manipulation extensions */
-XEN_CPUFEATURE(HLE,           5*32+ 4) /*A  Hardware Lock Elision */
+XEN_CPUFEATURE(HLE,           5*32+ 4) /*!a Hardware Lock Elision */
 XEN_CPUFEATURE(AVX2,          5*32+ 5) /*A  AVX2 instructions */
 XEN_CPUFEATURE(FDP_EXCP_ONLY, 5*32+ 6) /*!  x87 FDP only updated on exception. */
 XEN_CPUFEATURE(SMEP,          5*32+ 7) /*S  Supervisor Mode Execution Protection */
 XEN_CPUFEATURE(BMI2,          5*32+ 8) /*A  2nd bit manipulation extensions */
 XEN_CPUFEATURE(ERMS,          5*32+ 9) /*A  Enhanced REP MOVSB/STOSB */
 XEN_CPUFEATURE(INVPCID,       5*32+10) /*H  Invalidate Process Context ID */
-XEN_CPUFEATURE(RTM,           5*32+11) /*A  Restricted Transactional Memory */
+XEN_CPUFEATURE(RTM,           5*32+11) /*!A Restricted Transactional Memory */
 XEN_CPUFEATURE(PQM,           5*32+12) /*   Platform QoS Monitoring */
 XEN_CPUFEATURE(NO_FPU_SEL,    5*32+13) /*!  FPU CS/DS stored as zero */
 XEN_CPUFEATURE(MPX,           5*32+14) /*s  Memory Protection Extensions */
-- 
2.11.0


