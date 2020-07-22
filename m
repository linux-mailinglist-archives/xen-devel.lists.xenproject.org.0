Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6F9229A44
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 16:40:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyFuU-0000TD-R1; Wed, 22 Jul 2020 14:39:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dvI5=BB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jyFuS-0000T8-LA
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 14:39:52 +0000
X-Inumbo-ID: 320f9d31-cc29-11ea-a1c1-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 320f9d31-cc29-11ea-a1c1-12813bfff9fa;
 Wed, 22 Jul 2020 14:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595428790;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jYMazXo2Zf70+I57knJORMg8aSlo9FA3v0p9AT+pwr0=;
 b=R7PGCKBO4ic1iBfXvwzAo2rA27nrUYy3KW4uiSbSgLCbQX09e0C2d4yp
 qvTFm8nNDmx1wwFpJ5WdugiidnR4RdrhLRtrgo7RdWTdbjPGMNZmz1ilh
 qTLYRVkdaeMkX3pBLnWvWECILc9qX08Se0NJp4NxWr4YoV92FRU9uYxOe E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: mug06Q5xnHO6xDTKmPM+y8AnJvUqfBe9EeYjT7K5U3Duvx3uIoc8J6MqDkKMc3aUIqxNuIEPWy
 ugtNw/g9jpZElNGm7YiUgkTTXj7RuIGAenj0J86OUe4u8fDxlmkGymPvpdsXcL4r1ZFF2tSg0V
 S8oaGugcu8iM7/AbFk2sOUkcFEJTPcPoqVRKYMYYFqXN24MuOPeIMXxaGvlm1bDHJpEkEKL8AD
 PlOgV2CXVHKkibK57/jgR+NwJ3jteLyAl3y1r/vRthsp5KzE9vkySdMhOP6WvON/3UvYxXULel
 9ZI=
X-SBRS: 2.7
X-MesageID: 23808977
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,383,1589256000"; d="scan'208";a="23808977"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/svm: Misc coding style corrections
Date: Wed, 22 Jul 2020 15:39:29 +0100
Message-ID: <20200722143929.14191-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

These almost certainly aren't all the style issues, but the end result is
certainly far more consistent.
---
 xen/arch/x86/hvm/svm/intr.c      |  19 ++-
 xen/arch/x86/hvm/svm/nestedsvm.c | 291 +++++++++++++++++++++++----------------
 xen/arch/x86/hvm/svm/svm.c       |  76 +++++-----
 3 files changed, 225 insertions(+), 161 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 38011bd4e2..7f815d2307 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -1,6 +1,6 @@
 /*
  * intr.c: Interrupt handling for SVM.
- * Copyright (c) 2005, AMD Inc. 
+ * Copyright (c) 2005, AMD Inc.
  * Copyright (c) 2004, Intel Corporation.
  *
  * This program is free software; you can redistribute it and/or modify it
@@ -83,9 +83,12 @@ static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
 
     ASSERT(intack.source != hvm_intsrc_none);
 
-    if ( nestedhvm_enabled(v->domain) ) {
+    if ( nestedhvm_enabled(v->domain) )
+    {
         struct nestedvcpu *nv = &vcpu_nestedhvm(v);
-        if ( nv->nv_vmentry_pending ) {
+
+        if ( nv->nv_vmentry_pending )
+        {
             struct vmcb_struct *gvmcb = nv->nv_vvmcx;
 
             /* check if l1 guest injects interrupt into l2 guest via vintr.
@@ -131,7 +134,7 @@ static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
         vmcb, general1_intercepts | GENERAL1_INTERCEPT_VINTR);
 }
 
-void svm_intr_assist(void) 
+void svm_intr_assist(void)
 {
     struct vcpu *v = current;
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
@@ -151,7 +154,8 @@ void svm_intr_assist(void)
             return;
 
         intblk = hvm_interrupt_blocked(v, intack);
-        if ( intblk == hvm_intblk_svm_gif ) {
+        if ( intblk == hvm_intblk_svm_gif )
+        {
             ASSERT(nestedhvm_enabled(v->domain));
             return;
         }
@@ -167,10 +171,11 @@ void svm_intr_assist(void)
              * the l1 guest occurred.
              */
             rc = nestedsvm_vcpu_interrupt(v, intack);
