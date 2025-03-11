Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0575BA5BDBC
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 11:23:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907695.1314896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwld-0003aw-Lt; Tue, 11 Mar 2025 10:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907695.1314896; Tue, 11 Mar 2025 10:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwld-0003ZP-Ik; Tue, 11 Mar 2025 10:23:21 +0000
Received: by outflank-mailman (input) for mailman id 907695;
 Tue, 11 Mar 2025 10:23:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RDOX=V6=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1trwlc-0003ZJ-6o
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 10:23:20 +0000
Received: from fforwardh-b1-smtp.messagingengine.com
 (fforwardh-b1-smtp.messagingengine.com [202.12.124.196])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8ecf136-fe62-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 11:23:17 +0100 (CET)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfforwardh.stl.internal (Postfix) with ESMTP id 5421317400CD;
 Tue, 11 Mar 2025 06:23:16 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
 by phl-compute-08.internal (MEProxy); Tue, 11 Mar 2025 06:23:16 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Mar 2025 06:23:14 -0400 (EDT)
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
X-Inumbo-ID: d8ecf136-fe62-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1741688596; x=1741774996; bh=7
	rZNXPtFKuxuEpNDlqaH+Iks33wV303f2LhEdINzY0s=; b=oAmIq8RYGT20jdjK6
	GZCW6MEzkqolMEoRBPE28bXXRy3vPFIQa1aDd0B+JVlz7FBr+4PW2SCX/tfzjxQn
	QkdjsfOk1BApP7E0DiN9IL8x4OTzQUS/yZTuD/plBx4+/pLwvmL/nbYdWW9ekiJ2
	4b7blz35ko27c9qOoMDgnEcWkLAA0PM+Z2+PDgm3WK+hqqmCkAaP8QkXRMTo1rjh
	2nec6YTuEu37iKyfXov+VJe8PSnmifYiOvNGwXiJe9T3RPRsJ1QV3nRe1B2nwahi
	xWvrxRLBl0o0eo/loN+zLfx7zPDNNbtMU+MxLWfZpN1ZCXh+yHja4WfK5a78YxlF
	tN6Bw==
X-ME-Sender: <xms:Ew_QZ2tEikwVsXLpBEa_oe5PG5u7fudFrL0GJBCfl5dlkDd3NpzJ3A>
    <xme:Ew_QZ7df8fQrRMxnovbgA2s5nsMctYEogVrLkGRX6LuYVZKgu2_cqS5tAWnIRxRtm
    91TKr4Mg2pdkPQuG2I>
X-ME-Received: <xmr:Ew_QZxyD2AyK_5Bn3LZ0EYUxvSsNTWK86vuvR2-dG0wjGK6IWVGw4Qz_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdduleekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepufgvrhhgihihucfmihgsrhhikhcuoefuvghrghhihigpmfhisghrih
    hksegvphgrmhdrtghomheqnecuggftrfgrthhtvghrnheptdejgeegvdffkeekleefueev
    gfduheevkedvhfdvkeeludehleegheeivedugfejnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepshgrkhhisgesuggrrhhkshhtrghrrdhsihht
    vgdpnhgspghrtghpthhtohepvddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    igvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphht
    thhopehsvghrghhihigpkhhisghrihhksegvphgrmhdrtghomhdprhgtphhtthhopegtrg
    hrughovgestggrrhguohgvrdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgv
    rhefsegtihhtrhhigidrtghomhdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrug
    esvhgrthgvshdrthgvtghhpdhrtghpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgu
    rdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtth
    hopehjuhhlihgvnhesgigvnhdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegt
    ihhtrhhigidrtghomh
