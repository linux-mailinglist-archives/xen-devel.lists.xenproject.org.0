Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 569E3A6A3E1
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 11:41:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921740.1325509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvDKX-0005ov-3h; Thu, 20 Mar 2025 10:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921740.1325509; Thu, 20 Mar 2025 10:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvDKW-0005nL-WD; Thu, 20 Mar 2025 10:40:53 +0000
Received: by outflank-mailman (input) for mailman id 921740;
 Thu, 20 Mar 2025 10:40:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Eqg=WH=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1tvDKV-0005lS-JJ
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 10:40:51 +0000
Received: from fforwardh-b4-smtp.messagingengine.com
 (fforwardh-b4-smtp.messagingengine.com [202.12.124.199])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c81987bd-0577-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 11:40:47 +0100 (CET)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfforwardh.stl.internal (Postfix) with ESMTP id 1A8E51740240;
 Thu, 20 Mar 2025 06:40:46 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
 by phl-compute-01.internal (MEProxy); Thu, 20 Mar 2025 06:40:46 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Mar 2025 06:40:45 -0400 (EDT)
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
X-Inumbo-ID: c81987bd-0577-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1742467245; x=1742553645; bh=Z
	FBqzfTuIOcXKUcH4af4gFZfF5sz9uMBXXpfzTunwhs=; b=o0juFXLIxSaLe8GMX
	UJ6ZgDYUqJUMd5erKY5fZKzUAfc/GGPpN39veW1sleHIEqd39bGyYuT5PQdrFPUi
	ehBGf8qQad8hipCwB3AZ2PdPs1wLc/klw63cpbaHkaQgraBJ/6bDpEpSDNoRI+CS
	3Sf3jpzTl88YkAonJKjAN3qE14WAMirVXzJgrsyDSE3NiKXFToaaAvxcYpqEInN4
	IllasQ6wgVtouUHvglk8I4dHWcSdO72Xs1Zc9ezKuU2URQwJopV90RI9nqo4QDZ9
	ML+Ph4d8k2PSixQ8YOqbgrbNjJihQp4Gg5H4h0e9kFLjw9dNMYqO5ThtggQMrrP+
	4AGhw==
X-ME-Sender: <xms:rfDbZ4Nh9_xrDX0nk4sTO4ogn7u1Cyol-apJPWi7N_O1tn5InOhn6A>
    <xme:rfDbZ-9Sqr0V8RZh6c5EMFopcRMAuEl-Tq4u6auOFlFyePfqFk2odi_jtXFgAPJcs
    jdhH3K4b28xISkcXAU>
X-ME-Received: <xmr:rfDbZ_RhvHViYKIsp6yrle8EJsaDOpgvi6ubMT71T3qitQ-bpvrDHrHdHeTdANOvxo8jeHIUuhw2WxV2QqvhRAAClBLaOu-4K_z4VwNdGdeO3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeejleelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepufgvrhhgihihucfmihgsrhhikhcuoefuvghrghhihigpmfhisghrih
    hksegvphgrmhdrtghomheqnecuggftrfgrthhtvghrnhephfevveeuieeljefhkedugeeh
    leeugefgfffhjefhvdeitdethfettdeitefgheevnecuffhomhgrihhnpegvnhhtrhihrd
    hssgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehs
    rghkihgssegurghrkhhsthgrrhdrshhithgvpdhnsggprhgtphhtthhopeeipdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghn
    phhrohhjvggtthdrohhrghdprhgtphhtthhopehsvghrghhihigpkhhisghrihhksegvph
    grmhdrtghomhdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghp
    thhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtth
    hopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggs
    vghllhhinhhisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:rfDbZwtZCosLXB0jIu9LOrPqgaoh3IS4wPdEBhI2vQ_lKezIAeqO1g>
    <xmx:rfDbZweQz1v4OnAwzYT996nDFBYIFJ9Uv-lfLNYjIfBHVXwEQg6O4w>
    <xmx:rfDbZ005IewNJq-G3MvRHotvZDnr7pBqPBPdy6ePkW4jiwiqboTm0Q>
    <xmx:rfDbZ08lOm9ezFUIYEXxCOyzDEgVfahDtdxJ3GkZZZjQ30xmE9gBdQ>
    <xmx:rfDbZ3-py4gE4K5K9f0i9sil256aKW_0RMha6nf0udOTOWGyYiV-mg>
    <xmx:rfDbZ1FsU-HQ7rlAQwbezL6xl5spjHQMcwv7w8gp9OHB0JF6qQ8WDOLZfNQX>
