Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65663A6B760
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 10:30:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923516.1327059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYi6-0002XG-Tz; Fri, 21 Mar 2025 09:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923516.1327059; Fri, 21 Mar 2025 09:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYi6-0002SQ-Ol; Fri, 21 Mar 2025 09:30:38 +0000
Received: by outflank-mailman (input) for mailman id 923516;
 Fri, 21 Mar 2025 09:30:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T84i=WI=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1tvYeH-0005bg-N3
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 09:26:41 +0000
Received: from fforwardh-a4-smtp.messagingengine.com
 (fforwardh-a4-smtp.messagingengine.com [103.168.172.199])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 978a9adb-0636-11f0-9ffa-bf95429c2676;
 Fri, 21 Mar 2025 10:26:39 +0100 (CET)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfforwardh.phl.internal (Postfix) with ESMTP id 60CA92920461;
 Fri, 21 Mar 2025 05:26:38 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
 by phl-compute-12.internal (MEProxy); Fri, 21 Mar 2025 05:26:38 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Mar 2025 05:26:37 -0400 (EDT)
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
X-Inumbo-ID: 978a9adb-0636-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1742549198; x=1742635598; bh=hO7IRmLDcYkvvmp6ohPmSYI/1jBCpI+cMwA
	XGITLp2o=; b=y3kKORQROBxUgtQWY1WgelJbkge19MFansDVx3gl/LW5T5L1DL2
	y576CvmnGygfkDsliJh95f51p3t3S6rIWHrvec36YilqPTzUM0lj64+9P2Xl7QUO
	sZjCShykC4cXynmZNGzfVFcFGcra1UrJ8znIBT1ju90iMtv6HEGjNGUE+tb+djE8
	yBkEJMHCMOwiqyK+JzCVZxuurXLBp5nyaCjiRmLGvbbkJu+SuxlceEVebBoWRFYi
	BemZvphFr/PFzJsD7nvLU146LXjx0lDxqPA/LpLgyRNVY9ZqQORrlDFBNzHPso3L
	f4Vkaoz/XNYAqBx7eYxtxBOTYoUmV/btLaw==
X-ME-Sender: <xms:zTDdZ5QD5wtIwYIzIedmVuEtpdb21mXJDP_-VygKqyc0o3U2t_YMBA>
    <xme:zTDdZyya-YoBTXCCg3mHMvQ1JCO52yPK1OQHNUtzZiqHpZmteFVfpclWDxSyTL8Tg
    aHnhOs7HR0BvdPRkpA>
X-ME-Received: <xmr:zTDdZ-2Euqzg5oDkzJjrWiJd2VAoxqb05OmXaY7F_3jda8HuBBuxFFV6tQcL36t8BKzuyYUeni0wUVWHopd6emYytZAj52JokpD8Y6Bl5qufaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduhedtjeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttden
    ucfhrhhomhepufgvrhhgihihucfmihgsrhhikhcuoefuvghrghhihigpmfhisghrihhkse
    gvphgrmhdrtghomheqnecuggftrfgrthhtvghrnhepffffvdeifeeijefhheefuedvvedt
    heffjeeiveehgfettedvgedujefgudejgedvnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepshgrkhhisgesuggrrhhkshhtrghrrdhsihhtvgdp
    nhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnh
    dquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohep
    shgvrhhgihihpghkihgsrhhikhesvghprghmrdgtohhmpdhrtghpthhtoheprghnughrvg
    ifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopehrohhgvghrrdhp
    rghusegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvjhgrnhgurhhordhvrghllhgvjhhosegt
    lhhouhgurdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomh
X-ME-Proxy: <xmx:zTDdZxDzNnSGGd25JSDb2ASXhg0snkv3PFw-8ejQ40uAGZWMWnrQMg>
    <xmx:zTDdZyiiyQhYHZSYECJXRQw5pnQNF4ZXodi6o6pw1VrLjGq4RTqQOQ>
    <xmx:zTDdZ1qXUJNCDcpy89w15rEAALQj6Dd5cVbiT5n-ue8ieeOb2U1q2A>
    <xmx:zTDdZ9je4CbbbVreUEghsze5UIrd8V1d5T44AwxjgOluPpr-7Y-wMA>
    <xmx:zTDdZ9S-xV33KfDHJnSPG1kME-BbSbRG9pw2RmAaXUOfUpdZRaTm4A>
    <xmx:zjDdZ9V1LJ5yQZd73Rjx8B2hPXeV1iRQffsgHB6T3HPvG6TLt8b0AEeGbxsO>