X-ME-Proxy: <xmx:Ew_QZxNnrmihyfsAmZpPMa18yrUMDf8_V1epGufB8MU_xN4s-d1jNQ>
    <xmx:Ew_QZ2-5pP6PLITfxQRD98WgzIcfQZFteabv-W9-7vtf4JvEt6848A>
    <xmx:Ew_QZ5VK9x-6tJ1GnC58Q-PZxs1r_-h4Z0fVb3n5oL0OafdSl4ZjLA>
    <xmx:Ew_QZ_cwRjOuAZzfgk6cmlSAz2DXizyePyEJrGIiAN-jSbq87vcfZA>
    <xmx:Ew_QZweQRUNIeUbce8dkLhyXR0xcPISLNVlF2jmO31FlYUlosT6P_w>
    <xmx:FA_QZ5edaUYfDTWU_PkMZduDZbD8W35qx58L4EwBOOLUabQ8oQQQ059z1Z6F>
Feedback-ID: i5e0dcf66:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 1/3] xen: kconfig: rename MEM_ACCESS -> VM_EVENT
Date: Tue, 11 Mar 2025 12:23:12 +0200
Message-Id: <8d35ec8373b65bca2fe471eac7a17cb2a98db3fc.1741687645.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1741687645.git.Sergiy_Kibrik@epam.com>
References: <cover.1741687645.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use more generic CONFIG_VM_EVENT name throughout Xen code instead of
CONFIG_MEM_ACCESS. This reflects the fact that vm_event is a higher level
feature, with mem_access & monitor depending on it.

CC: Jan Beulich <jbeulich@suse.com>
Suggested-by: Tamas K Lengyel <tamas@tklengyel.com>
Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
changes in v3:
 - squash with automation patch
 - tags & minor addition of blanks
---
 automation/gitlab-ci/build.yaml         | 2 +-
 xen/arch/arm/Makefile                   | 2 +-
 xen/arch/arm/configs/tiny64_defconfig   | 2 +-
 xen/arch/arm/include/asm/mem_access.h   | 4 ++--
 xen/arch/ppc/configs/ppc64_defconfig    | 2 +-
 xen/arch/riscv/configs/tiny64_defconfig | 2 +-
 xen/arch/x86/mm/Makefile                | 2 +-
 xen/common/Kconfig                      | 2 +-
 xen/common/Makefile                     | 2 +-
 xen/common/domctl.c                     | 2 +-
 xen/include/xen/mem_access.h            | 6 +++---
 xen/include/xsm/dummy.h                 | 2 +-
 xen/include/xsm/xsm.h                   | 4 ++--
 xen/xsm/dummy.c                         | 2 +-
 xen/xsm/flask/hooks.c                   | 4 ++--
 15 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 034d6d9c3a..b6383c4fc8 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -744,7 +744,7 @@ debian-12-riscv64-gcc:
       CONFIG_EXPERT=y
       CONFIG_GRANT_TABLE=n
       CONFIG_LIVEPATCH=n
-      CONFIG_MEM_ACCESS=n
+      CONFIG_VM_EVENT=n
       CONFIG_QEMU_PLATFORM=y
       CONFIG_XSM=n
 
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index fb0948f067..3bd5125e64 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -38,7 +38,7 @@ obj-y += irq.o
 obj-y += kernel.init.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o
 obj-$(CONFIG_LLC_COLORING) += llc-coloring.o
-obj-$(CONFIG_MEM_ACCESS) += mem_access.o
+obj-$(CONFIG_VM_EVENT) += mem_access.o
 obj-y += mm.o
 obj-y += monitor.o
 obj-y += p2m.o
diff --git a/xen/arch/arm/configs/tiny64_defconfig b/xen/arch/arm/configs/tiny64_defconfig
index cc6d93f2f8..469a1eb9f9 100644
--- a/xen/arch/arm/configs/tiny64_defconfig
+++ b/xen/arch/arm/configs/tiny64_defconfig
@@ -5,7 +5,7 @@ CONFIG_ARM=y
 # Architecture Features
 #
 # CONFIG_GICV3 is not set
-# CONFIG_MEM_ACCESS is not set
+# CONFIG_VM_EVENT is not set
 # CONFIG_SBSA_VUART_CONSOLE is not set
 
 #
