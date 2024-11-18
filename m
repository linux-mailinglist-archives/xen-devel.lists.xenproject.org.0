Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A169D19B5
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 21:37:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839530.1255330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD8UG-0004Wq-UZ; Mon, 18 Nov 2024 20:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839530.1255330; Mon, 18 Nov 2024 20:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD8UG-0004VN-RX; Mon, 18 Nov 2024 20:36:44 +0000
Received: by outflank-mailman (input) for mailman id 839530;
 Mon, 18 Nov 2024 20:36:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N8iN=SN=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1tD8UE-0004Ug-KX
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 20:36:42 +0000
Received: from fforwardh-b3-smtp.messagingengine.com
 (fforwardh-b3-smtp.messagingengine.com [202.12.124.198])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf592a17-a5ec-11ef-99a3-01e77a169b0f;
 Mon, 18 Nov 2024 21:36:38 +0100 (CET)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal
 [10.202.2.47])
 by mailfforwardh.stl.internal (Postfix) with ESMTP id BC3F81740475;
 Mon, 18 Nov 2024 15:36:37 -0500 (EST)
Received: from phl-frontend-01 ([10.202.2.160])
 by phl-compute-07.internal (MEProxy); Mon, 18 Nov 2024 15:36:37 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Nov 2024 15:36:36 -0500 (EST)
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
X-Inumbo-ID: cf592a17-a5ec-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIwMi4xMi4xMjQuMTk4IiwiaGVsbyI6ImZmb3J3YXJkaC1iMy1zbXRwLm1lc3NhZ2luZ2VuZ2luZS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6ImNmNTkyYTE3LWE1ZWMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxOTYyMTk5LjA4NjkyNiwic2VuZGVyIjoic2FraWJAZGFya3N0YXIuc2l0ZSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1731962197; x=
	1732048597; bh=JjqaStQUlvjl1q7maieYmrj8Zw8zsTy9UsvtpDnshsQ=; b=L
	ISSJuY6Gpsvj+Qh69757/lblRxPaLdTpsaUtfncatz6fkCRt7zqO0E0ekkacUy80
	ohgcjAR8f4oz9ZAnzm7Y5jwk4iPAgwB34GgjtuhwJxSsdHcjYSmx5QyJo538coCu
	jg2vtc5ocsrc4u62t1NxHvZTDattsFLxYDy/OQcGAen3F0dj/w+Mp+fvXJbc01EQ
	DeILJUeFDPmHBMH+BZL0lThz+0te2xgDXdcJmuQkNZ08JVgThkVu/wV+u0YEvM98
	DdnnlSVxlx0L/BFj31PF+VeYyKI0d7tq/ja2r2IEJtnP+XnOWuOUaGHFt7tsyF4p
	OZqtmUhjMPHEFKFLYSzFA==
X-ME-Sender: <xms:VaU7Z4wK-VTu9E5hBsyAAquWlRmZdyll6lKLVNk9dtPZAPCFuKDPOw>
    <xme:VaU7Z8RhiVY4YjPVnAfh68cufgJ6RgzlxCFXU4dECsh82UYswXfa8aXSHxwmQ1UlF
    4Qmsv7UCUbrnUDVnbE>
X-ME-Received: <xmr:VaU7Z6UQZVYMG7n9q_fdr1IWZusBGuFDSvLatYlM5kKPxBsoXs2f0FCkCXrSYWjS1iFXjPxepzB_qH8jrGCs8OLsftmnWmu2e4otZN4mQV_h0RnL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrfedtgddufeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefuvghrghhihicumfhisghrihhkuceoufgvrhhgihihpgfmihgsrhhikh
    esvghprghmrdgtohhmqeenucggtffrrghtthgvrhhnpeeigfdvjeduieefveefudegvdel
    gfehjedttdeifffhlefgudetudetheduleevueenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehsrghkihgssegurghrkhhsthgrrhdrshhithgv
    pdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeigvg
    hnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthho
    pehsvghrghhihigpkhhisghrihhksegvphgrmhdrtghomhdprhgtphhtthhopegrnhgurh
    gvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtoheprhhoghgvrhdr
    phgruhestghithhrihigrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomh
