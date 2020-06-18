Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3E81FFECA
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 01:41:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jm49W-0001QS-1M; Thu, 18 Jun 2020 23:41:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZeQT=77=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jm49V-0001QM-CS
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 23:41:01 +0000
X-Inumbo-ID: 29f8c6ca-b1bd-11ea-b7bb-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29f8c6ca-b1bd-11ea-b7bb-bc764e2007e4;
 Thu, 18 Jun 2020 23:41:00 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 9FE36A30D9;
 Fri, 19 Jun 2020 01:40:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 92934A30C7;
 Fri, 19 Jun 2020 01:40:58 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id WknqXp5-8-yZ; Fri, 19 Jun 2020 01:40:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id CF581A30D9;
 Fri, 19 Jun 2020 01:40:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Y5oS8u3hbHyS; Fri, 19 Jun 2020 01:40:57 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id AA3DAA30C7;
 Fri, 19 Jun 2020 01:40:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 9CF192059A;
 Fri, 19 Jun 2020 01:40:27 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Y1ZQch1Q1ym7; Fri, 19 Jun 2020 01:40:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 0D583215FA;
 Fri, 19 Jun 2020 01:40:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id v4RaGm9zPPRR; Fri, 19 Jun 2020 01:40:21 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id D64412059A;
 Fri, 19 Jun 2020 01:40:21 +0200 (CEST)
Date: Fri, 19 Jun 2020 01:40:21 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <626789888.9820937.1592523621821.JavaMail.zimbra@cert.pl>
In-Reply-To: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
Subject: [PATCH v2 3/7] x86/vmx: add IPT cpu feature
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: add IPT cpu feature
Thread-Index: hSzh8Vr462omVBiCuz/GiNtdRkOdyBGenYvm
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Check if Intel Processor Trace feature is supported by current
processor. Define hvm_ipt_supported function.

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 xen/arch/x86/hvm/vmx/vmcs.c                 | 4 ++++
 xen/include/asm-x86/cpufeature.h            | 1 +
 xen/include/asm-x86/hvm/hvm.h               | 9 +++++++++
 xen/include/asm-x86/hvm/vmx/vmcs.h          | 1 +
 xen/include/public/arch-x86/cpufeatureset.h | 1 +
 5 files changed, 16 insertions(+)

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index ca94c2bedc..8466ccb912 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -315,6 +315,10 @@ static int vmx_init_vmcs_config(void)
         if ( opt_ept_pml )
             opt |= SECONDARY_EXEC_ENABLE_PML;
 
+        /* Check whether IPT is supported in VMX operation */
+        hvm_funcs.pt_supported = cpu_has_ipt &&
+            ( _vmx_misc_cap & VMX_MISC_PT_SUPPORTED );
+
         /*
          * "APIC Register Virtualization" and "Virtual Interrupt Delivery"
          * can be set only when "use TPR shadow" is set
diff --git a/xen/include/asm-x86/cpufeature.h b/xen/include/asm-x86/cpufeature.h
index f790d5c1f8..8d7955dd87 100644
--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -104,6 +104,7 @@
 #define cpu_has_clwb            boot_cpu_has(X86_FEATURE_CLWB)
 #define cpu_has_avx512er        boot_cpu_has(X86_FEATURE_AVX512ER)
 #define cpu_has_avx512cd        boot_cpu_has(X86_FEATURE_AVX512CD)
+#define cpu_has_ipt             boot_cpu_has(X86_FEATURE_IPT)
 #define cpu_has_sha             boot_cpu_has(X86_FEATURE_SHA)
 #define cpu_has_avx512bw        boot_cpu_has(X86_FEATURE_AVX512BW)
 #define cpu_has_avx512vl        boot_cpu_has(X86_FEATURE_AVX512VL)
diff --git a/xen/include/asm-x86/hvm/hvm.h b/xen/include/asm-x86/hvm/hvm.h
index 1eb377dd82..8c0d0ece67 100644
--- a/xen/include/asm-x86/hvm/hvm.h
+++ b/xen/include/asm-x86/hvm/hvm.h
@@ -96,6 +96,9 @@ struct hvm_function_table {
     /* Necessary hardware support for alternate p2m's? */
     bool altp2m_supported;
 
+    /* Hardware support for processor tracing? */
+    bool pt_supported;
+
     /* Hardware virtual interrupt delivery enable? */
     bool virtual_intr_delivery_enabled;
 
@@ -630,6 +633,12 @@ static inline bool hvm_altp2m_supported(void)
     return hvm_funcs.altp2m_supported;
 }
 
+/* returns true if hardware supports Intel Processor Trace */
+static inline bool hvm_pt_supported(void)
+{
+    return hvm_funcs.pt_supported;
+}
+
 /* updates the current hardware p2m */
 static inline void altp2m_vcpu_update_p2m(struct vcpu *v)
 {
diff --git a/xen/include/asm-x86/hvm/vmx/vmcs.h b/xen/include/asm-x86/hvm/vmx/vmcs.h
index 906810592f..4c81093aba 100644
--- a/xen/include/asm-x86/hvm/vmx/vmcs.h
+++ b/xen/include/asm-x86/hvm/vmx/vmcs.h
@@ -285,6 +285,7 @@ extern u64 vmx_ept_vpid_cap;
 
 #define VMX_MISC_CR3_TARGET                     0x01ff0000
 #define VMX_MISC_VMWRITE_ALL                    0x20000000
+#define VMX_MISC_PT_SUPPORTED                   0x00004000
 
 #define VMX_TSC_MULTIPLIER_MAX                  0xffffffffffffffffULL
 
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 5ca35d9d97..0d3f15f628 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -217,6 +217,7 @@ XEN_CPUFEATURE(SMAP,          5*32+20) /*S  Supervisor Mode Access Prevention */
 XEN_CPUFEATURE(AVX512_IFMA,   5*32+21) /*A  AVX-512 Integer Fused Multiply Add */
 XEN_CPUFEATURE(CLFLUSHOPT,    5*32+23) /*A  CLFLUSHOPT instruction */
 XEN_CPUFEATURE(CLWB,          5*32+24) /*A  CLWB instruction */
+XEN_CPUFEATURE(IPT,           5*32+25) /*   Intel Processor Trace */
 XEN_CPUFEATURE(AVX512PF,      5*32+26) /*A  AVX-512 Prefetch Instructions */
 XEN_CPUFEATURE(AVX512ER,      5*32+27) /*A  AVX-512 Exponent & Reciprocal Instrs */
 XEN_CPUFEATURE(AVX512CD,      5*32+28) /*A  AVX-512 Conflict Detection Instrs */
-- 
2.20.1


