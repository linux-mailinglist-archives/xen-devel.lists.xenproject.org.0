Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D0736B864
	for <lists+xen-devel@lfdr.de>; Mon, 26 Apr 2021 19:54:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117861.223795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb5RW-0005hg-B9; Mon, 26 Apr 2021 17:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117861.223795; Mon, 26 Apr 2021 17:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb5RW-0005ga-2y; Mon, 26 Apr 2021 17:54:46 +0000
Received: by outflank-mailman (input) for mailman id 117861;
 Mon, 26 Apr 2021 17:54:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rjXZ=JX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lb5RU-0005es-MX
 for xen-devel@lists.xenproject.org; Mon, 26 Apr 2021 17:54:44 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a46a4116-aa03-4c51-b5b0-ef4f7482ef01;
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
X-Inumbo-ID: a46a4116-aa03-4c51-b5b0-ef4f7482ef01
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619459683;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yqRxPvsEyspJLb30NiO614S66+MdC18nJNcU+EsvAWo=;
  b=TRQ4df8BOE7T37aYoz0KoJHXfTARwYWs5tfx4S97Nr2/mjthmwmZgb3O
   jGLzZD28ms+lRBch0KcLH7oPhG/Wl++5w9TvCwRxDE32B4xgpgyRT0pkS
   FnChvVfN/LdMZ0R+7+mXLL/dPZBmPzUNkmS5fWGUJs3+ZIrIs3Hi0hCph
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: VsSjowmybIBQmp1G3dUWjFn+rApumEg143mCIcQqeFbYYJlzc4dmRCY1ssfZNWKo2xOcEKMBXy
 sI3oAVuZ/2j+p9GAZFId8epyOBPznTKkAzXQHVG2wDJRu9QFr347HoltphRavfvBdzCRT0s4K9
 N6r9hQiUw5cSv+O+oBOj3Fu2XkYfewQUEgajxs8DAGZmfofyvUbAm7NNtHRT9GTEhrAIK0R0xk
 FIDwmbDP1HExEZCAJ21CLZr5RpS93ETupiD8mghCcLhHOzqkqL1ZUdvSvS/z0DiGq6Yuyw3bNh
 rDI=
X-SBRS: 4.0
X-MesageID: 42818490
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:xC3EUaqOJWPVvhJEc0n+/igaV5qseYIsi2QD101hICF9WObwra
 GTtd4c0gL5jytUZWopnsqONLLFbXTX85N05od5B8bbYCDNvmy0IIZ+qbbz2jGIIVyGysdx3b
 ptGpIOa+HYIkN9ia/BjzWQM9Fl+9Wf9bDtuOG29QYIcShPS4VNqzh0ERyaFEoefnghObMcGI
 CH7sRK4xqMEE5nDPiTPXUOU+jdq9CjrvuPCnRqayIP0wWAgSil77T3CXGjr3AjeghC3Ks49i
 z9mxH5j5/TyM2T8APW1GPY8v1t+OfJ990rPqKxo/lQDj3tjwqyDb4RPoG/gA==
X-IronPort-AV: E=Sophos;i="5.82,252,1613451600"; 
   d="scan'208";a="42818490"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/3] x86/hvm: Introduce experimental guest CET support
Date: Mon, 26 Apr 2021 18:54:19 +0100
Message-ID: <20210426175421.30497-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210426175421.30497-1-andrew.cooper3@citrix.com>
References: <20210426175421.30497-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

For now, let VMs opt into using CET by setting cet_ss/ibt in the CPUID
policy.  Also extend cr4 handling to permit CR4.CET being set, along with
logic to interlock CR4.CET and CR0.WP.

