Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEF0A17B49
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 11:20:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875270.1285713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBMN-0002sN-5v; Tue, 21 Jan 2025 10:19:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875270.1285713; Tue, 21 Jan 2025 10:19:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBMN-0002ql-3F; Tue, 21 Jan 2025 10:19:51 +0000
Received: by outflank-mailman (input) for mailman id 875270;
 Tue, 21 Jan 2025 10:19:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fb3U=UN=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1taBML-0002qf-CL
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 10:19:49 +0000
Received: from fforwardh-b2-smtp.messagingengine.com
 (fforwardh-b2-smtp.messagingengine.com [202.12.124.197])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d40c1e7-d7e1-11ef-99a4-01e77a169b0f;
 Tue, 21 Jan 2025 11:19:47 +0100 (CET)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfforwardh.stl.internal (Postfix) with ESMTP id E43551740226;
 Tue, 21 Jan 2025 05:19:45 -0500 (EST)
Received: from phl-frontend-01 ([10.202.2.160])
 by phl-compute-01.internal (MEProxy); Tue, 21 Jan 2025 05:19:46 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Jan 2025 05:19:44 -0500 (EST)
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
X-Inumbo-ID: 3d40c1e7-d7e1-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1737454785; x=1737541185; bh=3
	rPlU7XgPSyjTpGplKIP+1gNXPsjweB81ibCUw3TTuA=; b=nOTTj2fPwaKSHI3NN
	jyo1C4Y8K9M1QGijqFkSRJG1bmYK1S6nd6XTbczIc5LYj55XWKP3SbN0G/78EvDM
	HiEIeGzCk+fiTTObVGfzv576O48+xJFTX/6mUuDLmUewXqK1+djZqGvVjz9FmrmH
	x8BJH8g9u93q60ZnMjQ8pNyhHHvCSDBCP4zzDbz8+AwKmDlOq7hUKUPmRIF+n3qd
	WKL9T/IdIX2WVyYO9yPRJSdgVHxea8gaXQGL4HQC+Cl8IKWh+7ODmIIHQDto/Sho
	euOFfyXQsh5OGEqONNRUwWFmE6KAMU58gZ5HzGqfp2QxthxODwJOeU89c74mXm4Q
	wwHEg==
X-ME-Sender: <xms:wXSPZ8zjqTmAaFqn8tRDUshya5iQp8aP_vTO3E2EqFiIiucNIq_mcg>
    <xme:wXSPZwRiBWAm6bz_VYfwEKDNghiHifaqmAtP3-7aHDJHbbsld6qYbeFVqznmv0lFU
    1k4hRX0VRRdGl8hxrU>
X-ME-Received: <xmr:wXSPZ-WraoPmDdttLo2BdGyok8F7Pvgik05ly77yyIvBItJ38pkafoao4v62DmCvRu29nWNvwvS38uwXqBdKW-4wfasU2WHNPUr46E6yu_IU9-tt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejuddgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomhepufgvrhhgihihucfmihgsrhhikhcuoefuvghrghhihigpmfhisghrihhkse
    gvphgrmhdrtghomheqnecuggftrfgrthhtvghrnhepfeejheefveekheeguedvhfeuudei
    hfegieeifefglefhveeihfduuddvkeegjefhnecuffhomhgrihhnpehkvghrnhgvlhdroh
    hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehs
    rghkihgssegurghrkhhsthgrrhdrshhithgvpdhnsggprhgtphhtthhopedvtddpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigv
    nhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepshgvrhhgihihpghkihgsrhhikhesvg
    hprghmrdgtohhmpdhrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpthht
    ohepsggvrhhtrhgrnhgurdhmrghrqhhuihhssegrrhhmrdgtohhmpdhrtghpthhtohepmh
    hitghhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtohepvhholhhougihmhih
    rhgpsggrsggthhhukhesvghprghmrdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtoh
    hophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopegrnhhthhhonhihrdhpvghr
    rghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvg
    drtghomh
