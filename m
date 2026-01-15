Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4DED253C9
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 16:17:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1205291.1519614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgP62-0001C7-He; Thu, 15 Jan 2026 15:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1205291.1519614; Thu, 15 Jan 2026 15:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgP62-00019l-Ej; Thu, 15 Jan 2026 15:17:14 +0000
Received: by outflank-mailman (input) for mailman id 1205291;
 Thu, 15 Jan 2026 15:17:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rpt9=7U=bounce.vates.tech=bounce-md_30504962.696904f1.v1-cc88d528486c4ba3b4af9c7aaf14be2a@srs-se1.protection.inumbo.net>)
 id 1vgP61-00019f-9H
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 15:17:13 +0000
Received: from mail14.wdc04.mandrillapp.com (mail14.wdc04.mandrillapp.com
 [205.201.139.14]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40a15334-f225-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 16:17:06 +0100 (CET)
Received: from pmta16.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail14.wdc04.mandrillapp.com (Mailchimp) with ESMTP id 4dsRRP2W5Zz8XRwLR
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 15:17:05 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 cc88d528486c4ba3b4af9c7aaf14be2a; Thu, 15 Jan 2026 15:17:05 +0000
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
X-Inumbo-ID: 40a15334-f225-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1768490225; x=1768760225;
	bh=E4u2qur7qFOqEXURQqrbQx6Ra8vsG2nE9Sz9kh4hOSQ=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=kxbSX9UIvzX0Nbna5a+R+b6UE1bLk1Ffez+ROzGGxkLnO2yzWNoawy+Um6PgC4Q/H
	 ZTVT+n9UAeFWumA5fbphYi0oleWhk6DzdKm+Fp4g/wMjzv13Ls2sR3QV88eE8a5HH2
	 cV8fSULVjdFFNkB9F52qVjiUd0COj4JGIdSCj16atss00AhP0T7599RoX8BF01H0O+
	 UE8AUbqIzQLSqpdhzDmOxWjnHpjYb8hYf/SG3SW2BMeEjMPj9FWCtYI2ealZOGl41J
	 lO30T7cf0e9BKIrZrlp2PbokROv2SyZ47Jnh4oj5rYqCgDYuM38CywiUctFmF+MGtU
	 Nnva2MJdtgGTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1768490225; x=1768750725; i=julian.vetter@vates.tech;
	bh=E4u2qur7qFOqEXURQqrbQx6Ra8vsG2nE9Sz9kh4hOSQ=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=HbS7nfScM3qXoSz7E1wNpMx2rgzPnlNKNSibgG6QN2uSVUtuNkNKvMaQo53dSHnXu
	 kHJXsTyp/Oz263SUQKmFiwJuG15xe3Q78VUV9PQZieeEJZea2i9Zb9n/1g+/4Rz3sI
	 dVcoXVAIEWtP2RCUGgoM4FoTmNXZNNL/+z8dWOc74Ph4ndnx5d0PuQV1TGUfS/6uyZ
	 5gM6GwYlFUvCuelkWEaoOkNMULVeJd22E3JT7xDGEU1Lit13kMQW9XGyWj07NVQwRa
	 k4mDKCpsjWwM6fT6q/lefTP2zGu4w0VVaT/BXiOXNLKsBuCZc1cRa+FPsnm3l1QjdL
	 vvGW8+U6ekVBw==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20xen:=20Move=20NX=20handling=20to=20a=20dedicated=20place?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1768490223908
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20260115151658.3725784-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.cc88d528486c4ba3b4af9c7aaf14be2a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260115:md
Date: Thu, 15 Jan 2026 15:17:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Currently the CONFIG_REQUIRE_NX prevents booting XEN, if NX is disabled
in the BIOS. AMD doesn't have a software-accessible MSR to re-enable it,
so there is nothing we can do. The system is going to die anyway. But on
Intel NX might just be hidden via IA32_MISC_ENABLE.XD_DISABLE. But the
function to re-enable it is called after the check + panic in
efi_arch_cpu. So, this patch removes the early check and moves the
entire NX handling into a dedicated place.

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
---
 xen/arch/x86/boot/head.S         | 56 --------------------------------
 xen/arch/x86/boot/trampoline.S   |  5 ++-
 xen/arch/x86/cpu/intel.c         |  4 ---
 xen/arch/x86/efi/efi-boot.h      | 12 -------
 xen/arch/x86/include/asm/setup.h |  2 ++
 xen/arch/x86/setup.c             | 46 ++++++++++++++++++++++++++
 6 files changed, 50 insertions(+), 75 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 77bb7a9e21..7fb7fb1351 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -133,7 +133,6 @@ multiboot2_header:
 .Lbad_ldr_nbs: .asciz "ERR: Bootloader shutdown EFI x64 boot services!"
 .Lbad_efi_msg: .asciz "ERR: EFI IA-32 platforms are not supported!"
 .Lbag_alg_msg: .asciz "ERR: Xen must be loaded at a 2Mb boundary!"
-.Lno_nx_msg:   .asciz "ERR: Not an NX-capable CPU!"
 
         .section .init.data, "aw", @progbits
         .subsection 1 /* Put data here after the page tables (in x86_64.S). */
@@ -165,11 +164,6 @@ early_error: /* Here to improve the disassembly. */
 .Lnot_aligned:
         mov     $sym_offs(.Lbag_alg_msg), %ecx
         jmp     .Lget_vtb
-#ifdef CONFIG_REQUIRE_NX
-.Lno_nx:
-        mov     $sym_offs(.Lno_nx_msg), %ecx
-        jmp     .Lget_vtb
-#endif
 .Lmb2_no_bs:
         /*
          * Ditto. Additionally, here there is a chance that Xen was started
@@ -547,56 +541,6 @@ trampoline_setup:
         bt      $cpufeat_bit(X86_FEATURE_LM),%edx
         jnc     .Lbad_cpu
 
-        /*
-         * Check for NX
-         *   - If Xen was compiled requiring it simply assert it's
-         *     supported. The trampoline already has the right constant.
-         *   - Otherwise, update the trampoline EFER mask accordingly.
-         */
-        bt      $cpufeat_bit(X86_FEATURE_NX), %edx
-        jc     .Lgot_nx
-
-        /*
-         * NX appears to be unsupported, but it might be hidden.
-         *
-         * The feature is part of the AMD64 spec, but the very first Intel
-         * 64bit CPUs lacked the feature, and thereafter there was a
-         * firmware knob to disable the feature. Undo the disable if
-         * possible.
-         *
-         * All 64bit Intel CPUs support this MSR. If virtualised, expect
-         * the hypervisor to either emulate the MSR or give us NX.
-         */
-        xor     %eax, %eax
-        cpuid
-        cmp     $X86_VENDOR_INTEL_EBX, %ebx
-        jnz     .Lno_nx
-        cmp     $X86_VENDOR_INTEL_EDX, %edx
-        jnz     .Lno_nx
-        cmp     $X86_VENDOR_INTEL_ECX, %ecx
-        jnz     .Lno_nx
-
-        /* Clear the XD_DISABLE bit */
-        mov     $MSR_IA32_MISC_ENABLE, %ecx
-        rdmsr
-        btr     $2, %edx
-        jnc     .Lno_nx
-        wrmsr
-        orb     $MSR_IA32_MISC_ENABLE_XD_DISABLE >> 32, 4 + sym_esi(trampoline_misc_enable_off)
-
-        /* Check again for NX */
-        mov     $0x80000001, %eax
-        cpuid
-        bt      $cpufeat_bit(X86_FEATURE_NX), %edx
-        jnc     .Lno_nx
-
-.Lgot_nx:
-#ifndef CONFIG_REQUIRE_NX
-        /* Adjust EFER given that NX is present */
-        orb     $EFER_NXE >> 8, 1 + sym_esi(trampoline_efer)
-.Lno_nx:
-#endif
-
         /* Stash TSC to calculate a good approximation of time-since-boot */
         rdtsc
         mov     %eax,     sym_esi(boot_tsc_stamp)
diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoline.S
index a92e399fbe..8e8d50cbdf 100644
--- a/xen/arch/x86/boot/trampoline.S
+++ b/xen/arch/x86/boot/trampoline.S
@@ -144,10 +144,9 @@ gdt_48:
 GLOBAL(trampoline_misc_enable_off)
         .quad   0
 
-/* EFER OR-mask for boot paths.  SCE conditional on PV support, NX added when available. */
+/* EFER OR-mask for boot paths.  SCE conditional on PV support. */
 GLOBAL(trampoline_efer)
-        .long   EFER_LME | (EFER_SCE * IS_ENABLED(CONFIG_PV)) | \
-                (EFER_NXE * IS_ENABLED(CONFIG_REQUIRE_NX))
+        .long   EFER_LME | (EFER_SCE * IS_ENABLED(CONFIG_PV))
 
 GLOBAL(trampoline_xen_phys_start)
         .long   0
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index b76797cb9a..e8cf51e853 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -351,10 +351,6 @@ static void cf_check early_init_intel(struct cpuinfo_x86 *c)
 	if (c->x86 == 15 && c->x86_cache_alignment == 64)
 		c->x86_cache_alignment = 128;
 
-	if (c == &boot_cpu_data &&
-	    bootsym(trampoline_misc_enable_off) & MSR_IA32_MISC_ENABLE_XD_DISABLE)
-		printk(KERN_INFO "re-enabled NX (Execute Disable) protection\n");
-
 	intel_unlock_cpuid_leaves(c);
 
 	/* CPUID workaround for Intel 0F33/0F34 CPU */
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 0194720003..8dfd549f12 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -748,18 +748,6 @@ static void __init efi_arch_cpu(void)
     if ( (eax >> 16) == 0x8000 && eax > 0x80000000U )
     {
         caps[FEATURESET_e1d] = cpuid_edx(0x80000001U);
-
-        /*
-         * This check purposefully doesn't use cpu_has_nx because
-         * cpu_has_nx bypasses the boot_cpu_data read if Xen was compiled
-         * with CONFIG_REQUIRE_NX
-         */
-        if ( IS_ENABLED(CONFIG_REQUIRE_NX) &&
-             !boot_cpu_has(X86_FEATURE_NX) )
-            blexit(L"This build of Xen requires NX support");
-
-        if ( cpu_has_nx )
-            trampoline_efer |= EFER_NXE;
     }
 }
 
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index b01e83a8ed..16f53725ca 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -70,4 +70,6 @@ extern bool opt_dom0_msr_relaxed;
 
 #define max_init_domid (0)
 
