Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9600836B863
	for <lists+xen-devel@lfdr.de>; Mon, 26 Apr 2021 19:54:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117860.223787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb5RV-0005gc-W3; Mon, 26 Apr 2021 17:54:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117860.223787; Mon, 26 Apr 2021 17:54:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb5RV-0005gC-OM; Mon, 26 Apr 2021 17:54:45 +0000
Received: by outflank-mailman (input) for mailman id 117860;
 Mon, 26 Apr 2021 17:54:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rjXZ=JX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lb5RU-0005en-Ax
 for xen-devel@lists.xenproject.org; Mon, 26 Apr 2021 17:54:44 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5bb7c0a9-7076-49e0-b2e9-00c1037efc58;
 Mon, 26 Apr 2021 17:54:43 +0000 (UTC)
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
X-Inumbo-ID: 5bb7c0a9-7076-49e0-b2e9-00c1037efc58
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619459683;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yf7x/q/ho2Rnc9G0Aw34AN0uVo0SC6wFmv3rxC78ogg=;
  b=SKw3C0ThoAMi9E8AA8CQd4AaQAaW+A4nAQByuTZ4Nr25xMl+vAGKChav
   8pihSe+6tItA3dm/KlJH7oHjA/zjCuG6swpZRha9EmM3yUaJWXSP8uqwq
   EfWxyu+IDZCGPhRN1wCw7E+1k+NecXW2Vcco9mr59tefgBUROH6kpShQG
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: BdEPhuNVyXveWMoxan8Skh0bqQw1Rt4PsN/rSsVCQ6DOUhN8B5uyPSfzLfTIXszlKZFdgsQDvv
 RfA1i3iOmsdktmqMzS2lxoIePpik6Nf1334p1A+99kiJfG4ssFE87xePkhUi2uD6yGBfv/ko42
 uzQuHGs5flLddc9HQbgeHZ4BMnUYOFOWqrcQ65VYQLjf0EP3Ngv1I0B3yeWOMHv8bnivfai1GV
 u+10UzVj5CoQzmO4nEsFcMyEd6oEGxLsolGiy/djARAoY+yxQE6PO62PkvK8h9oRRTqYBLVNHv
 uHo=
X-SBRS: 4.0
X-MesageID: 42553819
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:WyJkzqsYvVnDBVBRHET57gNV7skD89V00zAX/kB9WHVpW+az/v
 rBoN0w0xjohDENHEw6kdebN6WaBV/a/5h54Y4eVI3SJTXOkm2uMY1k8M/e0yTtcheOkNJ1+K
 98f8FFaOHYIkN9ia/BjDWQM9Fl+9Wf9bDtuOG29QYJcShPS4VNqzh0ERyaFEoefnggObMcGI
 CH7sRK4xqMEE5nDfiTPXUOU+jdq9CjrvuPCnRqOzcd5AaDlj+u4rLheiLouis2aD9T3awktV
 HMjg2R3NTaj9iA1hTe22XPhq42pPLdzLJ4a/Cku4wwIjXohh3AXvUCZ4G/
X-IronPort-AV: E=Sophos;i="5.82,252,1613451600"; 
   d="scan'208";a="42553819"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/3] x86/svm: Enumeration for CET
Date: Mon, 26 Apr 2021 18:54:20 +0100
Message-ID: <20210426175421.30497-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210426175421.30497-1-andrew.cooper3@citrix.com>
References: <20210426175421.30497-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On CET-capable hardware, VMRUN/EXIT unconditionally swaps S_SET, SSP and
ISST (subject to cleanbits) without further settings.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hvm/svm/svm.c         |  1 +
 xen/arch/x86/hvm/svm/svmdebug.c    |  2 ++
 xen/include/asm-x86/hvm/svm/svm.h  |  2 ++
 xen/include/asm-x86/hvm/svm/vmcb.h | 10 ++++++++--
 4 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 4585efe1f8..642a64b747 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1658,6 +1658,7 @@ const struct hvm_function_table * __init start_svm(void)
     P(cpu_has_pause_filter, "Pause-Intercept Filter");
     P(cpu_has_pause_thresh, "Pause-Intercept Filter Threshold");
     P(cpu_has_tsc_ratio, "TSC Rate MSR");
+    P(cpu_has_svm_sss, "NPT Supervisor Shadow Stack");
 #undef P
 
     if ( !printed )
