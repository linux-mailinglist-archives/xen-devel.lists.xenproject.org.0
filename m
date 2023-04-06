Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 816326D9826
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 15:28:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518897.805891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkPe3-0002qJ-Nl; Thu, 06 Apr 2023 13:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518897.805891; Thu, 06 Apr 2023 13:27:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkPe3-0002nj-KN; Thu, 06 Apr 2023 13:27:19 +0000
Received: by outflank-mailman (input) for mailman id 518897;
 Thu, 06 Apr 2023 13:27:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3yY=75=citrix.com=prvs=453e3c94d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pkPe1-0002nd-NT
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 13:27:17 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be64ea88-d47e-11ed-85db-49a42c6b2330;
 Thu, 06 Apr 2023 15:27:16 +0200 (CEST)
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
X-Inumbo-ID: be64ea88-d47e-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680787635;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=y04BQ2DKaMiAf2Lo6AP/11T/yXr87e1AoI+G7Y+pvh8=;
  b=gtpOmiZhOxC1QASDeIUsvNOuwTUe/xnG2a4eXMH2FBM+Rw/gEC14B3An
   MOVDxiodNgVukL9yK1+NouaA8zXOc/+bYCO0DKb6nGFD3ppq1YTh+om29
   65U/Yx/ZOyChynkZbQW7f+sKHcQKsdK+pK1CxEHgqCMeSB/6+T/HunqNW
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 104973764
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:U9UVuasLZ48MXQVn4538a63OrOfnVCleMUV32f8akzHdYApBsoF/q
 tZmKW+FaazeamGmeIgnPYu+oE1XusDcyNFiHARtqi03Ei4W+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5AOGySFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwFA8WdB+t2v2P2b+JWMNjr+syD8/EFdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw/
 zqarjuiXU9GXDCZ4WGMqjXzjOXKpx3yZK41EIyb1/9Xv1LGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8UYwgyQzqvf4y6CG3MJCDVGbbQOq8seVTEsk
 FiTkLvU6SdH6ePPDyjHr/HN8G30YHJORYMfWcMaZTc6+MPsjtwstwvCfMRJH4ean/7zNhill
 lhmsxMCa6UvYd8jjvvrpQ+d3mjx/fAlXSZuuFyJAzvNAhdRIdf8Otf2sQWzAeNodt7xc7WXg
 JQTdyFyBsgqBIrFqiGCSf5l8FqBt6fca220bbKC8vAcG9WRF52LJ9o4DMlWfhsBDyr9UWaBj
 LXvkQ1Q/oRPG3ChcLV6ZYm8Y+xzk/i4So20CKGLM4MSCnSUSONg1Hg3DXN8Iki3yBR8+U3BE
 czznTmQ4YYyVv08kWveqxY12r433CEurV7uqWTA503/i9K2PSfFIYrpxXPSNojVGovY+lSKm
 zueXuPWoyhivBrWOHWPrtRNcwFUdRDWx/ne8qRqSwJKGSI+cElJNhMb6ehJl1BN90iNqtr1w
 w==
IronPort-HdrOrdr: A9a23:zxa8BKqBkzZArzFf3gdDDgUaV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-IronPort-AV: E=Sophos;i="5.98,323,1673931600"; 
   d="scan'208";a="104973764"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/svm: Provide EXITINFO decodes for Exceptions/NPT intercepts
Date: Thu, 6 Apr 2023 14:27:08 +0100
Message-ID: <20230406132708.2251000-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Exceptions and NPT intercepts almost have the same layout, but NPT has bits
above 31 in the error code, and the name for exitinfo2 really does want
distinguishing between cr2 and gpa.

In nsvm_vcpu_vmexit_inject() rearrange VMEXIT_NPF to fall through instead of
repeating the exitinfo1 write.  Use the fallthrough pseudo keyword instead of
a comment.

In VMEXIT_NPF, as we're editing the printk() anyway, switch to using the newer
domain_crash() form.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hvm/svm/nestedsvm.c        |  9 +++------
 xen/arch/x86/hvm/svm/svm.c              | 23 ++++++++++-------------
 xen/arch/x86/include/asm/hvm/svm/vmcb.h | 10 ++++++++++
 3 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 2003f28f66f4..51e437e73a20 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -824,14 +824,11 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
                 ns_vmcb->exit_int_info = ns_vmcb->event_inj;
             break;
         case VMEXIT_EXCEPTION_PF:
-            ns_vmcb->_cr2 = ns_vmcb->exitinfo2;
-            /* fall through */
+            ns_vmcb->_cr2 = ns_vmcb->ei.exc.cr2;
+            fallthrough;
         case VMEXIT_NPF:
-            /* PF error code */
-            ns_vmcb->exitinfo1 = svm->ns_vmexit.exitinfo1;
-            /* fault address */
             ns_vmcb->exitinfo2 = svm->ns_vmexit.exitinfo2;
-            break;
+            fallthrough;
         case VMEXIT_EXCEPTION_NP:
         case VMEXIT_EXCEPTION_SS:
         case VMEXIT_EXCEPTION_GP:
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 1b32ef77b643..17359047b396 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2808,9 +2808,9 @@ void svm_vmexit_handler(void)
 
     case VMEXIT_EXCEPTION_PF:
     {
-        unsigned long va;
-        va = vmcb->exitinfo2;
-        regs->error_code = vmcb->exitinfo1;
+        unsigned long va = vmcb->ei.exc.cr2;
+
+        regs->error_code = vmcb->ei.exc.ec;
         HVM_DBG_LOG(DBG_LEVEL_VMMU,
                     "eax=%lx, ebx=%lx, ecx=%lx, edx=%lx, esi=%lx, edi=%lx",
                     regs->rax, regs->rbx, regs->rcx,
@@ -2838,7 +2838,7 @@ void svm_vmexit_handler(void)
 
     case VMEXIT_EXCEPTION_AC:
         HVMTRACE_1D(TRAP, X86_EXC_AC);
-        hvm_inject_hw_exception(X86_EXC_AC, vmcb->exitinfo1);
+        hvm_inject_hw_exception(X86_EXC_AC, vmcb->ei.exc.ec);
         break;
 
     case VMEXIT_EXCEPTION_UD:
@@ -3051,18 +3051,15 @@ void svm_vmexit_handler(void)
     case VMEXIT_NPF:
         if ( cpu_has_svm_decode )
             v->arch.hvm.svm.cached_insn_len = vmcb->guest_ins_len & 0xf;
-        rc = vmcb->exitinfo1 & PFEC_page_present
-             ? p2m_pt_handle_deferred_changes(vmcb->exitinfo2) : 0;
+        rc = vmcb->ei.npt.ec & PFEC_page_present
+             ? p2m_pt_handle_deferred_changes(vmcb->ei.npt.gpa) : 0;
         if ( rc == 0 )
             /* If no recal adjustments were being made - handle this fault */
-            svm_do_nested_pgfault(v, regs, vmcb->exitinfo1, vmcb->exitinfo2);
+            svm_do_nested_pgfault(v, regs, vmcb->ei.npt.ec, vmcb->ei.npt.gpa);
         else if ( rc < 0 )
-        {
-            printk(XENLOG_G_ERR
-                   "%pv: Error %d handling NPF (gpa=%08lx ec=%04lx)\n",
-                   v, rc, vmcb->exitinfo2, vmcb->exitinfo1);
-            domain_crash(v->domain);
-        }
+            domain_crash(v->domain,
+                         "%pv: Error %d handling NPF (gpa=%08lx ec=%04lx)\n",
+                         v, rc, vmcb->ei.npt.gpa, vmcb->ei.npt.ec);
         v->arch.hvm.svm.cached_insn_len = 0;
         break;
 
diff --git a/xen/arch/x86/include/asm/hvm/svm/vmcb.h b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
index 6cd1c4cfe4fa..05b3fb82bd12 100644
--- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
+++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
@@ -436,6 +436,12 @@ struct vmcb_struct {
             uint64_t exitinfo2; /* offset 0x80 */
         };
         union {
+            struct {
+                uint32_t ec; /* #NP, #SS, #GP, #PF, #AC */
+                uint32_t :32;
+
+                uint64_t cr2; /* #PF */
+            } exc;
             struct {
                 bool     in:1;
                 bool     :1;
@@ -455,6 +461,10 @@ struct vmcb_struct {
                 uint64_t :59;
                 bool     mov_insn:1; /* MOV, as opposed to LMSW, CLTS, etc */
             } mov_cr;
+            struct {
+                uint64_t ec;
+                uint64_t gpa;
+            } npt;
             struct {
                 uint16_t sel;
                 uint64_t :48;
-- 
2.30.2