-            switch (rc) {
+            switch ( rc )
+            {
             case NSVM_INTR_NOTINTERCEPTED:
                 /* Inject interrupt into 2nd level guest directly. */
-                break;	
+                break;
             case NSVM_INTR_NOTHANDLED:
             case NSVM_INTR_FORCEVMEXIT:
                 return;
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index a193d9de45..fcfccf75df 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -30,7 +30,7 @@
 
 #define NSVM_ERROR_VVMCB        1
 #define NSVM_ERROR_VMENTRY      2
- 
+
 static void
 nestedsvm_vcpu_clgi(struct vcpu *v)
 {
@@ -51,7 +51,8 @@ int nestedsvm_vmcb_map(struct vcpu *v, uint64_t vmcbaddr)
 {
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
 
-    if (nv->nv_vvmcx != NULL && nv->nv_vvmcxaddr != vmcbaddr) {
+    if ( nv->nv_vvmcx != NULL && nv->nv_vvmcxaddr != vmcbaddr )
+    {
         ASSERT(vvmcx_valid(v));
         hvm_unmap_guest_frame(nv->nv_vvmcx, 1);
         nv->nv_vvmcx = NULL;
@@ -87,24 +88,24 @@ int nsvm_vcpu_initialise(struct vcpu *v)
 
     msrpm = alloc_xenheap_pages(get_order_from_bytes(MSRPM_SIZE), 0);
     svm->ns_cached_msrpm = msrpm;
-    if (msrpm == NULL)
+    if ( msrpm == NULL )
         goto err;
     memset(msrpm, 0x0, MSRPM_SIZE);
 
     msrpm = alloc_xenheap_pages(get_order_from_bytes(MSRPM_SIZE), 0);
     svm->ns_merged_msrpm = msrpm;
-    if (msrpm == NULL)
+    if ( msrpm == NULL )
         goto err;
     memset(msrpm, 0x0, MSRPM_SIZE);
 
     nv->nv_n2vmcx = alloc_vmcb();
-    if (nv->nv_n2vmcx == NULL)
+    if ( nv->nv_n2vmcx == NULL )
         goto err;
     nv->nv_n2vmcx_pa = virt_to_maddr(nv->nv_n2vmcx);
 
     return 0;
 
-err:
+ err:
     nsvm_vcpu_destroy(v);
     return -ENOMEM;
 }
@@ -120,28 +121,33 @@ void nsvm_vcpu_destroy(struct vcpu *v)
      * in order to avoid double free of l2 vmcb and the possible memory leak
      * of l1 vmcb page.
      */
-    if (nv->nv_n1vmcx)
+    if ( nv->nv_n1vmcx )
         v->arch.hvm.svm.vmcb = nv->nv_n1vmcx;
 
-    if (svm->ns_cached_msrpm) {
+    if ( svm->ns_cached_msrpm )
+    {
         free_xenheap_pages(svm->ns_cached_msrpm,
                            get_order_from_bytes(MSRPM_SIZE));
         svm->ns_cached_msrpm = NULL;
     }
-    if (svm->ns_merged_msrpm) {
+
+    if ( svm->ns_merged_msrpm )
+    {
         free_xenheap_pages(svm->ns_merged_msrpm,
                            get_order_from_bytes(MSRPM_SIZE));
         svm->ns_merged_msrpm = NULL;
     }
+
     hvm_unmap_guest_frame(nv->nv_vvmcx, 1);
     nv->nv_vvmcx = NULL;
-    if (nv->nv_n2vmcx) {
+    if ( nv->nv_n2vmcx )
+    {
         free_vmcb(nv->nv_n2vmcx);
         nv->nv_n2vmcx = NULL;
         nv->nv_n2vmcx_pa = INVALID_PADDR;
     }
-    if (svm->ns_iomap)
-        svm->ns_iomap = NULL;
+
+    svm->ns_iomap = NULL;
 }
 
 int nsvm_vcpu_reset(struct vcpu *v)
@@ -168,8 +174,7 @@ int nsvm_vcpu_reset(struct vcpu *v)
     svm->ns_vmexit.exitinfo1 = 0;
     svm->ns_vmexit.exitinfo2 = 0;
 
-    if (svm->ns_iomap)
-        svm->ns_iomap = NULL;
+    svm->ns_iomap = NULL;
 
     nestedsvm_vcpu_stgi(v);
     return 0;
@@ -182,15 +187,21 @@ static uint64_t nestedsvm_fpu_vmentry(uint64_t n1cr0,
     uint64_t vcr0;
 
     vcr0 = vvmcb->_cr0;
-    if ( !(n1cr0 & X86_CR0_TS) && (n1vmcb->_cr0 & X86_CR0_TS) ) {
-        /* svm_fpu_leave() run while l1 guest was running.
+    if ( !(n1cr0 & X86_CR0_TS) && (n1vmcb->_cr0 & X86_CR0_TS) )
+    {
+        /*
+         * svm_fpu_leave() run while l1 guest was running.
          * Sync FPU state with l2 guest.
          */
         vcr0 |= X86_CR0_TS;
         n2vmcb->_exception_intercepts |= (1U << TRAP_no_device);
-    } else if ( !(vcr0 & X86_CR0_TS) && (n2vmcb->_cr0 & X86_CR0_TS) ) {
-        /* svm_fpu_enter() run while l1 guest was running.
-         * Sync FPU state with l2 guest. */
+    }
+    else if ( !(vcr0 & X86_CR0_TS) && (n2vmcb->_cr0 & X86_CR0_TS) )
+    {
+        /*
+         * svm_fpu_enter() run while l1 guest was running.
+         * Sync FPU state with l2 guest.
+         */
         vcr0 &= ~X86_CR0_TS;
         n2vmcb->_exception_intercepts &= ~(1U << TRAP_no_device);
     }
@@ -201,14 +212,21 @@ static uint64_t nestedsvm_fpu_vmentry(uint64_t n1cr0,
 static void nestedsvm_fpu_vmexit(struct vmcb_struct *n1vmcb,
     struct vmcb_struct *n2vmcb, uint64_t n1cr0, uint64_t guest_cr0)
 {
-    if ( !(guest_cr0 & X86_CR0_TS) && (n2vmcb->_cr0 & X86_CR0_TS) ) {
-        /* svm_fpu_leave() run while l2 guest was running.
-         * Sync FPU state with l1 guest. */
+    if ( !(guest_cr0 & X86_CR0_TS) && (n2vmcb->_cr0 & X86_CR0_TS) )
+    {
+        /*
+         * svm_fpu_leave() run while l2 guest was running.
+         * Sync FPU state with l1 guest.
+         */
         n1vmcb->_cr0 |= X86_CR0_TS;
         n1vmcb->_exception_intercepts |= (1U << TRAP_no_device);
-    } else if ( !(n1cr0 & X86_CR0_TS) && (n1vmcb->_cr0 & X86_CR0_TS) ) {
-        /* svm_fpu_enter() run while l2 guest was running.
-         * Sync FPU state with l1 guest. */
+    }
+    else if ( !(n1cr0 & X86_CR0_TS) && (n1vmcb->_cr0 & X86_CR0_TS) )
+    {
+        /*
+         * svm_fpu_enter() run while l2 guest was running.
+         * Sync FPU state with l1 guest.
+         */
         n1vmcb->_cr0 &= ~X86_CR0_TS;
         n1vmcb->_exception_intercepts &= ~(1U << TRAP_no_device);
     }
@@ -225,16 +243,17 @@ static int nsvm_vcpu_hostsave(struct vcpu *v, unsigned int inst_len)
 
     n1vmcb->rip += inst_len;
 
-    /* Save shadowed values. This ensures that the l1 guest
-     * cannot override them to break out. */
+    /*
+     * Save shadowed values. This ensures that the l1 guest
+     * cannot override them to break out.
+     */
     n1vmcb->_efer = v->arch.hvm.guest_efer;
     n1vmcb->_cr0 = v->arch.hvm.guest_cr[0];
     n1vmcb->_cr2 = v->arch.hvm.guest_cr[2];
     n1vmcb->_cr4 = v->arch.hvm.guest_cr[4];
 
     /* Remember the host interrupt flag */
-    svm->ns_hostflags.fields.rflagsif =
-        (n1vmcb->rflags & X86_EFLAGS_IF) ? 1 : 0;
+    svm->ns_hostflags.fields.rflagsif = !!(n1vmcb->rflags & X86_EFLAGS_IF);
 
     return 0;
 }
@@ -251,7 +270,8 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
     ASSERT(n1vmcb != NULL);
     ASSERT(n2vmcb != NULL);
 
-    /* nsvm_vmcb_prepare4vmexit() already saved register values
+    /*
+     * nsvm_vmcb_prepare4vmexit() already saved register values
      * handled by VMSAVE/VMLOAD into n1vmcb directly.
      */
 
@@ -264,7 +284,7 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
     rc = hvm_set_efer(n1vmcb->_efer);
     if ( rc == X86EMUL_EXCEPTION )
         hvm_inject_hw_exception(TRAP_gp_fault, 0);
-    if (rc != X86EMUL_OKAY)
+    if ( rc != X86EMUL_OKAY )
         gdprintk(XENLOG_ERR, "hvm_set_efer failed, rc: %u\n", rc);
 
     /* CR4 */
@@ -272,7 +292,7 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
     rc = hvm_set_cr4(n1vmcb->_cr4, true);
     if ( rc == X86EMUL_EXCEPTION )
         hvm_inject_hw_exception(TRAP_gp_fault, 0);
-    if (rc != X86EMUL_OKAY)
+    if ( rc != X86EMUL_OKAY )
         gdprintk(XENLOG_ERR, "hvm_set_cr4 failed, rc: %u\n", rc);
 
     /* CR0 */
@@ -283,7 +303,7 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
     rc = hvm_set_cr0(n1vmcb->_cr0 | X86_CR0_PE, true);
     if ( rc == X86EMUL_EXCEPTION )
         hvm_inject_hw_exception(TRAP_gp_fault, 0);
-    if (rc != X86EMUL_OKAY)
+    if ( rc != X86EMUL_OKAY )
         gdprintk(XENLOG_ERR, "hvm_set_cr0 failed, rc: %u\n", rc);
     svm->ns_cr0 = v->arch.hvm.guest_cr[0];
 
@@ -293,17 +313,22 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
 
     /* CR3 */
     /* Nested paging mode */
-    if (nestedhvm_paging_mode_hap(v)) {
+    if ( nestedhvm_paging_mode_hap(v) )
+    {
         /* host nested paging + guest nested paging. */
         /* hvm_set_cr3() below sets v->arch.hvm.guest_cr[3] for us. */
-    } else if (paging_mode_hap(v->domain)) {
+    }
+    else if ( paging_mode_hap(v->domain) )
+    {
         /* host nested paging + guest shadow paging. */
         /* hvm_set_cr3() below sets v->arch.hvm.guest_cr[3] for us. */
-    } else {
+    }
+    else
+    {
         /* host shadow paging + guest shadow paging. */
 
         /* Reset MMU context  -- XXX (hostrestore) not yet working*/
-        if (!pagetable_is_null(v->arch.guest_table))
+        if ( !pagetable_is_null(v->arch.guest_table) )
             put_page(pagetable_get_page(v->arch.guest_table));
         v->arch.guest_table = pagetable_null();
         /* hvm_set_cr3() below sets v->arch.hvm.guest_cr[3] for us. */
@@ -311,7 +336,7 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
     rc = hvm_set_cr3(n1vmcb->_cr3, false, true);
     if ( rc == X86EMUL_EXCEPTION )
         hvm_inject_hw_exception(TRAP_gp_fault, 0);
-    if (rc != X86EMUL_OKAY)
+    if ( rc != X86EMUL_OKAY )
         gdprintk(XENLOG_ERR, "hvm_set_cr3 failed, rc: %u\n", rc);
 
     regs->rax = n1vmcb->rax;
@@ -321,7 +346,8 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
     n1vmcb->_dr7 = 0; /* disable all breakpoints */
     n1vmcb->_cpl = 0;
 
-    /* Clear exitintinfo to prevent a fault loop of re-injecting
+    /*
+     * Clear exitintinfo to prevent a fault loop of re-injecting
      * exceptions forever.
      */
     n1vmcb->exit_int_info.raw = 0;
@@ -375,13 +401,11 @@ static int nsvm_vmrun_permissionmap(struct vcpu *v, bool_t viopm)
     nv->nv_ioportED = ioport_ed;
 
     /* v->arch.hvm.svm.msrpm has type unsigned long, thus BYTES_PER_LONG. */
-    for (i = 0; i < MSRPM_SIZE / BYTES_PER_LONG; i++)
+    for ( i = 0; i < MSRPM_SIZE / BYTES_PER_LONG; i++ )
         svm->ns_merged_msrpm[i] = arch_svm->msrpm[i] | ns_msrpm_ptr[i];
 
-    host_vmcb->_iopm_base_pa =
-        (uint64_t)virt_to_maddr(svm->ns_iomap);
-    host_vmcb->_msrpm_base_pa =
-        (uint64_t)virt_to_maddr(svm->ns_merged_msrpm);
+    host_vmcb->_iopm_base_pa  = virt_to_maddr(svm->ns_iomap);
+    host_vmcb->_msrpm_base_pa = virt_to_maddr(svm->ns_merged_msrpm);
 
     return 0;
 }
@@ -438,7 +462,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
      * below. Those cleanbits would be tracked in an integer field
      * in struct nestedsvm.
      * But this effort is not worth doing because:
-     * - Only the intercepts bit of the n1vmcb can effectively be used here 
+     * - Only the intercepts bit of the n1vmcb can effectively be used here
      * - The CPU runs more instructions for the tracking than can be
      *   safed here.
      * The overhead comes from (ordered from highest to lowest):
@@ -462,7 +486,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
         n1vmcb->_general2_intercepts | ns_vmcb->_general2_intercepts;
 
     /* Nested Pause Filter */
-    if (ns_vmcb->_general1_intercepts & GENERAL1_INTERCEPT_PAUSE)
+    if ( ns_vmcb->_general1_intercepts & GENERAL1_INTERCEPT_PAUSE )
         n2vmcb->_pause_filter_count =
             min(n1vmcb->_pause_filter_count, ns_vmcb->_pause_filter_count);
     else
@@ -473,7 +497,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
 
     /* Nested IO permission bitmaps */
     rc = nsvm_vmrun_permissionmap(v, clean.iopm);
-    if (rc)
+    if ( rc )
         return rc;
 
     /* ASID - Emulation handled in hvm_asid_handle_vmenter() */
@@ -534,7 +558,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     rc = hvm_set_efer(ns_vmcb->_efer);
     if ( rc == X86EMUL_EXCEPTION )
         hvm_inject_hw_exception(TRAP_gp_fault, 0);
-    if (rc != X86EMUL_OKAY)
+    if ( rc != X86EMUL_OKAY )
         gdprintk(XENLOG_ERR, "hvm_set_efer failed, rc: %u\n", rc);
 
     /* CR4 */
@@ -542,7 +566,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     rc = hvm_set_cr4(ns_vmcb->_cr4, true);
     if ( rc == X86EMUL_EXCEPTION )
         hvm_inject_hw_exception(TRAP_gp_fault, 0);
-    if (rc != X86EMUL_OKAY)
+    if ( rc != X86EMUL_OKAY )
         gdprintk(XENLOG_ERR, "hvm_set_cr4 failed, rc: %u\n", rc);
 
     /* CR0 */
@@ -552,7 +576,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     rc = hvm_set_cr0(cr0, true);
     if ( rc == X86EMUL_EXCEPTION )
         hvm_inject_hw_exception(TRAP_gp_fault, 0);
-    if (rc != X86EMUL_OKAY)
+    if ( rc != X86EMUL_OKAY )
         gdprintk(XENLOG_ERR, "hvm_set_cr0 failed, rc: %u\n", rc);
 
     /* CR2 */
@@ -560,7 +584,8 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     hvm_update_guest_cr(v, 2);
 
     /* Nested paging mode */
-    if (nestedhvm_paging_mode_hap(v)) {
+    if ( nestedhvm_paging_mode_hap(v) )
+    {
         /* host nested paging + guest nested paging. */
         n2vmcb->_np_enable = 1;
 
@@ -570,9 +595,11 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
         rc = hvm_set_cr3(ns_vmcb->_cr3, false, true);
         if ( rc == X86EMUL_EXCEPTION )
             hvm_inject_hw_exception(TRAP_gp_fault, 0);
-        if (rc != X86EMUL_OKAY)
+        if ( rc != X86EMUL_OKAY )
             gdprintk(XENLOG_ERR, "hvm_set_cr3 failed, rc: %u\n", rc);
-    } else if (paging_mode_hap(v->domain)) {
+    }
+    else if ( paging_mode_hap(v->domain) )
+    {
         /* host nested paging + guest shadow paging. */
         n2vmcb->_np_enable = 1;
         /* Keep h_cr3 as it is. */
@@ -584,9 +611,11 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
         rc = hvm_set_cr3(ns_vmcb->_cr3, false, true);
         if ( rc == X86EMUL_EXCEPTION )
             hvm_inject_hw_exception(TRAP_gp_fault, 0);
-        if (rc != X86EMUL_OKAY)
+        if ( rc != X86EMUL_OKAY )
             gdprintk(XENLOG_ERR, "hvm_set_cr3 failed, rc: %u\n", rc);
-    } else {
+    }
+    else
+    {
         /* host shadow paging + guest shadow paging. */
         n2vmcb->_np_enable = 0;
         n2vmcb->_h_cr3 = 0x0;
@@ -640,13 +669,15 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     n2vmcb->cleanbits.raw = 0;
 
     rc = svm_vmcb_isvalid(__func__, ns_vmcb, v, true);
-    if (rc) {
+    if ( rc )
+    {
         gdprintk(XENLOG_ERR, "virtual vmcb invalid\n");
         return NSVM_ERROR_VVMCB;
     }
 
     rc = svm_vmcb_isvalid(__func__, n2vmcb, v, true);
-    if (rc) {
+    if ( rc )
+    {
         gdprintk(XENLOG_ERR, "n2vmcb invalid\n");
         return NSVM_ERROR_VMENTRY;
     }
@@ -691,15 +722,15 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
     }
 
     /* nested paging for the guest */
-    svm->ns_hap_enabled = (ns_vmcb->_np_enable) ? 1 : 0;
+    svm->ns_hap_enabled = !!ns_vmcb->_np_enable;
 
     /* Remember the V_INTR_MASK in hostflags */
-    svm->ns_hostflags.fields.vintrmask =
-        (ns_vmcb->_vintr.fields.intr_masking) ? 1 : 0;
+    svm->ns_hostflags.fields.vintrmask = !!ns_vmcb->_vintr.fields.intr_masking;
 
     /* Save l1 guest state (= host state) */
     ret = nsvm_vcpu_hostsave(v, inst_len);
-    if (ret) {
+    if ( ret )
+    {
         gdprintk(XENLOG_ERR, "hostsave failed, ret = %i\n", ret);
         return ret;
     }
@@ -709,7 +740,8 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
     v->arch.hvm.svm.vmcb_pa = nv->nv_n2vmcx_pa;
 
     ret = nsvm_vmcb_prepare4vmrun(v, regs);
-    if (ret) {
+    if ( ret )
+    {
         gdprintk(XENLOG_ERR, "prepare4vmrun failed, ret = %i\n", ret);
         return ret;
     }
@@ -744,7 +776,8 @@ nsvm_vcpu_vmrun(struct vcpu *v, struct cpu_user_regs *regs)
      * and l1 guest keeps alive. */
     nestedhvm_vcpu_enter_guestmode(v);
 
-    switch (ret) {
+    switch ( ret )
+    {
     case 0:
         break;
     case NSVM_ERROR_VVMCB:
@@ -762,7 +795,7 @@ nsvm_vcpu_vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     }
 
     /* If l1 guest uses shadow paging, update the paging mode. */
-    if (!nestedhvm_paging_mode_hap(v))
+    if ( !nestedhvm_paging_mode_hap(v) )
         paging_update_paging_modes(v);
 
     nv->nv_vmswitch_in_progress = 0;
@@ -785,9 +818,10 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
 
     ns_vmcb = nv->nv_vvmcx;
 
-    if (nv->nv_vmexit_pending) {
-
-        switch (exitcode) {
+    if ( nv->nv_vmexit_pending )
+    {
+        switch ( exitcode )
+        {
         case VMEXIT_INTR:
             if ( unlikely(ns_vmcb->event_inj.v) && nv->nv_vmentry_pending &&
                  hvm_event_needs_reinjection(ns_vmcb->event_inj.type,
@@ -845,20 +879,20 @@ nsvm_vmcb_guest_intercepts_msr(unsigned long *msr_bitmap,
 
     msr_bit = svm_msrbit(msr_bitmap, msr);
 
-    if (msr_bit == NULL)
+    if ( msr_bit == NULL )
         /* MSR not in the permission map: Let the guest handle it. */
         return NESTEDHVM_VMEXIT_INJECT;
 
     msr &= 0x1fff;
 
-    if (write)
+    if ( write )
         /* write access */
         enabled = test_bit(msr * 2 + 1, msr_bit);
     else
         /* read access */
         enabled = test_bit(msr * 2, msr_bit);
 
-    if (!enabled)
+    if ( !enabled )
         return NESTEDHVM_VMEXIT_HOST;
 
     return NESTEDHVM_VMEXIT_INJECT;
@@ -921,41 +955,42 @@ nsvm_vmcb_guest_intercepts_exitcode(struct vcpu *v,
     struct vmcb_struct *ns_vmcb = nv->nv_vvmcx;
     enum nestedhvm_vmexits vmexits;
 
-    switch (exitcode) {
+    switch ( exitcode )
+    {
     case VMEXIT_CR0_READ ... VMEXIT_CR15_READ:
     case VMEXIT_CR0_WRITE ... VMEXIT_CR15_WRITE:
         exit_bits = 1ULL << (exitcode - VMEXIT_CR0_READ);
-        if (svm->ns_cr_intercepts & exit_bits)
+        if ( svm->ns_cr_intercepts & exit_bits )
             break;
         return 0;
 
     case VMEXIT_DR0_READ ... VMEXIT_DR7_READ:
     case VMEXIT_DR0_WRITE ... VMEXIT_DR7_WRITE:
         exit_bits = 1ULL << (exitcode - VMEXIT_DR0_READ);
-        if (svm->ns_dr_intercepts & exit_bits)
+        if ( svm->ns_dr_intercepts & exit_bits )
             break;
         return 0;
 
     case VMEXIT_EXCEPTION_DE ... VMEXIT_EXCEPTION_XF:
         exit_bits = 1ULL << (exitcode - VMEXIT_EXCEPTION_DE);
-        if (svm->ns_exception_intercepts & exit_bits)
+        if ( svm->ns_exception_intercepts & exit_bits )
             break;
         return 0;
 
     case VMEXIT_INTR ... VMEXIT_SHUTDOWN:
         exit_bits = 1ULL << (exitcode - VMEXIT_INTR);
-        if (svm->ns_general1_intercepts & exit_bits)
+        if ( svm->ns_general1_intercepts & exit_bits )
             break;
         return 0;
 
     case VMEXIT_VMRUN ... VMEXIT_XSETBV:
         exit_bits = 1ULL << (exitcode - VMEXIT_VMRUN);
-        if (svm->ns_general2_intercepts & exit_bits)
+        if ( svm->ns_general2_intercepts & exit_bits )
             break;
         return 0;
 
     case VMEXIT_NPF:
-        if (nestedhvm_paging_mode_hap(v))
+        if ( nestedhvm_paging_mode_hap(v) )
             break;
         return 0;
     case VMEXIT_INVALID:
@@ -969,7 +1004,8 @@ nsvm_vmcb_guest_intercepts_exitcode(struct vcpu *v,
     }
 
     /* Special cases: Do more detailed checks */
-    switch (exitcode) {
+    switch ( exitcode )
+    {
     case VMEXIT_MSR:
         ASSERT(regs != NULL);
         if ( !nestedsvm_vmcb_map(v, nv->nv_vvmcxaddr) )
@@ -977,7 +1013,7 @@ nsvm_vmcb_guest_intercepts_exitcode(struct vcpu *v,
         ns_vmcb = nv->nv_vvmcx;
         vmexits = nsvm_vmcb_guest_intercepts_msr(svm->ns_cached_msrpm,
             regs->ecx, ns_vmcb->exitinfo1 != 0);
-        if (vmexits == NESTEDHVM_VMEXIT_HOST)
+        if ( vmexits == NESTEDHVM_VMEXIT_HOST )
             return 0;
         break;
     case VMEXIT_IOIO:
@@ -986,7 +1022,7 @@ nsvm_vmcb_guest_intercepts_exitcode(struct vcpu *v,
         ns_vmcb = nv->nv_vvmcx;
         vmexits = nsvm_vmcb_guest_intercepts_ioio(ns_vmcb->_iopm_base_pa,
             ns_vmcb->exitinfo1);
-        if (vmexits == NESTEDHVM_VMEXIT_HOST)
+        if ( vmexits == NESTEDHVM_VMEXIT_HOST )
             return 0;
         break;
     }
@@ -1027,7 +1063,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
      */
 
     /* TSC offset */
-    /* Keep it. It's maintainted by the l1 guest. */ 
+    /* Keep it. It's maintainted by the l1 guest. */
 
     /* ASID */
     /* ns_vmcb->_guest_asid = n2vmcb->_guest_asid; */
@@ -1037,7 +1073,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
 
     /* Virtual Interrupts */
     ns_vmcb->_vintr = n2vmcb->_vintr;
-    if (!(svm->ns_hostflags.fields.vintrmask))
+    if ( !svm->ns_hostflags.fields.vintrmask )
         ns_vmcb->_vintr.fields.intr_masking = 0;
 
     /* Interrupt state */
@@ -1065,14 +1101,17 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
     ns_vmcb->event_inj.raw = 0;
 
     /* Nested paging mode */
-    if (nestedhvm_paging_mode_hap(v)) {
+    if ( nestedhvm_paging_mode_hap(v) )
+    {
         /* host nested paging + guest nested paging. */
         ns_vmcb->_np_enable = n2vmcb->_np_enable;
         ns_vmcb->_cr3 = n2vmcb->_cr3;
         /* The vmcb->h_cr3 is the shadowed h_cr3. The original
          * unshadowed guest h_cr3 is kept in ns_vmcb->h_cr3,
          * hence we keep the ns_vmcb->h_cr3 value. */
-    } else if (paging_mode_hap(v->domain)) {
+    }
+    else if ( paging_mode_hap(v->domain) )
+    {
         /* host nested paging + guest shadow paging. */
         ns_vmcb->_np_enable = 0;
         /* Throw h_cr3 away. Guest is not allowed to set it or
@@ -1081,7 +1120,9 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
         /* Stop intercepting #PF (already done above
          * by restoring cached intercepts). */
         ns_vmcb->_cr3 = n2vmcb->_cr3;
-    } else {
+    }
+    else
+    {
         /* host shadow paging + guest shadow paging. */
         ns_vmcb->_np_enable = 0;
         ns_vmcb->_h_cr3 = 0x0;
@@ -1211,12 +1252,13 @@ enum hvm_intblk nsvm_intr_blocked(struct vcpu *v)
     if ( !nestedsvm_gif_isset(v) )
         return hvm_intblk_svm_gif;
 
-    if ( nestedhvm_vcpu_in_guestmode(v) ) {
+    if ( nestedhvm_vcpu_in_guestmode(v) )
+    {
         struct vmcb_struct *n2vmcb = nv->nv_n2vmcx;
 
-        if ( svm->ns_hostflags.fields.vintrmask )
-            if ( !svm->ns_hostflags.fields.rflagsif )
-                return hvm_intblk_rflags_ie;
+        if ( svm->ns_hostflags.fields.vintrmask &&
+             !svm->ns_hostflags.fields.rflagsif )
+            return hvm_intblk_rflags_ie;
 
         /* when l1 guest passes its devices through to the l2 guest
          * and l2 guest does an MMIO access then we may want to
@@ -1237,12 +1279,11 @@ enum hvm_intblk nsvm_intr_blocked(struct vcpu *v)
         }
     }
 
-    if ( nv->nv_vmexit_pending ) {
+    if ( nv->nv_vmexit_pending )
         /* hvm_inject_hw_exception() must have run before.
          * exceptions have higher priority than interrupts.
          */
         return hvm_intblk_rflags_ie;
-    }
 
     return hvm_intblk_none;
 }
@@ -1275,9 +1316,10 @@ nestedsvm_check_intercepts(struct vcpu *v, struct cpu_user_regs *regs,
     ASSERT(vcpu_nestedhvm(v).nv_vmexit_pending == 0);
     is_intercepted = nsvm_vmcb_guest_intercepts_exitcode(v, regs, exitcode);
 
-    switch (exitcode) {
+    switch ( exitcode )
+    {
     case VMEXIT_INVALID:
-        if (is_intercepted)
+        if ( is_intercepted )
             return NESTEDHVM_VMEXIT_INJECT;
         return NESTEDHVM_VMEXIT_HOST;
 
@@ -1291,14 +1333,16 @@ nestedsvm_check_intercepts(struct vcpu *v, struct cpu_user_regs *regs,
         return NESTEDHVM_VMEXIT_HOST;
 
     case VMEXIT_NPF:
-        if (nestedhvm_paging_mode_hap(v)) {
-            if (!is_intercepted)
+        if ( nestedhvm_paging_mode_hap(v) )
+        {
+            if ( !is_intercepted )
                 return NESTEDHVM_VMEXIT_FATALERROR;
             /* host nested paging + guest nested paging */
             return NESTEDHVM_VMEXIT_HOST;
         }
-        if (paging_mode_hap(v->domain)) {
-            if (is_intercepted)
+        if ( paging_mode_hap(v->domain) )
+        {
+            if ( is_intercepted )
                 return NESTEDHVM_VMEXIT_FATALERROR;
             /* host nested paging + guest shadow paging */
             return NESTEDHVM_VMEXIT_HOST;
@@ -1306,20 +1350,21 @@ nestedsvm_check_intercepts(struct vcpu *v, struct cpu_user_regs *regs,
         /* host shadow paging + guest shadow paging */
         /* Can this happen? */
         BUG();
-        return NESTEDHVM_VMEXIT_FATALERROR;
+
     case VMEXIT_EXCEPTION_PF:
-        if (nestedhvm_paging_mode_hap(v)) {
+        if ( nestedhvm_paging_mode_hap(v) )
+        {
             /* host nested paging + guest nested paging */
-            if (!is_intercepted)
+            if ( !is_intercepted )
                 /* l1 guest intercepts #PF unnecessarily */
                 return NESTEDHVM_VMEXIT_HOST;
             /* l2 guest intercepts #PF unnecessarily */
             return NESTEDHVM_VMEXIT_INJECT;
         }
-        if (!paging_mode_hap(v->domain)) {
+        if ( !paging_mode_hap(v->domain) )
             /* host shadow paging + guest shadow paging */
             return NESTEDHVM_VMEXIT_HOST;
-        }
+
         /* host nested paging + guest shadow paging */
         return NESTEDHVM_VMEXIT_INJECT;
     case VMEXIT_VMMCALL:
@@ -1331,7 +1376,7 @@ nestedsvm_check_intercepts(struct vcpu *v, struct cpu_user_regs *regs,
         break;
     }
 
-    if (is_intercepted)
+    if ( is_intercepted )
         return NESTEDHVM_VMEXIT_INJECT;
     return NESTEDHVM_VMEXIT_HOST;
 }
@@ -1346,11 +1391,11 @@ nestedsvm_vmexit_n2n1(struct vcpu *v, struct cpu_user_regs *regs)
     ASSERT(nestedhvm_vcpu_in_guestmode(v));
 
     rc = nsvm_vmcb_prepare4vmexit(v, regs);
-    if (rc)
+    if ( rc )
         ret = NESTEDHVM_VMEXIT_ERROR;
 
     rc = nsvm_vcpu_hostrestore(v, regs);
-    if (rc)
+    if ( rc )
         ret = NESTEDHVM_VMEXIT_FATALERROR;
 
     nestedhvm_vcpu_exit_guestmode(v);
@@ -1374,17 +1419,19 @@ nestedsvm_vcpu_vmexit(struct vcpu *v, struct cpu_user_regs *regs,
     /* On special intercepts the host has to handle
      * the vcpu is still in guest mode here.
      */
-    if (nestedhvm_vcpu_in_guestmode(v)) {
+    if ( nestedhvm_vcpu_in_guestmode(v) )
+    {
         enum nestedhvm_vmexits ret;
 
         ret = nestedsvm_vmexit_n2n1(v, regs);
-        switch (ret) {
+        switch ( ret )
+        {
         case NESTEDHVM_VMEXIT_FATALERROR:
             gdprintk(XENLOG_ERR, "VMEXIT: fatal error\n");
             return ret;
         case NESTEDHVM_VMEXIT_HOST:
             BUG();
-            return ret;
+
         case NESTEDHVM_VMEXIT_ERROR:
             exitcode = VMEXIT_INVALID;
             break;
@@ -1404,12 +1451,12 @@ nestedsvm_vcpu_vmexit(struct vcpu *v, struct cpu_user_regs *regs,
     rc = nsvm_vcpu_vmexit_inject(v, regs, exitcode);
 
     /* If l1 guest uses shadow paging, update the paging mode. */
-    if (!nestedhvm_paging_mode_hap(v))
+    if ( !nestedhvm_paging_mode_hap(v) )
         paging_update_paging_modes(v);
 
     nv->nv_vmswitch_in_progress = 0;
 
-    if (rc)
+    if ( rc )
         return NESTEDHVM_VMEXIT_FATALERROR;
 
     return NESTEDHVM_VMEXIT_DONE;
@@ -1422,7 +1469,7 @@ void nsvm_vcpu_switch(struct cpu_user_regs *regs)
     struct nestedvcpu *nv;
     struct nestedsvm *svm;
 
-    if (!nestedhvm_enabled(v->domain))
+    if ( !nestedhvm_enabled(v->domain) )
         return;
 
     nv = &vcpu_nestedhvm(v);
@@ -1433,32 +1480,34 @@ void nsvm_vcpu_switch(struct cpu_user_regs *regs)
     ASSERT(nv->nv_n1vmcx_pa != INVALID_PADDR);
     ASSERT(nv->nv_n2vmcx_pa != INVALID_PADDR);
 
-    if (nv->nv_vmexit_pending) {
- vmexit:
+    if ( nv->nv_vmexit_pending )
+    {
+    vmexit:
         nestedsvm_vcpu_vmexit(v, regs, svm->ns_vmexit.exitcode);
         nv->nv_vmexit_pending = 0;
         nv->nv_vmentry_pending = 0;
         return;
     }
-    if (nv->nv_vmentry_pending) {
+
+    if ( nv->nv_vmentry_pending )
+    {
         int ret;
         ASSERT(!nv->nv_vmexit_pending);
         ret = nsvm_vcpu_vmrun(v, regs);
-        if (ret)
+        if ( ret )
             goto vmexit;
 
         ASSERT(nestedhvm_vcpu_in_guestmode(v));
         nv->nv_vmentry_pending = 0;
     }
 
-    if (nestedhvm_vcpu_in_guestmode(v)
-       && nestedhvm_paging_mode_hap(v))
+    if ( nestedhvm_vcpu_in_guestmode(v) && nestedhvm_paging_mode_hap(v) )
     {
         /* In case left the l2 guest due to a physical interrupt (e.g. IPI)
          * that is not for the l1 guest then we continue running the l2 guest
          * but check if the nestedp2m is still valid.
          */
-        if (nv->nv_p2m == NULL)
+        if ( nv->nv_p2m == NULL )
             nestedsvm_vmcb_set_nestedp2m(v, nv->nv_vvmcx, nv->nv_n2vmcx);
     }
 }
@@ -1477,7 +1526,8 @@ nestedsvm_vcpu_interrupt(struct vcpu *v, const struct hvm_intack intack)
     if ( intr != hvm_intblk_none )
         return NSVM_INTR_MASKED;
 
-    switch (intack.source) {
+    switch ( intack.source )
+    {
     case hvm_intsrc_pic:
     case hvm_intsrc_lapic:
     case hvm_intsrc_vector:
@@ -1500,7 +1550,8 @@ nestedsvm_vcpu_interrupt(struct vcpu *v, const struct hvm_intack intack)
 
     ret = nsvm_vmcb_guest_intercepts_exitcode(v,
                                      guest_cpu_user_regs(), exitcode);
-    if (ret) {
+    if ( ret )
+    {
         nestedsvm_vmexit_defer(v, exitcode, intack.source, exitinfo2);
         return NSVM_INTR_FORCEVMEXIT;
     }
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index bbe73744b8..ca3bbfcbb3 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -326,7 +326,7 @@ static int svm_vmcb_restore(struct vcpu *v, struct hvm_hw_cpu *c)
     vmcb->sysenter_cs = v->arch.hvm.svm.guest_sysenter_cs = c->sysenter_cs;
     vmcb->sysenter_esp = v->arch.hvm.svm.guest_sysenter_esp = c->sysenter_esp;
     vmcb->sysenter_eip = v->arch.hvm.svm.guest_sysenter_eip = c->sysenter_eip;
-    
+
     if ( paging_mode_hap(v->domain) )
     {
         vmcb_set_np_enable(vmcb, 1);
@@ -386,7 +386,8 @@ static void svm_save_vmcb_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
 static int svm_load_vmcb_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
 {
     svm_load_cpu_state(v, ctxt);
-    if (svm_vmcb_restore(v, ctxt)) {
+    if ( svm_vmcb_restore(v, ctxt) )
+    {
         gdprintk(XENLOG_ERR, "svm_vmcb restore failed!\n");
         domain_crash(v->domain);
         return -EINVAL;
@@ -413,9 +414,9 @@ static void svm_fpu_leave(struct vcpu *v)
     ASSERT(read_cr0() & X86_CR0_TS);
 
     /*
-     * If the guest does not have TS enabled then we must cause and handle an 
-     * exception on first use of the FPU. If the guest *does* have TS enabled 
-     * then this is not necessary: no FPU activity can occur until the guest 
+     * If the guest does not have TS enabled then we must cause and handle an
+     * exception on first use of the FPU. If the guest *does* have TS enabled
+     * then this is not necessary: no FPU activity can occur until the guest
      * clears CR0.TS, and we will initialise the FPU when that happens.
      */
     if ( !(v->arch.hvm.guest_cr[0] & X86_CR0_TS) )
@@ -475,7 +476,8 @@ void svm_update_guest_cr(struct vcpu *v, unsigned int cr, unsigned int flags)
 
     switch ( cr )
     {
-    case 0: {
+    case 0:
+    {
         unsigned long hw_cr0_mask = 0;
 
         if ( !(v->arch.hvm.guest_cr[0] & X86_CR0_TS) )
@@ -821,7 +823,8 @@ static void svm_set_tsc_offset(struct vcpu *v, u64 offset, u64 at_tsc)
     uint64_t n2_tsc_offset = 0;
     struct domain *d = v->domain;
 
-    if ( !nestedhvm_enabled(d) ) {
+    if ( !nestedhvm_enabled(d) )
+    {
         vmcb_set_tsc_offset(vmcb, offset);
         return;
     }
@@ -829,12 +832,14 @@ static void svm_set_tsc_offset(struct vcpu *v, u64 offset, u64 at_tsc)
     n1vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
     n2vmcb = vcpu_nestedhvm(v).nv_n2vmcx;
 
-    if ( nestedhvm_vcpu_in_guestmode(v) ) {
+    if ( nestedhvm_vcpu_in_guestmode(v) )
+    {
         struct nestedsvm *svm = &vcpu_nestedsvm(v);
 
         n2_tsc_offset = vmcb_get_tsc_offset(n2vmcb) -
                         vmcb_get_tsc_offset(n1vmcb);
-        if ( svm->ns_tscratio != DEFAULT_TSC_RATIO ) {
+        if ( svm->ns_tscratio != DEFAULT_TSC_RATIO )
+        {
             uint64_t guest_tsc = hvm_get_guest_tsc_fixed(v, at_tsc);
 
             n2_tsc_offset = svm_get_tsc_offset(guest_tsc,
@@ -930,7 +935,7 @@ static inline void svm_tsc_ratio_save(struct vcpu *v)
 
 static inline void svm_tsc_ratio_load(struct vcpu *v)
 {
-    if ( cpu_has_tsc_ratio && !v->domain->arch.vtsc ) 
+    if ( cpu_has_tsc_ratio && !v->domain->arch.vtsc )
         wrmsrl(MSR_AMD64_TSC_RATIO, hvm_tsc_scaling_ratio(v->domain));
 }
 
@@ -1111,7 +1116,7 @@ static void svm_host_osvw_init(void)
              rdmsr_safe(MSR_AMD_OSVW_STATUS, status) )
             len = status = 0;
 
-        if (len < osvw_length)
+        if ( len < osvw_length )
             osvw_length = len;
 
         osvw_status |= status;
@@ -1507,13 +1512,11 @@ static void svm_init_erratum_383(const struct cpuinfo_x86 *c)
         return;
 
     /* use safe methods to be compatible with nested virtualization */
-    if (rdmsr_safe(MSR_AMD64_DC_CFG, msr_content) == 0 &&
-        wrmsr_safe(MSR_AMD64_DC_CFG, msr_content | (1ULL << 47)) == 0)
-    {
+    if ( rdmsr_safe(MSR_AMD64_DC_CFG, msr_content) == 0 &&
+         wrmsr_safe(MSR_AMD64_DC_CFG, msr_content | (1ULL << 47)) == 0 )
         amd_erratum383_found = 1;
-    } else {
+    else
         printk("Failed to enable erratum 383\n");
-    }
 }
 
 #ifdef CONFIG_PV
@@ -1582,7 +1585,7 @@ static int _svm_cpu_up(bool bsp)
     int rc;
     unsigned int cpu = smp_processor_id();
     const struct cpuinfo_x86 *c = &cpu_data[cpu];
- 
+
     /* Check whether SVM feature is disabled in BIOS */
     rdmsrl(MSR_K8_VM_CR, msr_content);
     if ( msr_content & K8_VMCR_SVME_DISABLE )
@@ -1713,7 +1716,7 @@ static void svm_do_nested_pgfault(struct vcpu *v,
         _d.qualification = 0;
         _d.mfn = mfn_x(mfn);
         _d.p2mt = p2mt;
-        
+
         __trace_var(TRC_HVM_NPF, 0, sizeof(_d), &_d);
     }
 
@@ -2248,16 +2251,15 @@ nsvm_get_nvmcb_page(struct vcpu *v, uint64_t vmcbaddr)
         return NULL;
 
     /* Need to translate L1-GPA to MPA */
-    page = get_page_from_gfn(v->domain, 
-                            nv->nv_vvmcxaddr >> PAGE_SHIFT, 
-                            &p2mt, P2M_ALLOC | P2M_UNSHARE);
+    page = get_page_from_gfn(v->domain, nv->nv_vvmcxaddr >> PAGE_SHIFT,
+                             &p2mt, P2M_ALLOC | P2M_UNSHARE);
     if ( !page )
         return NULL;
 
     if ( !p2m_is_ram(p2mt) || p2m_is_readonly(p2mt) )
     {
         put_page(page);
-        return NULL; 
+        return NULL;
     }
 
     return  page;
@@ -2274,7 +2276,7 @@ svm_vmexit_do_vmload(struct vmcb_struct *vmcb,
     if ( (inst_len = svm_get_insn_len(v, INSTR_VMLOAD)) == 0 )
         return;
 
-    if ( !nsvm_efer_svm_enabled(v) ) 
+    if ( !nsvm_efer_svm_enabled(v) )
     {
         hvm_inject_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC);
         return;
@@ -2309,7 +2311,7 @@ svm_vmexit_do_vmsave(struct vmcb_struct *vmcb,
     if ( (inst_len = svm_get_insn_len(v, INSTR_VMSAVE)) == 0 )
         return;
 
-    if ( !nsvm_efer_svm_enabled(v) ) 
+    if ( !nsvm_efer_svm_enabled(v) )
     {
         hvm_inject_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC);
         return;
@@ -2344,11 +2346,11 @@ static int svm_is_erratum_383(struct cpu_user_regs *regs)
 
     if ( msr_content != 0xb600000000010015ULL )
         return 0;
-    
+
     /* Clear MCi_STATUS registers */
-    for (i = 0; i < this_cpu(nr_mce_banks); i++)
+    for ( i = 0; i < this_cpu(nr_mce_banks); i++ )
         wrmsrl(MSR_IA32_MCx_STATUS(i), 0ULL);
-    
+
     rdmsrl(MSR_IA32_MCG_STATUS, msr_content);
     wrmsrl(MSR_IA32_MCG_STATUS, msr_content & ~(1ULL << 2));
 
@@ -2535,7 +2537,8 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
                     1/*cycles*/, 2, exit_reason,
                     regs->eip, 0, 0, 0, 0);
 
-    if ( vcpu_guestmode ) {
+    if ( vcpu_guestmode )
+    {
         enum nestedhvm_vmexits nsret;
         struct nestedvcpu *nv = &vcpu_nestedhvm(v);
         struct vmcb_struct *ns_vmcb = nv->nv_vvmcx;
@@ -2550,7 +2553,8 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
         exitinfo1 = ns_vmcb->exitinfo1;
         ns_vmcb->exitinfo1 = vmcb->exitinfo1;
         nsret = nestedsvm_check_intercepts(v, regs, exit_reason);
-        switch (nsret) {
+        switch ( nsret )
+        {
         case NESTEDHVM_VMEXIT_CONTINUE:
             BUG();
             break;
@@ -2566,7 +2570,8 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
             nv->nv_vmswitch_in_progress = 1;
             nsret = nestedsvm_vmexit_n2n1(v, regs);
             nv->nv_vmswitch_in_progress = 0;
-            switch (nsret) {
+            switch ( nsret )
+            {
             case NESTEDHVM_VMEXIT_DONE:
                 /* defer VMEXIT injection */
                 nestedsvm_vmexit_defer(v, exit_reason, exitinfo1, exitinfo2);
@@ -2698,9 +2703,10 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
 
     case VMEXIT_EXCEPTION_NM:
         svm_fpu_dirty_intercept();
-        break;  
+        break;
 
-    case VMEXIT_EXCEPTION_PF: {
+    case VMEXIT_EXCEPTION_PF:
+    {
         unsigned long va;
         va = vmcb->exitinfo2;
         regs->error_code = vmcb->exitinfo1;
@@ -2744,7 +2750,8 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
         svm_vmexit_mce_intercept(v, regs);
         break;
 
-    case VMEXIT_VINTR: {
+    case VMEXIT_VINTR:
+    {
         u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
         intr = vmcb_get_vintr(vmcb);
 
@@ -2952,7 +2959,8 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
         v->arch.hvm.svm.cached_insn_len = 0;
         break;
 
-    case VMEXIT_IRET: {
+    case VMEXIT_IRET:
+    {
         u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
 
         /*
-- 
2.11.0


