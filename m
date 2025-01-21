Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85957A17B80
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 11:26:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875309.1285755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBSK-0006Pm-Hf; Tue, 21 Jan 2025 10:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875309.1285755; Tue, 21 Jan 2025 10:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBSK-0006Mt-DQ; Tue, 21 Jan 2025 10:26:00 +0000
Received: by outflank-mailman (input) for mailman id 875309;
 Tue, 21 Jan 2025 10:25:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fb3U=UN=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1taBSJ-0006Mk-2S
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 10:25:59 +0000
Received: from fforwardh-b2-smtp.messagingengine.com
 (fforwardh-b2-smtp.messagingengine.com [202.12.124.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a301b33-d7e2-11ef-a0e4-8be0dac302b0;
 Tue, 21 Jan 2025 11:25:58 +0100 (CET)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfforwardh.stl.internal (Postfix) with ESMTP id B310C174028A;
 Tue, 21 Jan 2025 05:25:56 -0500 (EST)
Received: from phl-frontend-01 ([10.202.2.160])
 by phl-compute-10.internal (MEProxy); Tue, 21 Jan 2025 05:25:57 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Jan 2025 05:25:55 -0500 (EST)
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
X-Inumbo-ID: 1a301b33-d7e2-11ef-a0e4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1737455156; x=1737541556; bh=r
	kkiqbSwc6jmF2J2ez5nWu827Q/H2UnBXmYuGwWx5kg=; b=MXPKNXlkB+7ZSX6ff
	P8KCCIwBFR4cdpTIx9skAfPBsStA31IhWEcTe+7IWnJpxmdSQMqXHfPfdmGjm8lX
	j3JsTful9BhQGU1omBizN7D3nv2MwQECD/eMvXxR+I/kIIYiOK1NOIEKP5UBgxie
	Eh/g9vh9DIURKMaEJP2pL0vDltEQ2IK8a2X8dFJC8KoZRl6Q0BNNvYR+ntN3OtqN
	CmMPqF/FEkCS7c2N3B3RzhTVn1QVv718RzsOBLndW++urZGE7kflO+OK40a4u6Lx
	X/AxEZNhm6tJkogQGFc01qkTgDrV+Elv/QBdDqUmU1nU+kssStLLrqSs0pfNT91Y
	a5Inw==
X-ME-Sender: <xms:NHaPZyUePAwdK2dnk5NYu5SlFC0FxB51LpKRuz2A5KqtRiNmdVXrvA>
    <xme:NHaPZ-kvwGCk3DPCWVMnYoM4wecfOoH24oyLAInsCZ9eaLUGPIC94ep0DFFoCpg3X
    bjVH14goWq-QKGTavY>
X-ME-Received: <xmr:NHaPZ2YUDA1RnYsb24DjyoQySGEilR0N2L8FLM8ZArcqNhyZMGUZz3SZOwvnK3stqvzwgjWfUShx3cHzzbWxjL3KxKcScoTMcpp2Gjzg5rk2ZV3h>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejuddgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomhepufgvrhhgihihucfmihgsrhhikhcuoefuvghrghhihigpmfhisghrihhkse
    gvphgrmhdrtghomheqnecuggftrfgrthhtvghrnheptdejgeegvdffkeekleefueevgfdu
    heevkedvhfdvkeeludehleegheeivedugfejnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepshgrkhhisgesuggrrhhkshhtrghrrdhsihhtvgdp
    nhgspghrtghpthhtohepudeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeigvg
    hnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthho
    pehsthgvfhgrnhhordhsthgrsggvlhhlihhnihesrghmugdrtghomhdprhgtphhtthhope
    hjuhhlihgvnhesgigvnhdrohhrghdprhgtphhtthhopegsvghrthhrrghnugdrmhgrrhhq
    uhhishesrghrmhdrtghomhdprhgtphhtthhopehmihgthhgrlhdrohhriigvlhesrghmug
    drtghomhdprhgtphhtthhopehvohhlohguhihmhihrpggsrggstghhuhhksegvphgrmhdr
    tghomhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtoh
    hmpdhrtghpthhtoheprghnthhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthhdp
    rhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:NHaPZ5W_Y-9IgPdL6bHJh0LAhI0_hPVOBIaOJ5BA81EB4AoPo2Q9uw>
    <xmx:NHaPZ8k0OJsE5U53mYW1o2OWQhnDIREwaSeUwrJHN_FeK3K2Z3TixQ>
    <xmx:NHaPZ-erjQ4lcQCWNEQtmBXAeXqgSpGOm9Rq62bM1eVZoQXhDqWsEg>
    <xmx:NHaPZ-FMVbjiUBjinjT7VK_Br-OV2VvL1mXuYH6h240Su6KQRRO0BA>
    <xmx:NHaPZ6mugCXs6jtlEXvTURl-GlxNbGbN4G8cxtw-09T7lU8VZvHnDA>
    <xmx:NHaPZwkaSjgOfz8lf8MWyaJOH3yS1PyLIIhdmo6_xui2Ns9fuf_KDhAGg5rf>
Feedback-ID: i7de5e997:Fastmail
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
Subject: [PATCH v2 4/4] xen: mem_access: conditionally compile vm_event.c & monitor.c
Date: Tue, 21 Jan 2025 12:25:53 +0200
Message-Id: <2e8b9c5390019ef66610a21d9a8744282e2badeb.1737452864.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1737452864.git.Sergiy_Kibrik@epam.com>
References: <cover.1737452864.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Extend coverage of CONFIG_VM_EVENT option and make the build of VM events
and monitoring support optional.
This is to reduce code size on Arm when this option isn't enabled.

CC: Jan Beulich <jbeulich@suse.com>
CC: Tamas K Lengyel <tamas@tklengyel.com>
Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
changes in v2:
 - rename CONFIG_MEM_ACCESS -> CONFIG_VM_EVENT
 - tags
---
 xen/arch/arm/Makefile      |  4 ++--
 xen/arch/arm/vsmc.c        |  3 ++-
 xen/common/Makefile        |  4 ++--
 xen/include/xen/monitor.h  |  9 +++++++++
 xen/include/xen/vm_event.h | 14 +++++++++++---
 5 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index ad29316df1..e61238c4d0 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -39,7 +39,7 @@ obj-$(CONFIG_LIVEPATCH) += livepatch.o
 obj-$(CONFIG_LLC_COLORING) += llc-coloring.o
 obj-$(CONFIG_VM_EVENT) += mem_access.o
 obj-y += mm.o
-obj-y += monitor.o
+obj-$(CONFIG_VM_EVENT) += monitor.o
 obj-y += p2m.o
 obj-y += platform.o
 obj-y += platform_hypercall.o
@@ -65,7 +65,7 @@ obj-$(CONFIG_VGICV2) += vgic-v2.o
 obj-$(CONFIG_GICV3) += vgic-v3.o
 obj-$(CONFIG_HAS_ITS) += vgic-v3-its.o
 endif
-obj-y += vm_event.o
+obj-$(CONFIG_VM_EVENT) += vm_event.o
 obj-y += vtimer.o
 obj-$(CONFIG_SBSA_VUART_CONSOLE) += vpl011.o
 obj-y += vsmc.o
diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index 62d8117a12..1ea75cd7f1 100644
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
index 713d54f7c1..afb582bc26 100644
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
+    return -EINVAL;
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