diff --git a/xen/arch/arm/include/asm/mem_access.h b/xen/arch/arm/include/asm/mem_access.h
index abac8032fc..d42f28e8b7 100644
--- a/xen/arch/arm/include/asm/mem_access.h
+++ b/xen/arch/arm/include/asm/mem_access.h
@@ -37,7 +37,7 @@ static inline bool p2m_mem_access_sanity_check(struct domain *d)
  * Send mem event based on the access. Boolean return value indicates if trap
  * needs to be injected into guest.
  */
-#ifdef CONFIG_MEM_ACCESS
+#ifdef CONFIG_VM_EVENT
 bool p2m_mem_access_check(paddr_t gpa, vaddr_t gla, const struct npfec npfec);
 
 struct page_info*
@@ -58,7 +58,7 @@ p2m_mem_access_check_and_get_page(vaddr_t gva, unsigned long flag,
     return NULL;
 }
 
-#endif /*CONFIG_MEM_ACCESS*/
+#endif /* CONFIG_VM_EVENT */
 #endif /* _ASM_ARM_MEM_ACCESS_H */
 
 /*
diff --git a/xen/arch/ppc/configs/ppc64_defconfig b/xen/arch/ppc/configs/ppc64_defconfig
index 4924d881a2..d6aaf772e7 100644
--- a/xen/arch/ppc/configs/ppc64_defconfig
+++ b/xen/arch/ppc/configs/ppc64_defconfig
@@ -1,6 +1,6 @@
 # CONFIG_GRANT_TABLE is not set
 # CONFIG_SPECULATIVE_HARDEN_ARRAY is not set
-# CONFIG_MEM_ACCESS is not set
+# CONFIG_VM_EVENT is not set
 
 CONFIG_PPC64=y
 CONFIG_DEBUG=y
diff --git a/xen/arch/riscv/configs/tiny64_defconfig b/xen/arch/riscv/configs/tiny64_defconfig
index bb3ae26a44..2399f7b918 100644
--- a/xen/arch/riscv/configs/tiny64_defconfig
+++ b/xen/arch/riscv/configs/tiny64_defconfig
@@ -1,6 +1,6 @@
 # CONFIG_BOOT_TIME_CPUPOOLS is not set
 # CONFIG_GRANT_TABLE is not set
-# CONFIG_MEM_ACCESS is not set
+# CONFIG_VM_EVENT is not set
 # CONFIG_COVERAGE is not set
 # CONFIG_LIVEPATCH is not set
 # CONFIG_XSM is not set
diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
index 0345388359..960f6e8409 100644
--- a/xen/arch/x86/mm/Makefile
+++ b/xen/arch/x86/mm/Makefile
@@ -4,7 +4,7 @@ obj-$(CONFIG_HVM) += hap/
 obj-$(CONFIG_ALTP2M) += altp2m.o
 obj-$(CONFIG_HVM) += guest_walk_2.o guest_walk_3.o guest_walk_4.o
 obj-$(CONFIG_SHADOW_PAGING) += guest_walk_4.o
-obj-$(CONFIG_MEM_ACCESS) += mem_access.o
+obj-$(CONFIG_VM_EVENT) += mem_access.o
 obj-$(CONFIG_MEM_PAGING) += mem_paging.o
 obj-$(CONFIG_MEM_SHARING) += mem_sharing.o
 obj-$(CONFIG_HVM) += nested.o
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 6166327f4d..a6aa2c5c14 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -92,7 +92,7 @@ config HAS_VMAP
 config MEM_ACCESS_ALWAYS_ON
 	bool
 
-config MEM_ACCESS
+config VM_EVENT
 	def_bool MEM_ACCESS_ALWAYS_ON
 	prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON
 	depends on HVM
diff --git a/xen/common/Makefile b/xen/common/Makefile
index cba3b32733..b71d4b3efa 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -26,7 +26,7 @@ obj-$(CONFIG_KEXEC) += kexec.o
 obj-$(CONFIG_KEXEC) += kimage.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o livepatch_elf.o
 obj-$(CONFIG_LLC_COLORING) += llc-coloring.o
-obj-$(CONFIG_MEM_ACCESS) += mem_access.o
+obj-$(CONFIG_VM_EVENT) += mem_access.o
 obj-y += memory.o
 obj-y += multicall.o
 obj-y += notifier.o
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index b897ca8723..bfe2e1f9f0 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -809,7 +809,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
             copyback = true;
         break;
 
-#ifdef CONFIG_MEM_ACCESS
+#ifdef CONFIG_VM_EVENT
     case XEN_DOMCTL_set_access_required:
         if ( unlikely(current->domain == d) ) /* no domain_pause() */
             ret = -EPERM;