X-ME-Proxy: <xmx:VaU7Z2jA-0gKKENixmG0DApSAsZX1rwc4vCKdFbSljHZPcFHSAfUGw>
    <xmx:VaU7Z6AgMg4N3cYMm0KTH_5z-93oxBAFv9nfffU2RixLM-mjZJ3lFQ>
    <xmx:VaU7Z3JADmnXelbwKFzbFZLhpqHTo1U77-mpM_253pfIZxa_IG5l7w>
    <xmx:VaU7ZxBurUBQ9bXB4M97N5j54xUG6XR2mNOJW7QaOT0pRYnTP3c28A>
    <xmx:VaU7Z9-u-DpzvvUWV3ThJkuU1l1TDndKI6I3v05V7lmYDbDAEzKaUD6H1IlW>
Feedback-ID: ifff9e3d7:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v3 1/2] x86/hvm: introduce config option for ACPI PM timer
Date: Mon, 18 Nov 2024 22:36:34 +0200
Message-Id: <7cfc1bf7d68dd470a56344fea50f8e1535d10afb.1731961652.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1731961652.git.Sergiy_Kibrik@epam.com>
References: <cover.1731961652.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce config option X86_HVM_PMTIMER and make pmtimer emulation driver
configurable and possible to disable on systems that don't need it.
Option X86_X86_HVM_PMTIMER depends on HVM option, because this driver is part
of HVM support code.

Introduced additional check of domain's emulation flags, to cover the case
when user explicitly states the requirement of emulated devices that are
disabled in the build. HVM always require these devices to be present so domains
of this type can't be created when pmtimer or any other emulated device are
disabled.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com> # approach
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
CC: Jan Beulich <jbeulich@suse.com>
---
changes in v3:
 - changed config option's description
 - fixed bug in emulation_flags_ok()
 - modified build-time checks of X86_EMU_ALL vs XEN_X86_EMU_ALL
 - tags
changes in v2:
 - updated description
 - renamed config option X86_PMTIMER -> X86_HVM_PMTIMER & moved related
   Kconfig changes to this patch
 - define X86_EMU_PM to 0 when !X86_HVM_PMTIMER
 - reverted changes to has_vpm() macro
 - moved emulation_flags_ok() checks to this patch
 - guard struct hvm_hw_acpi acpi attribute of struct domain
---
 xen/arch/x86/Kconfig                  | 13 +++++++++++++
 xen/arch/x86/domain.c                 | 10 +++++++++-
 xen/arch/x86/hvm/Makefile             |  2 +-
 xen/arch/x86/include/asm/acpi.h       |  5 +++++
 xen/arch/x86/include/asm/domain.h     |  8 ++++++--
 xen/arch/x86/include/asm/hvm/domain.h |  2 ++
 xen/arch/x86/include/asm/hvm/vpt.h    | 10 ++++++++++
 7 files changed, 46 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 9cdd04721a..d8f108a3ca 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -144,6 +144,19 @@ config INTEL_VMX
 	  If your system includes a processor with Intel VT-x support, say Y.
 	  If in doubt, say Y.
 