X-ME-Proxy: <xmx:wXSPZ6ha2hzu38blgrq-LxhbnF9S1_oTCbtPr5fcKNvfgEkB78XLFw>
    <xmx:wXSPZ-BNj_VtA3GGLkRcoiHefBvzdAm-70h-5LKjDeN2GZEOfGvQvA>
    <xmx:wXSPZ7IEYtkskhbjJ41KL0OmJ2AEsCrGyhbT_rRpNM8fMwutM3tCPA>
    <xmx:wXSPZ1B9qcEVshgrvSlr3DBEOEgny1F6kwZ-pUEuUZDPdIaifySMQw>
    <xmx:wXSPZ-wHMao6NhyLe7zPTqw4_iN8dUrnokK1cqpi9M0MOeAUStUydw>
    <xmx:wXSPZ5XFIdyGWEVEq2hcCiGu2B18anrmnf5l1iaTWJPivTgXv2A59mlI1FNe>
Feedback-ID: i7fe92d45:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
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
Subject: [PATCH v2 1/4] xen: kconfig: rename MEM_ACCESS -> VM_EVENT
Date: Tue, 21 Jan 2025 12:19:42 +0200
Message-Id: <ff22f35dafd04b16165e1caec038e5a5fcf2aeee.1737452864.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1737452864.git.Sergiy_Kibrik@epam.com>
References: <cover.1737452864.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use more generic CONFIG_VM_EVENT name throughout Xen code instead of
CONFIG_MEM_ACCESS. This reflects the fact that vm_event is a higher level
feature, with mem_access & monitor depending on it.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Suggested-by: Tamas K Lengyel <tamas@tklengyel.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
option renaming brought up as part of v1 review discussion:
   https://lore.kernel.org/xen-devel/c8684340-33f9-41d3-94e4-77ee3bc18306@suse.com/
---
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
 14 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 43ab5e8f25..ad29316df1 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -37,7 +37,7 @@ obj-y += irq.o
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
index abac8032fc..43f73f7e38 100644
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
+#endif /*CONFIG_VM_EVENT*/
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
index 05abb581a0..ffe896d8b3 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -802,7 +802,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
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
index 6a2fc33c3b..c728da9016 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -646,7 +646,7 @@ static XSM_INLINE int cf_check xsm_vm_event_control(
     return xsm_default_action(action, current->domain, d);
 }
 
-#ifdef CONFIG_MEM_ACCESS
+#ifdef CONFIG_VM_EVENT
 static XSM_INLINE int cf_check xsm_mem_access(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 4dbff9d866..6ac1627b7b 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -153,7 +153,7 @@ struct xsm_ops {
 
     int (*vm_event_control)(struct domain *d, int mode, int op);
 
-#ifdef CONFIG_MEM_ACCESS
+#ifdef CONFIG_VM_EVENT
     int (*mem_access)(struct domain *d);
 #endif
 
@@ -631,7 +631,7 @@ static inline int xsm_vm_event_control(
     return alternative_call(xsm_ops.vm_event_control, d, mode, op);
 }
 
-#ifdef CONFIG_MEM_ACCESS
+#ifdef CONFIG_VM_EVENT
 static inline int xsm_mem_access(xsm_default_t def, struct domain *d)
 {
     return alternative_call(xsm_ops.mem_access, d);
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index e6ffa948f7..a6d2ec2f8b 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -111,7 +111,7 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
 
     .vm_event_control              = xsm_vm_event_control,
 
-#ifdef CONFIG_MEM_ACCESS
+#ifdef CONFIG_VM_EVENT
     .mem_access                    = xsm_mem_access,
 #endif
 
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 14d84df9ca..acca89e123 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1361,7 +1361,7 @@ static int cf_check flask_vm_event_control(struct domain *d, int mode, int op)
     return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__VM_EVENT);
 }
 
-#ifdef CONFIG_MEM_ACCESS
+#ifdef CONFIG_VM_EVENT
 static int cf_check flask_mem_access(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__MEM_ACCESS);
@@ -1949,7 +1949,7 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
 
     .vm_event_control = flask_vm_event_control,
 
-#ifdef CONFIG_MEM_ACCESS
+#ifdef CONFIG_VM_EVENT
     .mem_access = flask_mem_access,
 #endif
 
-- 
2.25.1