diff --git a/xen/include/xen/mem_access.h b/xen/include/xen/mem_access.h
index 2231341b5d..4de651038d 100644
--- a/xen/include/xen/mem_access.h
+++ b/xen/include/xen/mem_access.h
@@ -33,7 +33,7 @@
  */
 struct vm_event_st;
 
-#ifdef CONFIG_MEM_ACCESS
+#ifdef CONFIG_VM_EVENT
 #include <asm/mem_access.h>
 #endif
 
@@ -99,7 +99,7 @@ long p2m_set_mem_access_multi(struct domain *d,
 int p2m_get_mem_access(struct domain *d, gfn_t gfn, xenmem_access_t *access,
                        unsigned int altp2m_idx);
 
-#ifdef CONFIG_MEM_ACCESS
+#ifdef CONFIG_VM_EVENT
 int mem_access_memop(unsigned long cmd,
                      XEN_GUEST_HANDLE_PARAM(xen_mem_access_op_t) arg);
 #else
@@ -109,7 +109,7 @@ int mem_access_memop(unsigned long cmd,
 {
     return -ENOSYS;
 }
-#endif /* CONFIG_MEM_ACCESS */
+#endif /* CONFIG_VM_EVENT */
 
 #endif /* _XEN_MEM_ACCESS_H */
 
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index a8d06de6b0..9227205fcd 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -647,7 +647,7 @@ static XSM_INLINE int cf_check xsm_vm_event_control(
     return xsm_default_action(action, current->domain, d);
 }
 
-#ifdef CONFIG_MEM_ACCESS
+#ifdef CONFIG_VM_EVENT
 static XSM_INLINE int cf_check xsm_mem_access(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 8c33b055fc..24acc16125 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -153,7 +153,7 @@ struct xsm_ops {
 
     int (*vm_event_control)(struct domain *d, int mode, int op);
 
-#ifdef CONFIG_MEM_ACCESS
+#ifdef CONFIG_VM_EVENT
     int (*mem_access)(struct domain *d);
 #endif
 
@@ -637,7 +637,7 @@ static inline int xsm_vm_event_control(
     return alternative_call(xsm_ops.vm_event_control, d, mode, op);
 }
 
-#ifdef CONFIG_MEM_ACCESS
+#ifdef CONFIG_VM_EVENT
 static inline int xsm_mem_access(xsm_default_t def, struct domain *d)
 {
     return alternative_call(xsm_ops.mem_access, d);
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index ce6fbdc6c5..93fbfc43cc 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -111,7 +111,7 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
 
     .vm_event_control              = xsm_vm_event_control,
 
-#ifdef CONFIG_MEM_ACCESS
+#ifdef CONFIG_VM_EVENT
     .mem_access                    = xsm_mem_access,
 #endif
 
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 389707a164..6a53487ea4 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1362,7 +1362,7 @@ static int cf_check flask_vm_event_control(struct domain *d, int mode, int op)
     return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__VM_EVENT);
 }
 
-#ifdef CONFIG_MEM_ACCESS
+#ifdef CONFIG_VM_EVENT
 static int cf_check flask_mem_access(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__MEM_ACCESS);
@@ -1955,7 +1955,7 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
 
     .vm_event_control = flask_vm_event_control,
 
-#ifdef CONFIG_MEM_ACCESS
+#ifdef CONFIG_VM_EVENT
     .mem_access = flask_mem_access,
 #endif
 
-- 
2.25.1