+menu "Emulated HVM devices support"
+       visible if EXPERT
+       depends on HVM
+
+config X86_HVM_PMTIMER
+	bool "ACPI PM timer emulation support"
+	default y
+	help
+	  Build driver that emulates ACPI PM timer for HVM guests.
+
+	  If unsure, say Y.
+endmenu
+
 config XEN_SHSTK
 	bool "Supervisor Shadow Stacks"
 	depends on HAS_AS_CET_SS
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 78a13e6812..d867b4f046 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -744,8 +744,16 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
 {
 #ifdef CONFIG_HVM
     /* This doesn't catch !CONFIG_HVM case but it is better than nothing */
-    BUILD_BUG_ON(X86_EMU_ALL != XEN_X86_EMU_ALL);
+    BUILD_BUG_ON((X86_EMU_ALL & ~X86_EMU_PM) !=
+                 (XEN_X86_EMU_ALL & ~XEN_X86_EMU_PM));
 #endif
+#ifdef CONFIG_X86_HVM_PMTIMER
+       BUILD_BUG_ON(X86_EMU_PM != XEN_X86_EMU_PM);
+#endif
+
+    /* emflags contain non-supported bits */
+    if ( (emflags & X86_EMU_ALL) != emflags )
+        return false;
 
     if ( is_hvm_domain(d) )
     {
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index 4c1fa5c6c2..3af8963218 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -18,7 +18,7 @@ obj-y += irq.o
 obj-y += monitor.o
 obj-y += mtrr.o
 obj-y += nestedhvm.o
-obj-y += pmtimer.o
+obj-$(CONFIG_X86_HVM_PMTIMER) += pmtimer.o
 obj-y += quirks.o
 obj-y += rtc.o
 obj-y += save.o
diff --git a/xen/arch/x86/include/asm/acpi.h b/xen/arch/x86/include/asm/acpi.h
index 217819dd61..eb2e4a1ede 100644
--- a/xen/arch/x86/include/asm/acpi.h
+++ b/xen/arch/x86/include/asm/acpi.h
@@ -150,8 +150,13 @@ void acpi_mmcfg_init(void);
 /* Incremented whenever we transition through S3. Value is 1 during boot. */
 extern uint32_t system_reset_counter;
 
+#ifdef CONFIG_X86_HVM_PMTIMER
 void hvm_acpi_power_button(struct domain *d);
 void hvm_acpi_sleep_button(struct domain *d);
+#else
+static inline void hvm_acpi_power_button(struct domain *d) {}
+static inline void hvm_acpi_sleep_button(struct domain *d) {}
+#endif
 
 /* suspend/resume */
 void save_rest_processor_state(void);
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index b79d6badd7..8550473997 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -463,7 +463,6 @@ struct arch_domain
 #ifdef CONFIG_HVM
 #define X86_EMU_LAPIC    XEN_X86_EMU_LAPIC
 #define X86_EMU_HPET     XEN_X86_EMU_HPET
-#define X86_EMU_PM       XEN_X86_EMU_PM
 #define X86_EMU_RTC      XEN_X86_EMU_RTC
 #define X86_EMU_IOAPIC   XEN_X86_EMU_IOAPIC
 #define X86_EMU_PIC      XEN_X86_EMU_PIC
@@ -474,7 +473,6 @@ struct arch_domain
 #else
 #define X86_EMU_LAPIC    0
 #define X86_EMU_HPET     0
-#define X86_EMU_PM       0
 #define X86_EMU_RTC      0
 #define X86_EMU_IOAPIC   0
 #define X86_EMU_PIC      0
@@ -484,6 +482,12 @@ struct arch_domain
 #define X86_EMU_VPCI     0
 #endif
 
+#ifdef CONFIG_X86_HVM_PMTIMER
+#define X86_EMU_PM       XEN_X86_EMU_PM
+#else
+#define X86_EMU_PM       0
+#endif
+
 #define X86_EMU_PIT     XEN_X86_EMU_PIT
 
 /* This must match XEN_X86_EMU_ALL in xen.h */
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
index 333501d5f2..a4fddf7754 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -80,8 +80,10 @@ struct hvm_domain {
      * in public header files.
      * Internally, however, we will be using hvm_hw_acpi.
      */
+#ifdef CONFIG_X86_HVM_PMTIMER
 #define hvm_hw_acpi hvm_hw_pmtimer
     struct hvm_hw_acpi     acpi;
+#endif
 
     /* VCPU which is current target for 8259 interrupts. */
     struct vcpu           *i8259_target;
diff --git a/xen/arch/x86/include/asm/hvm/vpt.h b/xen/arch/x86/include/asm/hvm/vpt.h
index 0b92b28625..f24ef08925 100644
--- a/xen/arch/x86/include/asm/hvm/vpt.h
+++ b/xen/arch/x86/include/asm/hvm/vpt.h
@@ -187,10 +187,20 @@ void rtc_deinit(struct domain *d);
 void rtc_reset(struct domain *d);
 void rtc_update_clock(struct domain *d);
 
+#ifdef CONFIG_X86_HVM_PMTIMER
 void pmtimer_init(struct vcpu *v);
 void pmtimer_deinit(struct domain *d);
 void pmtimer_reset(struct domain *d);
 int pmtimer_change_ioport(struct domain *d, uint64_t version);
+#else
+static inline void pmtimer_init(struct vcpu *v) {}
+static inline void pmtimer_deinit(struct domain *d) {}
+static inline void pmtimer_reset(struct domain *d) {}
+static inline int pmtimer_change_ioport(struct domain *d, uint64_t version)
+{
+    return -ENODEV;
+}
+#endif
 
 void hpet_init(struct domain *d);
 void hpet_deinit(struct domain *d);
-- 
2.25.1