diff --git a/xen/arch/x86/hvm/svm/svmdebug.c b/xen/arch/x86/hvm/svm/svmdebug.c
index f450391df4..bce86f0ef7 100644
--- a/xen/arch/x86/hvm/svm/svmdebug.c
+++ b/xen/arch/x86/hvm/svm/svmdebug.c
@@ -82,6 +82,8 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
            vmcb->cstar, vmcb->sfmask);
     printk("KernGSBase = 0x%016"PRIx64" PAT = 0x%016"PRIx64"\n",
            vmcb->kerngsbase, vmcb_get_g_pat(vmcb));
+    printk("SSP = 0x%016"PRIx64" S_CET = 0x%016"PRIx64" ISST = 0x%016"PRIx64"\n",
+           vmcb->_ssp, vmcb->_msr_s_cet, vmcb->_msr_isst);
     printk("H_CR3 = 0x%016"PRIx64" CleanBits = %#x\n",
            vmcb_get_h_cr3(vmcb), vmcb->cleanbits.raw);
 
diff --git a/xen/include/asm-x86/hvm/svm/svm.h b/xen/include/asm-x86/hvm/svm/svm.h
index faeca40174..bee939156f 100644
--- a/xen/include/asm-x86/hvm/svm/svm.h
+++ b/xen/include/asm-x86/hvm/svm/svm.h
@@ -75,6 +75,7 @@ extern u32 svm_feature_flags;
 #define SVM_FEATURE_PAUSETHRESH   12 /* Pause intercept filter support */
 #define SVM_FEATURE_VLOADSAVE     15 /* virtual vmload/vmsave */
 #define SVM_FEATURE_VGIF          16 /* Virtual GIF */
+#define SVM_FEATURE_SSS           19 /* NPT Supervisor Shadow Stacks */
 
 #define cpu_has_svm_feature(f) (svm_feature_flags & (1u << (f)))
 #define cpu_has_svm_npt       cpu_has_svm_feature(SVM_FEATURE_NPT)
@@ -89,6 +90,7 @@ extern u32 svm_feature_flags;
 #define cpu_has_pause_thresh  cpu_has_svm_feature(SVM_FEATURE_PAUSETHRESH)
 #define cpu_has_tsc_ratio     cpu_has_svm_feature(SVM_FEATURE_TSCRATEMSR)
 #define cpu_has_svm_vloadsave cpu_has_svm_feature(SVM_FEATURE_VLOADSAVE)
+#define cpu_has_svm_sss       cpu_has_svm_feature(SVM_FEATURE_SSS)
 
 #define SVM_PAUSEFILTER_INIT    4000
 #define SVM_PAUSETHRESH_INIT    1000
diff --git a/xen/include/asm-x86/hvm/svm/vmcb.h b/xen/include/asm-x86/hvm/svm/vmcb.h
index 0b03a8f076..fbedea209e 100644
--- a/xen/include/asm-x86/hvm/svm/vmcb.h
+++ b/xen/include/asm-x86/hvm/svm/vmcb.h
@@ -248,6 +248,8 @@ enum VMEXIT_EXITCODE
     VMEXIT_EXCEPTION_AC  =  81, /* 0x51, alignment-check */
     VMEXIT_EXCEPTION_MC  =  82, /* 0x52, machine-check */
     VMEXIT_EXCEPTION_XF  =  83, /* 0x53, simd floating-point */
+/*  VMEXIT_EXCEPTION_20  =  84,    0x54, #VE (Intel specific) */
+    VMEXIT_EXCEPTION_CP  =  85, /* 0x55, controlflow protection */
 
     /* exceptions 20-31 (exitcodes 84-95) are reserved */
 
@@ -397,6 +399,8 @@ typedef union
         bool seg:1;        /* 8:  cs, ds, es, ss, cpl */
         bool cr2:1;        /* 9:  cr2 */
         bool lbr:1;        /* 10: debugctlmsr, last{branch,int}{to,from}ip */
+        bool :1;
+        bool cet:1;        /* 12: msr_s_set, ssp, msr_isst */
     };
     uint32_t raw;
 } vmcbcleanbits_t;
@@ -451,7 +455,7 @@ struct vmcb_struct {
             bool _sev_enable    :1;
             bool _sev_es_enable :1;
             bool _gmet          :1;
-            bool                :1;
+            bool _np_sss        :1;
             bool _vte           :1;
         };
         uint64_t _np_ctrl;
@@ -497,7 +501,9 @@ struct vmcb_struct {
     u64 rip;
     u64 res14[11];
     u64 rsp;
-    u64 res15[3];
+    u64 _msr_s_cet;             /* offset 0x400 + 0x1E0 - cleanbit 12 */
+    u64 _ssp;                   /* offset 0x400 + 0x1E8   | */
+    u64 _msr_isst;              /* offset 0x400 + 0x1F0   v */
     u64 rax;
     u64 star;
     u64 lstar;
-- 
2.11.0