Feedback-ID: i7f3fb726:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 4/4] x86:hvm: make nestedhvm support optional
Date: Thu, 20 Mar 2025 12:40:43 +0200
Message-Id: <e4f77564313d20ad4f3b94bde0672250f7d99bb4.1742465624.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1742465624.git.Sergiy_Kibrik@epam.com>
References: <cover.1742465624.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce NESTEDHVM config option that controls nested virtualization in both
SVM & VMX code. The option is for reduction of dead code on systems that
aren't intended to run in nested mode.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/Kconfig                     |  5 +++++
 xen/arch/x86/hvm/Makefile                |  2 +-
 xen/arch/x86/hvm/svm/Makefile            |  2 +-
 xen/arch/x86/hvm/svm/entry.S             |  2 ++
 xen/arch/x86/hvm/svm/svm.c               |  4 ++++
 xen/arch/x86/hvm/vmx/Makefile            |  2 +-
 xen/arch/x86/hvm/vmx/entry.S             |  2 ++
 xen/arch/x86/hvm/vmx/vmcs.c              |  8 +++++---
 xen/arch/x86/hvm/vmx/vmx.c               | 10 +++++++++-
 xen/arch/x86/include/asm/hvm/nestedhvm.h | 10 +++++++++-
 10 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 6e41bc0fb4..bc140d8b77 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -144,6 +144,11 @@ config INTEL_VMX
 	  If your system includes a processor with Intel VT-x support, say Y.
 	  If in doubt, say Y.
 
+config NESTEDHVM
+	bool "Support nested virtualization" if EXPERT
+	depends on HVM
+	default y
+
 config XEN_SHSTK
 	bool "Supervisor Shadow Stacks"
 	depends on HAS_AS_CET_SS
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index 4c1fa5c6c2..c80b209296 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -17,7 +17,7 @@ obj-y += ioreq.o
 obj-y += irq.o
 obj-y += monitor.o
 obj-y += mtrr.o
-obj-y += nestedhvm.o
+obj-$(CONFIG_NESTEDHVM) += nestedhvm.o
 obj-y += pmtimer.o
 obj-y += quirks.o
 obj-y += rtc.o
diff --git a/xen/arch/x86/hvm/svm/Makefile b/xen/arch/x86/hvm/svm/Makefile
index 760d2954da..4b45ca050f 100644
--- a/xen/arch/x86/hvm/svm/Makefile
+++ b/xen/arch/x86/hvm/svm/Makefile
@@ -2,7 +2,7 @@ obj-y += asid.o
 obj-y += emulate.o
 obj-bin-y += entry.o
 obj-y += intr.o
-obj-y += nestedsvm.o
+obj-$(CONFIG_NESTEDHVM) += nestedsvm.o
 obj-y += svm.o
 obj-y += svmdebug.o
 obj-y += vmcb.o
diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index 91edb33459..62ebe1198b 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -28,7 +28,9 @@ FUNC(svm_asm_do_resume)
         GET_CURRENT(bx)
 .Lsvm_do_resume:
         call svm_intr_assist
+#ifdef CONFIG_NESTEDHVM
         call nsvm_vcpu_switch
+#endif
         ASSERT_NOT_IN_ATOMIC
 
         mov  VCPU_processor(%rbx),%eax
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index d7d91427fd..b678fb46aa 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2460,6 +2460,7 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
     .set_descriptor_access_exiting = svm_set_descriptor_access_exiting,
     .get_insn_bytes       = svm_get_insn_bytes,
 
+#ifdef CONFIG_NESTEDHVM
     .nhvm_vcpu_initialise = nsvm_vcpu_initialise,
     .nhvm_vcpu_destroy = nsvm_vcpu_destroy,
     .nhvm_vcpu_reset = nsvm_vcpu_reset,
