Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F66D392F8A
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 15:25:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133373.248656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmG15-0006vf-RO; Thu, 27 May 2021 13:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133373.248656; Thu, 27 May 2021 13:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmG15-0006tO-NM; Thu, 27 May 2021 13:25:39 +0000
Received: by outflank-mailman (input) for mailman id 133373;
 Thu, 27 May 2021 13:25:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9d2D=KW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lmG14-0006Vp-AW
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 13:25:38 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id acc3c51a-8119-4370-96de-e858d9f5694d;
 Thu, 27 May 2021 13:25:33 +0000 (UTC)
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
X-Inumbo-ID: acc3c51a-8119-4370-96de-e858d9f5694d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1622121933;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qWEul1M27l1E3zd/VjLDe6HsUX+pKdhbkISaVGQCUfo=;
  b=HolpBQfTK1UEM8/8ZI4HFZN6XpB9QmVxpn4yfGimtFk8BI3GygFdFQmh
   hwLLims9h7Mmb3SC/lcA9eq0d/drTVKHXHNQEit+s3zcqXdhPFcu6J/ON
   wSUbepkPmlIOhx4bdN1VtPDngV8IRgTpnkQfXAZhA5QKvaHj0smBSPfoV
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: OslH3wq/eT+OxgiMFSRtAJC3H5CmagPR9LvlkqcbGzgH9f+mTgUOmEoSiBhs1AYFkqnU+8Gu/X
 3qG1i8rXG362h/VvhDCECbEzNgt2WHdNjDEjGSQwpye0r/EMkPZXVAeENdcX/zsVwo41IHFZas
 qLPJUM6Sm0k7RVeU7hN7IUY/wLZ9gS8K2p/RwocQP0lZXFiSOSG+AqL1djctO5tsi/PbpX5c93
 E1X7H4Q7F91DO6nQVZlUmnw2xz6mIqoxgajbnbLOM56yUI8B0WgDzRRANPJ1ZUh8e0wBrGhDyV
 nbM=
X-SBRS: 5.1
X-MesageID: 44745595
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:fb7g9KBnIig7KSXlHemW55DYdb4zR+YMi2TC1yhKKCC9Ffbo7/
 xG/c5rrCMc5wxhO03I9eruBEDEewK5yXcX2/h2AV7BZniFhILAFugLhuGOrwEIWReOkdK1vZ
 0QCJSWY+eRMbEVt6jHCXGDYrMd/OU=
X-IronPort-AV: E=Sophos;i="5.82,334,1613451600"; 
   d="scan'208";a="44745595"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/3] x86/tsx: Minor cleanup and improvements
Date: Thu, 27 May 2021 14:25:18 +0100
Message-ID: <20210527132519.21730-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210527132519.21730-1-andrew.cooper3@citrix.com>
References: <20210527132519.21730-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

 * Introduce cpu_has_arch_caps and replace boot_cpu_has(X86_FEATURE_ARCH_CAPS)
 * Read CPUID data into the appropriate boot_cpu_data.x86_capability[]
   element, as subsequent changes are going to need more cpu_has_* logic.
 * Use the hi/lo MSR helpers, which substantially improves code generation.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpuid.c             |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c       |  2 +-
 xen/arch/x86/msr.c               |  2 +-
 xen/arch/x86/spec_ctrl.c         |  2 +-
 xen/arch/x86/tsx.c               | 21 ++++++++++++---------
 xen/include/asm-x86/cpufeature.h |  1 +
 6 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 55a7b16342..f3c8950aa3 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -747,7 +747,7 @@ int init_domain_cpuid_policy(struct domain *d)
      * so dom0 can turn off workarounds as appropriate.  Temporary, until the
      * domain policy logic gains a better understanding of MSRs.
      */
-    if ( is_hardware_domain(d) && boot_cpu_has(X86_FEATURE_ARCH_CAPS) )
+    if ( is_hardware_domain(d) && cpu_has_arch_caps )
         p->feat.arch_caps = true;
 
     d->arch.cpuid = p;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 1450fd1991..7e3e67fdc3 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2566,7 +2566,7 @@ static bool __init has_if_pschange_mc(void)
     if ( cpu_has_hypervisor )
         return false;
 
