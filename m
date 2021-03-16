Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDD133D901
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 17:19:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98382.186606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMCPV-0002lP-4j; Tue, 16 Mar 2021 16:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98382.186606; Tue, 16 Mar 2021 16:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMCPU-0002l0-Vz; Tue, 16 Mar 2021 16:19:08 +0000
Received: by outflank-mailman (input) for mailman id 98382;
 Tue, 16 Mar 2021 16:19:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kyr7=IO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lMCPT-0002kv-1R
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 16:19:07 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5875003-9fc3-438f-8ad6-81bc9887a3b0;
 Tue, 16 Mar 2021 16:19:05 +0000 (UTC)
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
X-Inumbo-ID: c5875003-9fc3-438f-8ad6-81bc9887a3b0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615911545;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nhAX0yyRIBSeaz93pFWYK1z2uQ1J1CjJXlWF+mLEc70=;
  b=CBhszXhJW9KtURAl6iYjZaEUe0TbavZJcUQGu+6lkywI15gGy86ArN92
   jLsxSDdlixrv1NTkmENLOw2/P+CKm4EQFheMweLPj/jwtew+oLp87/H7B
   bPK8OsrTia4RNIKRWO4iGi0ym5ePNCcjrmGuHcWK/Wa4GWCoDx6MVBPhd
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: n5BQTAtLxqxafpFEdbx0CgRATm/N9FByb1BTMPGz+5IUy/d4lXv8xcSDA6HDCkCrcpUC57TnTM
 LWI7cd38qgdJcu03Cwj2qMqqDRe8xwBAmUxwWOxran2w3OxgQpzMbzHkG2YS3dm8+WSaJNExyH
 j1s57lhe4ECcZhbjmVUp/nsWFY8CHRvGOXcNid2BlXvY3T6hRQPVWf85Uy6Xxxc4x4y4MszrOr
 uM2J+D1kt1ui6dz1+TIIqS1jMI1YdHJpZEA7IWw6cFmlWN1muk+KUGAancjA7NcLwgNChp/pt1
 8Sw=
X-SBRS: 5.1
X-MesageID: 39404104
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:9rE3+q4hZN5th5CqIQPXwE/XdLJzesId70hD6mlaY3VuE/Cwvc
 aogfgdyFvIkz4XQn4tgpStP6OHTHPa+/dOkPEsFJ2lWxTrv3btEZF64eLZskTdMgD36+I179
 YCT4FQE9v1ZGIUse/b502CH88k0J279smT9IPj5lNMaS0vVK169Qd+DW+gYytLbS1LH4AwGp
 bZxucvnUvDRV0tYs62BmYIUoH4zrWh/v+LXTc8CxEq8wWIhz+zgYSKdCSw5RsCTyhJhY4r7G
 mtqX2D2oyYr/q5xhXAvlWy071qnrLapOdrNYipgsgRJi6EsHfMWLhc
X-IronPort-AV: E=Sophos;i="5.81,251,1610427600"; 
   d="scan'208";a="39404104"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Ian Jackson <iwj@xenproject.org>
Subject: [PATCH 2/3] x86/msr: Forward port XSA-351 changes from 4.14
Date: Tue, 16 Mar 2021 16:18:43 +0000
Message-ID: <20210316161844.1658-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210316161844.1658-1-andrew.cooper3@citrix.com>
References: <20210316161844.1658-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

staging was not impacted by XSA-351 at the time of release, due to c/s
322ec7c89f and 84e848fd7a which disallows read access by default.

Forward port the XSA-351 changes to make the code structure consistent between
4.14 and 4.15.

This removes logspew for guests probing for the RAPL interface.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>
CC: Ian Jackson <iwj@xenproject.org>

Technically this breaks Solaris/turbostat insofar as you can no longer use
msr_relaxed to "fix" the guest.  The subsequent patch will unbreak it
differently.

For 4.15.  Restoring behaviour closer to 4.14, and prereq for a bugfix needing
backporting.
---
 xen/arch/x86/msr.c              | 19 +++++++++++++++++++
 xen/include/asm-x86/msr-index.h | 39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index c3a988bd11..5927b6811b 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -188,6 +188,13 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
     case MSR_TSX_CTRL:
     case MSR_MCU_OPT_CTRL:
     case MSR_RTIT_OUTPUT_BASE ... MSR_RTIT_ADDR_B(7):
+    case MSR_RAPL_POWER_UNIT:
+    case MSR_PKG_POWER_LIMIT  ... MSR_PKG_POWER_INFO:
+    case MSR_DRAM_POWER_LIMIT ... MSR_DRAM_POWER_INFO:
+    case MSR_PP0_POWER_LIMIT  ... MSR_PP0_POLICY:
+    case MSR_PP1_POWER_LIMIT  ... MSR_PP1_POLICY:
+    case MSR_PLATFORM_ENERGY_COUNTER:
+    case MSR_PLATFORM_POWER_LIMIT:
     case MSR_U_CET:
     case MSR_S_CET:
     case MSR_PL0_SSP ... MSR_INTERRUPT_SSP_TABLE:
@@ -195,6 +202,8 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
     case MSR_AMD64_LWP_CBADDR:
     case MSR_PPIN_CTL:
     case MSR_PPIN:
+    case MSR_F15H_CU_POWER ... MSR_F15H_CU_MAX_POWER:
+    case MSR_AMD_RAPL_POWER_UNIT ... MSR_AMD_PKG_ENERGY_STATUS:
     case MSR_AMD_PPIN_CTL:
     case MSR_AMD_PPIN:
         goto gp_fault;
@@ -412,6 +421,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
     case MSR_INTEL_CORE_THREAD_COUNT:
     case MSR_INTEL_PLATFORM_INFO:
     case MSR_ARCH_CAPABILITIES:
+    case MSR_IA32_PERF_STATUS:
 
         /* Not offered to guests. */
     case MSR_TEST_CTRL:
@@ -419,6 +429,13 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
     case MSR_TSX_CTRL:
     case MSR_MCU_OPT_CTRL:
     case MSR_RTIT_OUTPUT_BASE ... MSR_RTIT_ADDR_B(7):
+    case MSR_RAPL_POWER_UNIT:
+    case MSR_PKG_POWER_LIMIT  ... MSR_PKG_POWER_INFO:
+    case MSR_DRAM_POWER_LIMIT ... MSR_DRAM_POWER_INFO:
+    case MSR_PP0_POWER_LIMIT  ... MSR_PP0_POLICY:
+    case MSR_PP1_POWER_LIMIT  ... MSR_PP1_POLICY:
+    case MSR_PLATFORM_ENERGY_COUNTER:
+    case MSR_PLATFORM_POWER_LIMIT:
     case MSR_U_CET:
     case MSR_S_CET:
     case MSR_PL0_SSP ... MSR_INTERRUPT_SSP_TABLE:
@@ -426,6 +443,8 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
     case MSR_AMD64_LWP_CBADDR:
     case MSR_PPIN_CTL:
     case MSR_PPIN:
+    case MSR_F15H_CU_POWER ... MSR_F15H_CU_MAX_POWER:
+    case MSR_AMD_RAPL_POWER_UNIT ... MSR_AMD_PKG_ENERGY_STATUS:
     case MSR_AMD_PPIN_CTL:
     case MSR_AMD_PPIN:
         goto gp_fault;
diff --git a/xen/include/asm-x86/msr-index.h b/xen/include/asm-x86/msr-index.h
index f2e34dd22b..49c1afdd22 100644
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -101,6 +101,38 @@
 #define MSR_RTIT_ADDR_A(n)                 (0x00000580 + (n) * 2)
 #define MSR_RTIT_ADDR_B(n)                 (0x00000581 + (n) * 2)
 
+/*
+ * Intel Runtime Average Power Limiting (RAPL) interface.  Power plane base
+ * addresses (MSR_*_POWER_LIMIT) are model specific, but have so-far been
+ * consistent since their introduction in SandyBridge.
+ *
+ * Offsets of functionality from the power plane base is architectural, but
+ * not all power planes support all functionality.
+ */
+#define MSR_RAPL_POWER_UNIT                 0x00000606
+
+#define MSR_PKG_POWER_LIMIT                 0x00000610
+#define MSR_PKG_ENERGY_STATUS               0x00000611
+#define MSR_PKG_PERF_STATUS                 0x00000613
+#define MSR_PKG_POWER_INFO                  0x00000614
+
+#define MSR_DRAM_POWER_LIMIT                0x00000618
+#define MSR_DRAM_ENERGY_STATUS              0x00000619
+#define MSR_DRAM_PERF_STATUS                0x0000061b
+#define MSR_DRAM_POWER_INFO                 0x0000061c
+
+#define MSR_PP0_POWER_LIMIT                 0x00000638
+#define MSR_PP0_ENERGY_STATUS               0x00000639
+#define MSR_PP0_POLICY                      0x0000063a
+
+#define MSR_PP1_POWER_LIMIT                 0x00000640
+#define MSR_PP1_ENERGY_STATUS               0x00000641
+#define MSR_PP1_POLICY                      0x00000642
+
+/* Intel Platform-wide power interface. */
+#define MSR_PLATFORM_ENERGY_COUNTER         0x0000064d
+#define MSR_PLATFORM_POWER_LIMIT            0x0000065c
+
 #define MSR_U_CET                           0x000006a0
 #define MSR_S_CET                           0x000006a2
 #define  CET_SHSTK_EN                       (_AC(1, ULL) <<  0)
@@ -116,10 +148,17 @@
 #define  PASID_PASID_MASK                   0x000fffff
 #define  PASID_VALID                        (_AC(1, ULL) << 31)
 
+#define MSR_F15H_CU_POWER                   0xc001007a
+#define MSR_F15H_CU_MAX_POWER               0xc001007b
+
 #define MSR_K8_VM_CR                        0xc0010114
 #define  VM_CR_INIT_REDIRECTION             (_AC(1, ULL) <<  1)
 #define  VM_CR_SVM_DISABLE                  (_AC(1, ULL) <<  4)
 
+#define MSR_AMD_RAPL_POWER_UNIT             0xc0010299
+#define MSR_AMD_CORE_ENERGY_STATUS          0xc001029a
+#define MSR_AMD_PKG_ENERGY_STATUS           0xc001029b
+
 /*
  * Legacy MSR constants in need of cleanup.  No new MSRs below this comment.
  */
-- 
2.11.0