@@ -2469,6 +2470,7 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
     .nhvm_vmcx_hap_enabled = nsvm_vmcb_hap_enabled,
     .nhvm_intr_blocked = nsvm_intr_blocked,
     .nhvm_hap_walk_L1_p2m = nsvm_hap_walk_L1_p2m,
+#endif
 
     .get_reg = svm_get_reg,
     .set_reg = svm_set_reg,
@@ -2991,12 +2993,14 @@ void asmlinkage svm_vmexit_handler(void)
     case VMEXIT_VMSAVE:
         svm_vmexit_do_vmsave(vmcb, regs, v, regs->rax);
         break;
+#ifdef CONFIG_NESTEDHVM
     case VMEXIT_STGI:
         svm_vmexit_do_stgi(regs, v);
         break;
     case VMEXIT_CLGI:
         svm_vmexit_do_clgi(regs, v);
         break;
+#endif
 
     case VMEXIT_XSETBV:
         if ( vmcb_get_cpl(vmcb) )
diff --git a/xen/arch/x86/hvm/vmx/Makefile b/xen/arch/x86/hvm/vmx/Makefile
index 04a29ce59d..6588b58889 100644
--- a/xen/arch/x86/hvm/vmx/Makefile
+++ b/xen/arch/x86/hvm/vmx/Makefile
@@ -3,4 +3,4 @@ obj-y += intr.o
 obj-y += realmode.o
 obj-y += vmcs.o
 obj-y += vmx.o
-obj-y += vvmx.o
+obj-$(CONFIG_NESTEDHVM) += vvmx.o
diff --git a/xen/arch/x86/hvm/vmx/entry.S b/xen/arch/x86/hvm/vmx/entry.S
index 6aaeb28a5b..ed4db38733 100644
--- a/xen/arch/x86/hvm/vmx/entry.S
+++ b/xen/arch/x86/hvm/vmx/entry.S
@@ -86,7 +86,9 @@ FUNC(vmx_asm_vmexit_handler)
 
 .Lvmx_do_vmentry:
         call vmx_intr_assist
+#ifdef CONFIG_NESTEDHVM
         call nvmx_switch_guest
+#endif
         ASSERT_NOT_IN_ATOMIC
 
         mov  VCPU_processor(%rbx),%eax
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 0ba65becec..8d7f714a04 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -674,7 +674,7 @@ int cf_check vmx_cpu_up_prepare(unsigned int cpu)
      * If nvmx_cpu_up_prepare() failed, do not return failure and just fallback
      * to legacy mode for vvmcs synchronization.
      */
-    if ( nvmx_cpu_up_prepare(cpu) != 0 )
+    if ( IS_ENABLED(CONFIG_NESTEDHVM) && nvmx_cpu_up_prepare(cpu) != 0 )
         printk("CPU%d: Could not allocate virtual VMCS buffer.\n", cpu);
 
     if ( per_cpu(vmxon_region, cpu) )
@@ -685,7 +685,8 @@ int cf_check vmx_cpu_up_prepare(unsigned int cpu)
         return 0;
 
     printk("CPU%d: Could not allocate host VMCS\n", cpu);
-    nvmx_cpu_dead(cpu);
+    if ( IS_ENABLED(CONFIG_NESTEDHVM) )
+        nvmx_cpu_dead(cpu);
     return -ENOMEM;
 }
 
@@ -693,7 +694,8 @@ void cf_check vmx_cpu_dead(unsigned int cpu)
 {
     vmx_free_vmcs(per_cpu(vmxon_region, cpu));
     per_cpu(vmxon_region, cpu) = 0;
-    nvmx_cpu_dead(cpu);
+    if ( IS_ENABLED(CONFIG_NESTEDHVM) )
+        nvmx_cpu_dead(cpu);
     vmx_pi_desc_fixup(cpu);
 }
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 4883bd823d..ed68195445 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1959,6 +1959,7 @@ static void nvmx_enqueue_n2_exceptions(struct vcpu *v,
                  nvmx->intr.intr_info, nvmx->intr.error_code);
 }
 
+#ifdef CONFIG_NESTEDHVM
 static int cf_check nvmx_vmexit_event(
     struct vcpu *v, const struct x86_event *event)
 {
@@ -1966,6 +1967,7 @@ static int cf_check nvmx_vmexit_event(
                                hvm_intsrc_none);
     return NESTEDHVM_VMEXIT_DONE;
 }
