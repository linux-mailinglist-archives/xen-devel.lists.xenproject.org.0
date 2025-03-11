Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C89A5BDE0
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 11:27:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907763.1314995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwpb-0000bG-U5; Tue, 11 Mar 2025 10:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907763.1314995; Tue, 11 Mar 2025 10:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwpb-0000ac-R0; Tue, 11 Mar 2025 10:27:27 +0000
Received: by outflank-mailman (input) for mailman id 907763;
 Tue, 11 Mar 2025 10:27:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RDOX=V6=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1trwpa-0000aF-Un
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 10:27:26 +0000
Received: from fforwardh-b1-smtp.messagingengine.com
 (fforwardh-b1-smtp.messagingengine.com [202.12.124.196])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c2b999a-fe63-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 11:27:24 +0100 (CET)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfforwardh.stl.internal (Postfix) with ESMTP id 5DABE174026E;
 Tue, 11 Mar 2025 06:27:23 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
 by phl-compute-11.internal (MEProxy); Tue, 11 Mar 2025 06:27:23 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Mar 2025 06:27:22 -0400 (EDT)
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
X-Inumbo-ID: 6c2b999a-fe63-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1741688843; x=1741775243; bh=G
	Dnll3y+gmMLSLaE30GCig0th50OGyuwuf+2w72YSio=; b=lr1xUqHPG5mG1c5/j
	zaXC0j1WhgoFWaC1wRkKzFbNOd9CXCnTgylI8BFj29ZN97D+pdtwSpMdSz14axdR
	/6SSPyX4SiPMwAAjQvxOTb05PZGEslokf7mDW5U/GwS/ICJ7bAVLMnKJfNbuRZxa
	VTR9LS0rkDrvZbjjD6v1l5nZ1nnY2ybBfLXLNfP7rdsHwn1Xrcpucka+hEsQEKIi
	MaVYqCx58AfjsKsaSfpEWkV88M52t53B5qurXucu6yIH0GeYfYyUCi+1ixz8lxL4
	Vag6uwJ8WTk8v4DJ4sHnaZOc5UY5tF2Hzd2Aj8w4ZHg9h8keIT5xcvd93O6A54Zj
	S5bLg==
X-ME-Sender: <xms:ChDQZwxvr2SPi1qT-0jYXTln4Hl0f6UjeISTo-XjAyyAw70NEDkvtw>
    <xme:ChDQZ0QsfYsa9MaQseyAeZdTzGuJc4A7egkjmKxrRGjCmeT9Ht7Gd7MmKJukM0wfL
    hqQi_mBZCJezjvvrlk>
X-ME-Received: <xmr:ChDQZyVJIZh7BwdhhpHckUlIwjlea7p5-tyThxIwIkBGl0UZim2A4Qjy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdduleelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepufgvrhhgihihucfmihgsrhhikhcuoefuvghrghhihigpmfhisghrih
    hksegvphgrmhdrtghomheqnecuggftrfgrthhtvghrnheptdejgeegvdffkeekleefueev
    gfduheevkedvhfdvkeeludehleegheeivedugfejnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepshgrkhhisgesuggrrhhkshhtrghrrdhsihht
    vgdpnhgspghrtghpthhtohepudeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    igvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphht
    thhopehsthgvfhgrnhhordhsthgrsggvlhhlihhnihesrghmugdrtghomhdprhgtphhtth
    hopehjuhhlihgvnhesgigvnhdrohhrghdprhgtphhtthhopegsvghrthhrrghnugdrmhgr
    rhhquhhishesrghrmhdrtghomhdprhgtphhtthhopehmihgthhgrlhdrohhriigvlhesrg
    hmugdrtghomhdprhgtphhtthhopehvohhlohguhihmhihrpggsrggstghhuhhksegvphgr
    mhdrtghomhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrd
    gtohhmpdhrtghpthhtoheprghnthhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggt
    hhdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:ChDQZ-jO4nbfzof4DHKdJghxS6sqkBGVLLp6OdlbzJ_9-K06lc55Gw>
    <xmx:ChDQZyBNmo5TqBaT3zya5s6KRtBnNEbebU7CyF8u0FJGANl524d1eg>
    <xmx:ChDQZ_IyZLOXM7A1UHeuwkLcOlRFhKgtyFfJuV82GRpWdkOf-CUSvQ>
    <xmx:ChDQZ5CuJK01ZXQfV4YQNjHW-3PiebySkHuGvByC2iP9-OZj-h6rZA>
    <xmx:ChDQZyyA5ILarRMHVqiAU6lqYwvARmjgmh2L2BcjS1klkj8OctOhvQ>
    <xmx:CxDQZ4TLYs5hUtWNyzA3lgUanqiwrdZ2MFifSsvaOdaykfZsYkqjkk_CNdRp>
Feedback-ID: id5edb69a:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [PATCH v3 3/3] xen: mem_access: conditionally compile vm_event.c & monitor.c
Date: Tue, 11 Mar 2025 12:27:20 +0200
Message-Id: <e37da57b94fd3bd4f314e6fbd7b6b94aee4b4607.1741687645.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1741687645.git.Sergiy_Kibrik@epam.com>
References: <cover.1741687645.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Extend coverage of CONFIG_VM_EVENT option and make the build of VM events
and monitoring support optional. Also make MEM_PAGING option depend on VM_EVENT
to document that mem_paging is relying on vm_event.
This is to reduce code size on Arm when this option isn't enabled.

