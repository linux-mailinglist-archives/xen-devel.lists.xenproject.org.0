Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E8B578C1E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 22:51:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370098.601763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDXhX-0000H2-C1; Mon, 18 Jul 2022 20:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370098.601763; Mon, 18 Jul 2022 20:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDXhX-0000ET-7c; Mon, 18 Jul 2022 20:50:47 +0000
Received: by outflank-mailman (input) for mailman id 370098;
 Mon, 18 Jul 2022 20:50:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fb5k=XX=citrix.com=prvs=1919bed39=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oDXhV-0007oP-HD
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 20:50:45 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 496ab781-06db-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 22:50:43 +0200 (CEST)
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
X-Inumbo-ID: 496ab781-06db-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658177443;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M3ArYUh3z2ooj9dIIOMDqfshLfZAVCD2iUM3rjr1Hik=;
  b=ASFmpLyZ/As0yS/bsza/FcW1zz0c10bk+AqA0/9VepjC07NIhnI5QpEc
   T3K62C/92lSd8YODAoFWeYJZiPS0SQTBb/G9RmD2CkVJDp3iuIe9Df8PP
   fsYffulA3QifdXz0eQclS4jJWvlvs4hOo+o60bLovOJtY4+C6XQp8o5jF
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 78644900
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:sANHP67SCl2smpSr5kKCcgxRtE/HchMFZxGqfqrLsTDasY5as4F+v
 jYcWTzUaayNZWOgeIpybN7io0JXsJPcm4NlHVdlqi1jHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yM6jclkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjimQc3l48sfrZ8ksw5aSq4lv0g3RlDRx1lA6G/5UqJMp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VSKlLgFVHmZkl+AsBOtiNqtC0qupvXAdJHAathZ5dlqPgqo
 DlFncTYpQ7EpcQgksxFO/VTO3kW0aGrZNYriJVw2CCe5xSuTpfi/xlhJGEUZIwBxbZTOmJl0
 vFfA2oRYE+qoNvjldpXSsE07igiBMziPYdZsXB81zDJS/0hRPgvQY2Tu4Uehm1pwJkTQ7COP
 KL1ahI2BPjESzRJNk0aF9QVm+Cwi2OkWzZZtEiUtew85G27IAlZj+izbIaEIoTiqcN9wVuG/
 Diep3/AWAAcLdnG6AuG/liCv7qa9c/8cN1LT+DpnhJwu3WMwkQDBRtQUkG0ydGboEOjX9NUK
 2QP5zEj66M18SSDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJgOtc/R/6pVwH2Zzk
 AbUwZW5XlSDrYF5V1q91O6VtAziHRMWBkgPIgReUQVayv7a9dRbYg30cjpzLEKkpoSrRG6hm
 2Hb8HJWa6Y71pBSifjilbzTq3f1/8WSEFZojunCdjj9hj6VcrJJcGBBBbLzyf9bZLiUQVCa1
 JTvs5jPtbteZX1hecHkfQnsIF1Kz6zcWNEkqQQzd6TNDhz0k5JZQahe4StlOGBiOdsedDnib
 Sf74F0MtMYNbSP7NP8nOepd7vjGK4C6TbwJsdiNNLJzjmVZLlfbrEmCm2bKt4wSrKTcuf5mY
 srKGSpdJX0bFb5m3FKLegvp6pdyn3hW7T6CGvjGI+GPi+X2iIi9FehYazNjr4kRsMu5neki2
 4wPbpfVkkoCCr2Wj+u+2dd7EG3m5EMTXfjew/G7vMbaSua6MAnN08Ps/I4=
IronPort-HdrOrdr: A9a23:p90dEaE+3eqWvCiZpLqE0seALOsnbusQ8zAXP0AYc31om6uj5r
 iTdZUgpGbJYVkqKRIdcLy7V5VoBEmskaKdgrNhW4tKPjOW2ldARbsKheCJrlHd8m/Fh4lgPM
 9bAtND4bbLbWSS4/yV3ODBKadE/OW6
X-IronPort-AV: E=Sophos;i="5.92,282,1650945600"; 
   d="scan'208";a="78644900"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 3/3] x86/spec-ctrl: Shrink further entry paths due to %rdx being 0
Date: Mon, 18 Jul 2022 21:50:09 +0100
Message-ID: <20220718205009.3557-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220718205009.3557-1-andrew.cooper3@citrix.com>
References: <20220718205009.3557-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is a continuation of the observation from:
  e9b8d31981f1 ("x86/spec-ctrl: Rework SPEC_CTRL_ENTRY_FROM_INTR_IST")
  53a570b28569 ("x86/spec-ctrl: Support IBPB-on-entry")

With %rdx known to be zero and not clobbered on the early entry path, we don't
need to re-zero it every time want to write to an MSR.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hvm/vmx/entry.S             | 4 +---
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 3 +--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/entry.S b/xen/arch/x86/hvm/vmx/entry.S
index 5f5de45a1309..392aca42b864 100644
--- a/xen/arch/x86/hvm/vmx/entry.S
+++ b/xen/arch/x86/hvm/vmx/entry.S
@@ -33,13 +33,12 @@ ENTRY(vmx_asm_vmexit_handler)
         movb $1,VCPU_vmx_launched(%rbx)
         mov  %rax,VCPU_hvm_guest_cr2(%rbx)
 
-        /* SPEC_CTRL_ENTRY_FROM_VMX    Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
+        /* SPEC_CTRL_ENTRY_FROM_VMX    Req: %rsp=regs/cpuinfo, %rdx=0, Clob: acd */
         ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_HVM
 
         .macro restore_spec_ctrl
             mov    $MSR_SPEC_CTRL, %ecx
             movzbl CPUINFO_xen_spec_ctrl(%rsp), %eax
-            xor    %edx, %edx
             wrmsr
         .endm
         ALTERNATIVE "", restore_spec_ctrl, X86_FEATURE_SC_MSR_HVM
@@ -49,7 +48,6 @@ ENTRY(vmx_asm_vmexit_handler)
         .macro restore_lbr
             mov $IA32_DEBUGCTLMSR_LBR, %eax
             mov $MSR_IA32_DEBUGCTLMSR, %ecx
-            xor %edx, %edx
             wrmsr
         .endm
         ALTERNATIVE "", restore_lbr, X86_FEATURE_XEN_LBR
diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index fab27ff5532b..61eed8510ba9 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -176,7 +176,7 @@
 .macro DO_SPEC_CTRL_ENTRY maybexen:req
 /*
  * Requires %rsp=regs (also cpuinfo if !maybexen)
- * Requires %r14=stack_end (if maybexen)
+ * Requires %r14=stack_end (if maybexen), %rdx=0
  * Clobbers %rax, %rcx, %rdx
  *
  * PV guests can't update MSR_SPEC_CTRL behind Xen's back, so no need to read
@@ -184,7 +184,6 @@
  * while entries from Xen must leave shadowing in its current state.
  */
     mov $MSR_SPEC_CTRL, %ecx
-    xor %edx, %edx
 
     /*
      * Clear SPEC_CTRL shadowing *before* loading Xen's value.  If entering
-- 
2.11.0