+void nx_init(void);
+
 #endif
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 27c63d1d97..608720b717 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1119,6 +1119,50 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     return d;
 }
 
+void __init nx_init(void)
+{
+    uint64_t misc_enable;
+    uint32_t eax, ebx, ecx, edx;
+
+    if ( !boot_cpu_has(X86_FEATURE_NX) )
+    {
+        /* Intel: try to unhide NX by clearing XD_DISABLE */
+        cpuid(0, &eax, &ebx, &ecx, &edx);
+        if ( ebx == X86_VENDOR_INTEL_EBX &&
+             ecx == X86_VENDOR_INTEL_ECX &&
+             edx == X86_VENDOR_INTEL_EDX )
+        {
+            rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
+            if ( misc_enable & MSR_IA32_MISC_ENABLE_XD_DISABLE )
+            {
+                misc_enable &= ~MSR_IA32_MISC_ENABLE_XD_DISABLE;
+                wrmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
+
+                /* Re-read CPUID after having cleared XD_DISABLE */
+                boot_cpu_data.x86_capability[FEATURESET_e1d] = cpuid_edx(0x80000001U);
+
+                /* Adjust misc_enable_off for secondary startup and wakeup code */
+                bootsym(trampoline_misc_enable_off) |= MSR_IA32_MISC_ENABLE_XD_DISABLE;
+                printk(KERN_INFO "re-enabled NX (Execute Disable) protection\n");
+            }
+        }
+        /* AMD: nothing we can do - NX must be enabled in BIOS */
+    }
+
+    /* Enable EFER.NXE only if NX is available */
+    if ( boot_cpu_has(X86_FEATURE_NX) )
+    {
+        if ( !(read_efer() & EFER_NXE) )
+            write_efer(read_efer() | EFER_NXE);
+
+        /* Adjust trampoline_efer for secondary startup and wakeup code */
+        bootsym(trampoline_efer) |= EFER_NXE;
+    }
+
+    if ( IS_ENABLED(CONFIG_REQUIRE_NX) && !boot_cpu_has(X86_FEATURE_NX) )
+        panic("This build of Xen requires NX support\n");
+}
+
 /* How much of the directmap is prebuilt at compile time. */
 #define PREBUILT_MAP_LIMIT (1 << L2_PAGETABLE_SHIFT)
 
@@ -1159,6 +1203,8 @@ void asmlinkage __init noreturn __start_xen(void)
     rdmsrl(MSR_EFER, this_cpu(efer));
     asm volatile ( "mov %%cr4,%0" : "=r" (info->cr4) );
 
+    nx_init();
+
     /* Enable NMIs.  Our loader (e.g. Tboot) may have left them disabled. */
     enable_nmis();
 
-- 
2.51.0



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