CC: Jan Beulich <jbeulich@suse.com>
CC: Tamas K Lengyel <tamas@tklengyel.com>
Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
changes in v3:
 - add dependency MEM_PAGING -> VM_EVENT
 - monitor_domctl() stub returns -EOPNOTSUPP
changes in v2:
 - rename CONFIG_MEM_ACCESS -> CONFIG_VM_EVENT
 - tags
---
 xen/arch/arm/Makefile      |  4 ++--
 xen/arch/arm/vsmc.c        |  3 ++-
 xen/arch/x86/Kconfig       |  2 +-
 xen/common/Makefile        |  4 ++--
 xen/include/xen/monitor.h  |  9 +++++++++
 xen/include/xen/vm_event.h | 14 +++++++++++---
 6 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 3bd5125e64..4837ad467a 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -40,7 +40,7 @@ obj-$(CONFIG_LIVEPATCH) += livepatch.o
 obj-$(CONFIG_LLC_COLORING) += llc-coloring.o
 obj-$(CONFIG_VM_EVENT) += mem_access.o
 obj-y += mm.o
-obj-y += monitor.o
+obj-$(CONFIG_VM_EVENT) += monitor.o
 obj-y += p2m.o
 obj-y += platform.o
 obj-y += platform_hypercall.o
@@ -66,7 +66,7 @@ obj-$(CONFIG_VGICV2) += vgic-v2.o
 obj-$(CONFIG_GICV3) += vgic-v3.o
 obj-$(CONFIG_HAS_ITS) += vgic-v3-its.o
 endif
-obj-y += vm_event.o
+obj-$(CONFIG_VM_EVENT) += vm_event.o
 obj-y += vtimer.o
 obj-$(CONFIG_SBSA_VUART_CONSOLE) += vpl011.o
 obj-y += vsmc.o
diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index e253865b6c..6081f14ed0 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -330,7 +330,8 @@ void do_trap_smc(struct cpu_user_regs *regs, const union hsr hsr)
     }
 
     /* If monitor is enabled, let it handle the call. */
-    if ( current->domain->arch.monitor.privileged_call_enabled )
+    if ( IS_ENABLED(CONFIG_VM_EVENT) &&
+         current->domain->arch.monitor.privileged_call_enabled )
         rc = monitor_smc();
 
     if ( rc == 1 )
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 6e41bc0fb4..f086799594 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -350,7 +350,7 @@ endif
 
 config MEM_PAGING
 	bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
-	depends on HVM
+	depends on HVM && VM_EVENT
 
 config MEM_SHARING
 	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
diff --git a/xen/common/Makefile b/xen/common/Makefile
index b71d4b3efa..ac23120d7d 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -54,7 +54,7 @@ obj-y += timer.o
 obj-$(CONFIG_TRACEBUFFER) += trace.o
 obj-y += version.o
 obj-y += virtual_region.o
-obj-y += vm_event.o
+obj-$(CONFIG_VM_EVENT) += vm_event.o
 obj-$(CONFIG_HAS_VMAP) += vmap.o
 obj-y += vsprintf.o
 obj-y += wait.o
@@ -68,7 +68,7 @@ obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o
 
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
 obj-y += domctl.o
-obj-y += monitor.o
+obj-$(CONFIG_VM_EVENT) += monitor.o
 obj-y += sysctl.o
 endif
 
diff --git a/xen/include/xen/monitor.h b/xen/include/xen/monitor.h
index 713d54f7c1..634b6cd2a1 100644
--- a/xen/include/xen/monitor.h
+++ b/xen/include/xen/monitor.h
@@ -27,8 +27,17 @@
 struct domain;
 struct xen_domctl_monitor_op;
 
+#ifdef CONFIG_VM_EVENT
 int monitor_domctl(struct domain *d, struct xen_domctl_monitor_op *mop);
 void monitor_guest_request(void);
+#else
+static inline int monitor_domctl(struct domain *d,
+                                 struct xen_domctl_monitor_op *mop)
+{
+    return -EOPNOTSUPP;
+}
+static inline void monitor_guest_request(void) {}
+#endif
 
 int monitor_traps(struct vcpu *v, bool sync, vm_event_request_t *req);
 
diff --git a/xen/include/xen/vm_event.h b/xen/include/xen/vm_event.h
index 9a86358b42..268c85fc4f 100644
--- a/xen/include/xen/vm_event.h
+++ b/xen/include/xen/vm_event.h
@@ -50,9 +50,6 @@ struct vm_event_domain
     unsigned int last_vcpu_wake_up;
 };
 
-/* Clean up on domain destruction */
-void vm_event_cleanup(struct domain *d);
-
 /* Returns whether a ring has been set up */
 bool vm_event_check_ring(struct vm_event_domain *ved);
 
@@ -88,7 +85,18 @@ void vm_event_cancel_slot(struct domain *d, struct vm_event_domain *ved);
 void vm_event_put_request(struct domain *d, struct vm_event_domain *ved,
                           vm_event_request_t *req);
 
+#ifdef CONFIG_VM_EVENT
+/* Clean up on domain destruction */
+void vm_event_cleanup(struct domain *d);
 int vm_event_domctl(struct domain *d, struct xen_domctl_vm_event_op *vec);
+#else
+static inline void vm_event_cleanup(struct domain *d) {}
+static inline int vm_event_domctl(struct domain *d,
+                                  struct xen_domctl_vm_event_op *vec)
+{
+    return -EINVAL;
+}
+#endif
 
 void vm_event_vcpu_pause(struct vcpu *v);
 void vm_event_vcpu_unpause(struct vcpu *v);
-- 
2.25.1


