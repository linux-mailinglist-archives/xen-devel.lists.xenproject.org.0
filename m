Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC906A60845
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 06:25:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913762.1319662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsxXw-0004nv-Mb; Fri, 14 Mar 2025 05:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913762.1319662; Fri, 14 Mar 2025 05:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsxXw-0004mK-J8; Fri, 14 Mar 2025 05:25:24 +0000
Received: by outflank-mailman (input) for mailman id 913762;
 Fri, 14 Mar 2025 05:25:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HRIH=WB=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1tsxXv-0004mE-5I
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 05:25:23 +0000
Received: from fforwardh-a2-smtp.messagingengine.com
 (fforwardh-a2-smtp.messagingengine.com [103.168.172.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b915bd3d-0094-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 06:25:21 +0100 (CET)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfforwardh.phl.internal (Postfix) with ESMTP id 856F22920264;
 Fri, 14 Mar 2025 01:25:20 -0400 (EDT)
Received: from phl-frontend-01 ([10.202.2.160])
 by phl-compute-11.internal (MEProxy); Fri, 14 Mar 2025 01:25:20 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Mar 2025 01:25:19 -0400 (EDT)
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
X-Inumbo-ID: b915bd3d-0094-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1741929920; x=1742016320; bh=H
	mWd+LYawtKqrg6HbNeHz8lLTNDGbFlf6zjt95qM7mg=; b=6w0nkZXwiGj7C39j1
	OB77BAFEdAib1Q6ibY2GzPqeazwrFU8KTz6BKYspMwYSPQuZmPvq1Md/67U9t+1P
	k79y3VMnySIQGPzx94BBMjxeufBj8YVBiM93SjldmwQxnnzJ4UkZ665lC3yT8n6Z
	Vbs2VojjlGNmrUP3F5kx1QSDA8BlbwX9Jnk6Zv/Ozga4DfsJN+NHQaajFe35jUiL
	rrrQ2ILd5OLjMWZCf6khIYKosIwmtoZyKMu3IdaYQrXVMlVXBesVUMjibxnp4H+c
	3FGUQ1S/O5PCuUoQ6Xmf1FR4FBBjlhJ8+0MPplaoU9AxlLksDvGvxd1X/Zna45Qv
	nBGwA==
X-ME-Sender: <xms:wL3TZ84ssfhRr4KRxKDC952MsIQ25UHKUP8cnBIrn9WSGL3bVbimTQ>
    <xme:wL3TZ95Dj0uFeCTLSNcxepObXbt98aBWKWj_dmbRpRFRYBBWBaQiu9CDrCZPsxOim
    KOmM92pjpq9m3sQPeg>
X-ME-Received: <xmr:wL3TZ7exAe_GWkdNvOJaB5aIJFaPBYcuhvOz0nQS4LSXJ0N83-hHX2GDUU2Gvc22V2T_dRNKpqlN90kMPKl4WvBUWDb4irTzy6wbuEZGCX3oTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdelleekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepufgvrhhgihihucfmihgsrhhikhcuoefuvghrghhihigpmfhisghrih
    hksegvphgrmhdrtghomheqnecuggftrfgrthhtvghrnheptdejgeegvdffkeekleefueev
    gfduheevkedvhfdvkeeludehleegheeivedugfejnecuvehluhhsthgvrhfuihiivgepud
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
X-ME-Proxy: <xmx:wL3TZxKB-hSxCN5ez_Hj0YqzDgb_-O2vbxtKBH-y21G1ws6BrggVmg>
    <xmx:wL3TZwLletM7o5_0PUQ4CSwDlTCWgUp8ihH_5uLOmb7k9VRet6yl2g>
    <xmx:wL3TZyzq0c9TRJelAtyDJVU6rQo1H-zKQGrB1F68cbSjr8LwG_0r5Q>
    <xmx:wL3TZ0LO8Y-NduZIXnl9xDGlbVC6UMMla6Ku4OGrgwlUu0gHNr4LLA>
    <xmx:wL3TZ_bqzPL8LOuRuuaSBmw82OxTanXgPFrfr0WRlErbwqXuFLwQfw>
    <xmx:wL3TZ95muM7hZXs89_hJQyW6a5G58QiGf3KjsZRyySLAb23PoORmMNOwp2DB>
Feedback-ID: i7ffb7bbc:Fastmail
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
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v4 3/3] xen: mem_access: conditionally compile vm_event.c & monitor.c
Date: Fri, 14 Mar 2025 07:25:17 +0200
Message-Id: <61028e3f2ae363b8224ed7c7c48e86dddfe27fa1.1741772330.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1741772330.git.Sergiy_Kibrik@epam.com>
References: <cover.1741772330.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Extend coverage of CONFIG_VM_EVENT option and make the build of VM events
and monitoring support optional. Also make MEM_PAGING option depend on VM_EVENT
to document that mem_paging is relying on vm_event.
This is to reduce code size on Arm when this option isn't enabled.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Tamas K Lengyel <tamas@tklengyel.com>
---
changes in v4:
 - vm_event_domctl stub returns -EOPNOTSUPP
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
index 9a86358b42..c4535b6c61 100644
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
+    return -EOPNOTSUPP;
+}
+#endif
 
 void vm_event_vcpu_pause(struct vcpu *v);
 void vm_event_vcpu_unpause(struct vcpu *v);
-- 
2.25.1