Feedback-ID: id5ffd314:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86: make Viridian support optional
Date: Fri, 21 Mar 2025 11:26:33 +0200
Message-Id: <20250321092633.3982645-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add config option HVM_VIRIDIAN that covers viridian code within HVM.
Calls to viridian functions guarded by is_viridian_domain() and related macros.
Having this option may be beneficial by reducing code footprint for systems
that are not using Hyper-V.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
CC: Jan Beulich <jbeulich@suse.com>
---
changes in v2:
 - changed title in Kconfig & add help text
 - moved Kconfig changes to arch/x86/hvm/Kconfig
 - address review comments
---
 xen/arch/x86/hvm/Kconfig              | 10 ++++++++++
 xen/arch/x86/hvm/Makefile             |  2 +-
 xen/arch/x86/hvm/hvm.c                | 27 ++++++++++++++++++---------
 xen/arch/x86/hvm/vlapic.c             | 11 +++++++----
 xen/arch/x86/include/asm/hvm/domain.h |  2 ++
 xen/arch/x86/include/asm/hvm/hvm.h    |  3 ++-
 xen/arch/x86/include/asm/hvm/vcpu.h   |  2 ++
 7 files changed, 42 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index 2def0f98e2..9cdcc0d3cd 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -63,6 +63,16 @@ config ALTP2M
 
 	  If unsure, stay with defaults.
 
+config HVM_VIRIDIAN
+	bool "Hyper-V enlighnments for guests" if EXPERT
+	default y
+	help
+	  Support optimizations for Hyper-V guests such as faster hypercalls,
+	  efficient timer and interrupt handling, and enhanced paravirtualized
+	  I/O. This is to improve performance and compatibility of Windows VMs.
+
+	  If unsure, say Y.
+
 config MEM_PAGING
 	bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
 	depends on VM_EVENT
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index 4c1fa5c6c2..6cc2e74fc4 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -1,6 +1,6 @@
 obj-$(CONFIG_AMD_SVM) += svm/
 obj-$(CONFIG_INTEL_VMX) += vmx/
-obj-y += viridian/
+obj-$(CONFIG_HVM_VIRIDIAN) += viridian/
 
 obj-y += asid.o
 obj-y += dm.o
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 5950f3160f..529068e80c 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -695,9 +695,12 @@ int hvm_domain_initialise(struct domain *d,
     if ( hvm_tsc_scaling_supported )
         d->arch.hvm.tsc_scaling_ratio = hvm_default_tsc_scaling_ratio;
 
-    rc = viridian_domain_init(d);
-    if ( rc )
-        goto fail2;
+    if ( is_viridian_domain(d) )
+    {
+        rc = viridian_domain_init(d);
+        if ( rc )
+            goto fail2;
+    }
 
     rc = alternative_call(hvm_funcs.domain_initialise, d);
     if ( rc != 0 )
@@ -733,7 +736,8 @@ void hvm_domain_relinquish_resources(struct domain *d)
     if ( hvm_funcs.nhvm_domain_relinquish_resources )
         alternative_vcall(hvm_funcs.nhvm_domain_relinquish_resources, d);
 
-    viridian_domain_deinit(d);
+    if ( is_viridian_domain(d) )
+        viridian_domain_deinit(d);
 
     ioreq_server_destroy_all(d);
 
@@ -1637,9 +1641,12 @@ int hvm_vcpu_initialise(struct vcpu *v)
          && (rc = nestedhvm_vcpu_initialise(v)) < 0 ) /* teardown: nestedhvm_vcpu_destroy */
         goto fail5;
 
-    rc = viridian_vcpu_init(v);
-    if ( rc )
-        goto fail6;
+    if ( is_viridian_domain(d) )
+    {
+        rc = viridian_vcpu_init(v);
+        if ( rc )
+            goto fail6;
+    }
 
     rc = ioreq_server_add_vcpu_all(d, v);
     if ( rc != 0 )
