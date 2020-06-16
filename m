Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 101F71FB5EC
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 17:21:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlDOq-0000p0-M1; Tue, 16 Jun 2020 15:21:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xJom=75=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jlDOp-0000od-IM
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 15:21:19 +0000
X-Inumbo-ID: 0607135e-afe5-11ea-b8fa-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0607135e-afe5-11ea-b8fa-12813bfff9fa;
 Tue, 16 Jun 2020 15:21:17 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id DCE1AA2F7F;
 Tue, 16 Jun 2020 17:21:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id D1CF0A2F1B;
 Tue, 16 Jun 2020 17:21:15 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 1IX_Wv1W9EV2; Tue, 16 Jun 2020 17:21:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 3F5A9A2F7F;
 Tue, 16 Jun 2020 17:21:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id CYIsx1oo8cqH; Tue, 16 Jun 2020 17:21:15 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id D8E49A2F1B;
 Tue, 16 Jun 2020 17:21:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id C7E88214C8;
 Tue, 16 Jun 2020 17:20:44 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id UCz46vSR1JE1; Tue, 16 Jun 2020 17:20:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 3C30A215F4;
 Tue, 16 Jun 2020 17:20:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id QRbMjIWtaEP1; Tue, 16 Jun 2020 17:20:39 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 1E18C214C8;
 Tue, 16 Jun 2020 17:20:39 +0200 (CEST)
Date: Tue, 16 Jun 2020 17:20:39 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <1672321493.8765712.1592320839082.JavaMail.zimbra@cert.pl>
In-Reply-To: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
Subject: [PATCH v1 2/7] x86/vmx: add IPT cpu feature
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: add IPT cpu feature
Thread-Index: KAn5ItxMsuAqHW3ZzkheyNf1oni9hgbflCcQ
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Check if Intel Processor Trace feature is supported by current
processor. Define hvm_ipt_supported function.

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 xen/arch/x86/hvm/vmx/vmx.c                  | 24 +++++++++++++++++++++
 xen/include/asm-x86/cpufeature.h            |  1 +
 xen/include/asm-x86/hvm/hvm.h               |  9 ++++++++
 xen/include/asm-x86/hvm/vmx/vmcs.h          |  1 +
 xen/include/public/arch-x86/cpufeatureset.h |  1 +
 5 files changed, 36 insertions(+)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index ab19d9424e..a91bbdb798 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2484,6 +2484,7 @@ static bool __init has_if_pschange_mc(void)
 
 const struct hvm_function_table * __init start_vmx(void)
 {
+    u64 _vmx_misc_cap;
     set_in_cr4(X86_CR4_VMXE);
 
     if ( vmx_vmcs_init() )
@@ -2557,6 +2558,29 @@ const struct hvm_function_table * __init start_vmx(void)
         vmx_function_table.get_guest_bndcfgs = vmx_get_guest_bndcfgs;
     }
 
+    /* Check whether IPT is supported in VMX operation */
+    vmx_function_table.ipt_supported = 1;
+
+    if ( !cpu_has_ipt )
+    {
+        vmx_function_table.ipt_supported = 0;
+        printk("VMX: Missing support for Intel Processor Trace x86 feature.\n");
+    }
+
+    rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
+
+    if ( !( _vmx_misc_cap & VMX_MISC_PT_SUPPORTED ) )
+    {
+        vmx_function_table.ipt_supported = 0;
+        printk("VMX: Missing support for Intel Processor Trace in VMX operation, VMX_MISC caps: %llx\n",
+               (unsigned long long)_vmx_misc_cap);
+    }
+
+    if (vmx_function_table.ipt_supported)
+    {
+        printk("VMX: Intel Processor Trace is SUPPORTED");
+    }
+
     lbr_tsx_fixup_check();
     ler_to_fixup_check();
 
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
index 1eb377dd82..48465b6067 100644
--- a/xen/include/asm-x86/hvm/hvm.h
+++ b/xen/include/asm-x86/hvm/hvm.h
@@ -96,6 +96,9 @@ struct hvm_function_table {
     /* Necessary hardware support for alternate p2m's? */
     bool altp2m_supported;
 
+    /* Hardware support for IPT? */
+    bool ipt_supported;
+
     /* Hardware virtual interrupt delivery enable? */
     bool virtual_intr_delivery_enabled;
 
@@ -630,6 +633,12 @@ static inline bool hvm_altp2m_supported(void)
     return hvm_funcs.altp2m_supported;
 }
 
+/* returns true if hardware supports Intel Processor Trace */
+static inline bool hvm_ipt_supported(void)
+{
+    return hvm_funcs.ipt_supported;
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
index 5ca35d9d97..7cfcac451d 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -217,6 +217,7 @@ XEN_CPUFEATURE(SMAP,          5*32+20) /*S  Supervisor Mode Access Prevention */
 XEN_CPUFEATURE(AVX512_IFMA,   5*32+21) /*A  AVX-512 Integer Fused Multiply Add */
 XEN_CPUFEATURE(CLFLUSHOPT,    5*32+23) /*A  CLFLUSHOPT instruction */
 XEN_CPUFEATURE(CLWB,          5*32+24) /*A  CLWB instruction */
+XEN_CPUFEATURE(IPT,           5*32+25) /*H  Intel Processor Trace */
 XEN_CPUFEATURE(AVX512PF,      5*32+26) /*A  AVX-512 Prefetch Instructions */
 XEN_CPUFEATURE(AVX512ER,      5*32+27) /*A  AVX-512 Exponent & Reciprocal Instrs */
 XEN_CPUFEATURE(AVX512CD,      5*32+28) /*A  AVX-512 Conflict Detection Instrs */
-- 
2.20.1