-    if ( boot_cpu_has(X86_FEATURE_ARCH_CAPS) )
+    if ( cpu_has_arch_caps )
         rdmsrl(MSR_ARCH_CAPABILITIES, caps);
 
     if ( caps & ARCH_CAPS_IF_PSCHANGE_MC_NO )
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index c3a988bd11..374f92b2c5 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -136,7 +136,7 @@ int init_domain_msr_policy(struct domain *d)
      * so dom0 can turn off workarounds as appropriate.  Temporary, until the
      * domain policy logic gains a better understanding of MSRs.
      */
-    if ( is_hardware_domain(d) && boot_cpu_has(X86_FEATURE_ARCH_CAPS) )
+    if ( is_hardware_domain(d) && cpu_has_arch_caps )
     {
         uint64_t val;
 
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index f2782b2d55..739b7913ff 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -885,7 +885,7 @@ void __init init_speculation_mitigations(void)
     bool cpu_has_bug_taa;
     uint64_t caps = 0;
 
-    if ( boot_cpu_has(X86_FEATURE_ARCH_CAPS) )
+    if ( cpu_has_arch_caps )
         rdmsrl(MSR_ARCH_CAPABILITIES, caps);
 
     hw_smt_enabled = check_smt_enabled();
diff --git a/xen/arch/x86/tsx.c b/xen/arch/x86/tsx.c
index e09e819dce..98ecb71a4a 100644
--- a/xen/arch/x86/tsx.c
+++ b/xen/arch/x86/tsx.c
@@ -34,15 +34,18 @@ void tsx_init(void)
 {
     /*
      * This function is first called between microcode being loaded, and CPUID
-     * being scanned generally.  Calculate from raw data whether MSR_TSX_CTRL
-     * is available.
+     * being scanned generally.  Read into boot_cpu_data.x86_capability[] for
+     * the cpu_has_* bits we care about using here.
      */
     if ( unlikely(cpu_has_tsx_ctrl < 0) )
     {
         uint64_t caps = 0;
 
-        if ( boot_cpu_data.cpuid_level >= 7 &&
-             (cpuid_count_edx(7, 0) & cpufeat_mask(X86_FEATURE_ARCH_CAPS)) )
+        if ( boot_cpu_data.cpuid_level >= 7 )
+            boot_cpu_data.x86_capability[cpufeat_word(X86_FEATURE_ARCH_CAPS)]
+                = cpuid_count_edx(7, 0);
+
+        if ( cpu_has_arch_caps )
             rdmsrl(MSR_ARCH_CAPABILITIES, caps);
 
         cpu_has_tsx_ctrl = !!(caps & ARCH_CAPS_TSX_CTRL);
@@ -74,18 +77,18 @@ void tsx_init(void)
 
     if ( cpu_has_tsx_ctrl )
     {
-        uint64_t val;
+        uint32_t hi, lo;
 
-        rdmsrl(MSR_TSX_CTRL, val);
+        rdmsr(MSR_TSX_CTRL, lo, hi);
 
         /* Check bottom bit only.  Higher bits are various sentinels. */
         rtm_disabled = !(opt_tsx & 1);
 
-        val &= ~(TSX_CTRL_RTM_DISABLE | TSX_CTRL_CPUID_CLEAR);
+        lo &= ~(TSX_CTRL_RTM_DISABLE | TSX_CTRL_CPUID_CLEAR);
         if ( rtm_disabled )
-            val |= TSX_CTRL_RTM_DISABLE | TSX_CTRL_CPUID_CLEAR;
+            lo |= TSX_CTRL_RTM_DISABLE | TSX_CTRL_CPUID_CLEAR;
 
-        wrmsrl(MSR_TSX_CTRL, val);
+        wrmsr(MSR_TSX_CTRL, lo, hi);
     }
     else if ( opt_tsx >= 0 )
         printk_once(XENLOG_WARNING
diff --git a/xen/include/asm-x86/cpufeature.h b/xen/include/asm-x86/cpufeature.h
index 33b2257888..9f5ae3aa0d 100644
--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -133,6 +133,7 @@
 #define cpu_has_avx512_vp2intersect boot_cpu_has(X86_FEATURE_AVX512_VP2INTERSECT)
 #define cpu_has_tsx_force_abort boot_cpu_has(X86_FEATURE_TSX_FORCE_ABORT)
 #define cpu_has_serialize       boot_cpu_has(X86_FEATURE_SERIALIZE)
+#define cpu_has_arch_caps       boot_cpu_has(X86_FEATURE_ARCH_CAPS)
 
 /* CPUID level 0x00000007:1.eax */
 #define cpu_has_avx_vnni        boot_cpu_has(X86_FEATURE_AVX_VNNI)
-- 
2.11.0