@@ -1669,13 +1676,15 @@ int hvm_vcpu_initialise(struct vcpu *v)
  fail2:
     hvm_vcpu_cacheattr_destroy(v);
  fail1:
-    viridian_vcpu_deinit(v);
+    if ( is_viridian_domain(d) )
+        viridian_vcpu_deinit(v);
     return rc;
 }
 
 void hvm_vcpu_destroy(struct vcpu *v)
 {
-    viridian_vcpu_deinit(v);
+    if ( is_viridian_domain(v->domain) )
+        viridian_vcpu_deinit(v);
 
     ioreq_server_remove_vcpu_all(v->domain, v);
 
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 065b2aab5b..3d76ce3f0d 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -426,7 +426,8 @@ void vlapic_EOI_set(struct vlapic *vlapic)
      * priority vector and then recurse to handle the lower priority
      * vector.
      */
-    bool missed_eoi = viridian_apic_assist_completed(v);
+    bool missed_eoi = has_viridian_apic_assist(v->domain) &&
+                      viridian_apic_assist_completed(v);
     int vector;
 
  again:
@@ -442,7 +443,7 @@ void vlapic_EOI_set(struct vlapic *vlapic)
      * NOTE: It is harmless to call viridian_apic_assist_clear() on a
      *       recursion, even though it is not necessary.
      */
-    if ( !missed_eoi )
+    if ( has_viridian_apic_assist(v->domain) && !missed_eoi )
         viridian_apic_assist_clear(v);
 
     vlapic_clear_vector(vector, &vlapic->regs->data[APIC_ISR]);
@@ -1360,7 +1361,8 @@ int vlapic_has_pending_irq(struct vcpu *v)
      * If so, we need to emulate the EOI here before comparing ISR
      * with IRR.
      */
-    if ( viridian_apic_assist_completed(v) )
+    if ( has_viridian_apic_assist(v->domain) &&
+         viridian_apic_assist_completed(v) )
         vlapic_EOI_set(vlapic);
 
     isr = vlapic_find_highest_isr(vlapic);
@@ -1373,7 +1375,8 @@ int vlapic_has_pending_irq(struct vcpu *v)
     if ( isr >= 0 &&
          (irr & 0xf0) <= (isr & 0xf0) )
     {
-        viridian_apic_assist_clear(v);
+        if ( has_viridian_apic_assist(v->domain) )
+            viridian_apic_assist_clear(v);
         return -1;
     }
 
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
index 333501d5f2..07eec231f0 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -111,7 +111,9 @@ struct hvm_domain {
     /* hypervisor intercepted msix table */
     struct list_head       msixtbl_list;
 
+#ifdef CONFIG_HVM_VIRIDIAN
     struct viridian_domain *viridian;
+#endif
 
     /*
      * TSC value that VCPUs use to calculate their tsc_offset value.
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 963e820113..a836b2f4de 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -507,7 +507,8 @@ hvm_get_cpl(struct vcpu *v)
     (has_hvm_params(d) ? (d)->arch.hvm.params[HVM_PARAM_VIRIDIAN] : 0)
 
 #define is_viridian_domain(d) \
-    (is_hvm_domain(d) && (viridian_feature_mask(d) & HVMPV_base_freq))
+    (IS_ENABLED(CONFIG_HVM_VIRIDIAN) && \
+    is_hvm_domain(d) && (viridian_feature_mask(d) & HVMPV_base_freq))
 
 #define is_viridian_vcpu(v) \
     is_viridian_domain((v)->domain)
diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h b/xen/arch/x86/include/asm/hvm/vcpu.h
index 196fed6d5d..4c5a76a707 100644
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -172,7 +172,9 @@ struct hvm_vcpu {
     /* Pending hw/sw interrupt (.vector = -1 means nothing pending). */
     struct x86_event     inject_event;
 
+#ifdef CONFIG_HVM_VIRIDIAN
     struct viridian_vcpu *viridian;
+#endif
 };
 
 #endif /* __ASM_X86_HVM_VCPU_H__ */
-- 
2.25.1