+#endif
 
 static void __vmx_inject_exception(int trap, int type, int error_code)
 {
@@ -2851,6 +2853,7 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .handle_cd            = vmx_handle_cd,
     .set_info_guest       = vmx_set_info_guest,
     .set_rdtsc_exiting    = vmx_set_rdtsc_exiting,
+#ifdef CONFIG_NESTEDHVM
     .nhvm_vcpu_initialise = nvmx_vcpu_initialise,
     .nhvm_vcpu_destroy    = nvmx_vcpu_destroy,
     .nhvm_vcpu_reset      = nvmx_vcpu_reset,
@@ -2860,8 +2863,9 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .nhvm_vcpu_vmexit_event = nvmx_vmexit_event,
     .nhvm_intr_blocked    = nvmx_intr_blocked,
     .nhvm_domain_relinquish_resources = nvmx_domain_relinquish_resources,
-    .update_vlapic_mode = vmx_vlapic_msr_changed,
     .nhvm_hap_walk_L1_p2m = nvmx_hap_walk_L1_p2m,
+#endif
+    .update_vlapic_mode = vmx_vlapic_msr_changed,
     .enable_msr_interception = vmx_enable_msr_interception,
     .altp2m_vcpu_update_p2m = vmx_vcpu_update_eptp,
     .altp2m_vcpu_update_vmfunc_ve = vmx_vcpu_update_vmfunc_ve,
@@ -3465,10 +3469,12 @@ static int cf_check vmx_msr_read_intercept(
         __vmread(GUEST_IA32_DEBUGCTL, msr_content);
         break;
 
+#ifdef CONFIG_NESTEDHVM
     case MSR_IA32_VMX_BASIC...MSR_IA32_VMX_VMFUNC:
         if ( !nvmx_msr_read_intercept(msr, msr_content) )
             goto gp_fault;
         break;
+#endif
     case MSR_IA32_MISC_ENABLE:
         rdmsrl(MSR_IA32_MISC_ENABLE, *msr_content);
         /* Debug Trace Store is not supported. */
@@ -4631,6 +4637,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
         }
         break;
 
+#ifdef CONFIG_NESTEDHVM
     case EXIT_REASON_VMXOFF:
     case EXIT_REASON_VMXON:
     case EXIT_REASON_VMCLEAR:
@@ -4645,6 +4652,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
         if ( nvmx_handle_vmx_insn(regs, exit_reason) == X86EMUL_OKAY )
             update_guest_eip();
         break;
+#endif
 
     case EXIT_REASON_VMFUNC:
         if ( vmx_vmfunc_intercept(regs) != X86EMUL_OKAY )
diff --git a/xen/arch/x86/include/asm/hvm/nestedhvm.h b/xen/arch/x86/include/asm/hvm/nestedhvm.h
index ea2c1bc328..1703eaafde 100644
--- a/xen/arch/x86/include/asm/hvm/nestedhvm.h
+++ b/xen/arch/x86/include/asm/hvm/nestedhvm.h
@@ -25,14 +25,22 @@ enum nestedhvm_vmexits {
 /* Nested HVM on/off per domain */
 static inline bool nestedhvm_enabled(const struct domain *d)
 {
-    return IS_ENABLED(CONFIG_HVM) && (d->options & XEN_DOMCTL_CDF_nested_virt);
+    return IS_ENABLED(CONFIG_NESTEDHVM) &&
+           (d->options & XEN_DOMCTL_CDF_nested_virt);
 }
 
 /* Nested VCPU */
 int nestedhvm_vcpu_initialise(struct vcpu *v);
 void nestedhvm_vcpu_destroy(struct vcpu *v);
 void nestedhvm_vcpu_reset(struct vcpu *v);
+#ifdef CONFIG_NESTEDHVM
 bool nestedhvm_vcpu_in_guestmode(struct vcpu *v);
+#else
+static inline bool nestedhvm_vcpu_in_guestmode(struct vcpu *v)
+{
+    return false;
+}
+#endif
 #define nestedhvm_vcpu_enter_guestmode(v) \
     vcpu_nestedhvm(v).nv_guestmode = 1
 #define nestedhvm_vcpu_exit_guestmode(v)  \
-- 
2.25.1