Everything else will malfunction for now, but this will help adding support
incrementally - there is a lot to do before CET will work properly.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hvm/hvm.c                      | 18 ++++++++++++++++--
 xen/include/public/arch-x86/cpufeatureset.h |  4 ++--
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index ae37bc434a..28beacc45b 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -976,11 +976,12 @@ const char *hvm_efer_valid(const struct vcpu *v, uint64_t value,
 unsigned long hvm_cr4_guest_valid_bits(const struct domain *d)
 {
     const struct cpuid_policy *p = d->arch.cpuid;
-    bool mce, vmxe;
+    bool mce, vmxe, cet;
 
     /* Logic broken out simply to aid readability below. */
     mce  = p->basic.mce || p->basic.mca;
     vmxe = p->basic.vmx && nestedhvm_enabled(d);
+    cet  = p->feat.cet_ss || p->feat.cet_ibt;
 
     return ((p->basic.vme     ? X86_CR4_VME | X86_CR4_PVI : 0) |
             (p->basic.tsc     ? X86_CR4_TSD               : 0) |
@@ -999,7 +1000,8 @@ unsigned long hvm_cr4_guest_valid_bits(const struct domain *d)
             (p->basic.xsave   ? X86_CR4_OSXSAVE           : 0) |
             (p->feat.smep     ? X86_CR4_SMEP              : 0) |
             (p->feat.smap     ? X86_CR4_SMAP              : 0) |
-            (p->feat.pku      ? X86_CR4_PKE               : 0));
+            (p->feat.pku      ? X86_CR4_PKE               : 0) |
+            (cet              ? X86_CR4_CET               : 0));
 }
 
 static int hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
@@ -2289,6 +2291,12 @@ int hvm_set_cr0(unsigned long value, bool may_defer)
         }
     }
 
+    if ( !(value & X86_CR0_WP) && (v->arch.hvm.guest_cr[4] & X86_CR4_CET) )
+    {
+        gprintk(XENLOG_DEBUG, "Trying to clear WP with CET set\n");
+        return X86EMUL_EXCEPTION;
+    }
+
     if ( (value & X86_CR0_PG) && !(old_value & X86_CR0_PG) )
     {
         if ( v->arch.hvm.guest_efer & EFER_LME )
@@ -2444,6 +2452,12 @@ int hvm_set_cr4(unsigned long value, bool may_defer)
         }
     }
 
+    if ( (value & X86_CR4_CET) && !(v->arch.hvm.guest_cr[0] & X86_CR0_WP) )
+    {
+        gprintk(XENLOG_DEBUG, "Trying to set CET without WP\n");
+        return X86EMUL_EXCEPTION;
+    }
+
     old_cr = v->arch.hvm.guest_cr[4];
 
     if ( (value & X86_CR4_PCIDE) && !(old_cr & X86_CR4_PCIDE) &&
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index c42f56bdd4..6f94a73408 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -232,7 +232,7 @@ XEN_CPUFEATURE(UMIP,          6*32+ 2) /*S  User Mode Instruction Prevention */
 XEN_CPUFEATURE(PKU,           6*32+ 3) /*H  Protection Keys for Userspace */
 XEN_CPUFEATURE(OSPKE,         6*32+ 4) /*!  OS Protection Keys Enable */
 XEN_CPUFEATURE(AVX512_VBMI2,  6*32+ 6) /*A  Additional AVX-512 Vector Byte Manipulation Instrs */
-XEN_CPUFEATURE(CET_SS,        6*32+ 7) /*   CET - Shadow Stacks */
+XEN_CPUFEATURE(CET_SS,        6*32+ 7) /*h  CET - Shadow Stacks */
 XEN_CPUFEATURE(GFNI,          6*32+ 8) /*A  Galois Field Instrs */
 XEN_CPUFEATURE(VAES,          6*32+ 9) /*A  Vector AES Instrs */
 XEN_CPUFEATURE(VPCLMULQDQ,    6*32+10) /*A  Vector Carry-less Multiplication Instrs */
@@ -267,7 +267,7 @@ XEN_CPUFEATURE(SRBDS_CTRL,    9*32+ 9) /*   MSR_MCU_OPT_CTRL and RNGDS_MITG_DIS.
 XEN_CPUFEATURE(MD_CLEAR,      9*32+10) /*A  VERW clears microarchitectural buffers */
 XEN_CPUFEATURE(TSX_FORCE_ABORT, 9*32+13) /* MSR_TSX_FORCE_ABORT.RTM_ABORT */
 XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*a  SERIALIZE insn */
-XEN_CPUFEATURE(CET_IBT,       9*32+20) /*   CET - Indirect Branch Tracking */
+XEN_CPUFEATURE(CET_IBT,       9*32+20) /*h  CET - Indirect Branch Tracking */
 XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (used by Intel) */
 XEN_CPUFEATURE(STIBP,         9*32+27) /*A  STIBP */
 XEN_CPUFEATURE(L1D_FLUSH,     9*32+28) /*S  MSR_FLUSH_CMD and L1D flush. */
-- 
2.11.0


