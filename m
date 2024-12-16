Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C41A19F2FB1
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 12:44:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857843.1270046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN9WB-0007vL-Oj; Mon, 16 Dec 2024 11:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857843.1270046; Mon, 16 Dec 2024 11:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN9WB-0007sT-LS; Mon, 16 Dec 2024 11:44:07 +0000
Received: by outflank-mailman (input) for mailman id 857843;
 Mon, 16 Dec 2024 11:44:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P+a7=TJ=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1tN9WA-0007sN-9I
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 11:44:06 +0000
Received: from fforwardh-a4-smtp.messagingengine.com
 (fforwardh-a4-smtp.messagingengine.com [103.168.172.199])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cabd406-bba3-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 12:44:04 +0100 (CET)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfforwardh.phl.internal (Postfix) with ESMTP id 5A4E92920AF9;
 Mon, 16 Dec 2024 06:44:03 -0500 (EST)
Received: from phl-frontend-01 ([10.202.2.160])
 by phl-compute-11.internal (MEProxy); Mon, 16 Dec 2024 06:44:03 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Dec 2024 06:44:01 -0500 (EST)
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
X-Inumbo-ID: 0cabd406-bba3-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1734349443; x=1734435843; bh=WLk/bUl8QTjpdm5SL23a7o3i/Q+j5mOh+lA
	vvvlQblE=; b=4SxQpDs6t686cCmXjLEHnhrTs0FCp9wdrUqNRLnCXKYiQVODBL4
	YnXxHAv15enSN41iLNxRqW1fQa/TmSWyj5X2C0QPOFyImD6tjim+XVI9Ri3rz3lL
	tYrGR7+fOuKCnGEosfMjZfu3EbeUbMe2666u1JejAySseGSrLquD+jjsAAKH5q2w
	lE6njDD7AZWy4lrHk3tESfUjOZsyV4vGPHOkVIJxzDHAQ/NmcrdpDDKh3cQpLogB
	gOYdVJWZauoYZirZ2d11ezNVoEr3qupDJrqRQvDa3kVFNEghVg0UbZEkmuGtw21Y
	fDlTM7tdJx06cT0+TuaLBItmK3mPtgmIxbA==
X-ME-Sender: <xms:ghJgZ1d3HlTobsanbTzd6Ibu3zT9RNr6fixM5otePHKDYI0-HWnzRg>
    <xme:ghJgZzMWW-4NMMvDLgOgvhQFb0kjkKRoouXtgsZo1FGzKAcqF8Vj8YdB_E0Ie-KEB
    n9y4al-LG7HR5464Ug>
X-ME-Received: <xmr:ghJgZ-idHvuiR8yQwM2Sq_Ntw63mhtItGSVUCgsqnN-DWnQU3XqqqKu8g_h_sAa5leQxzhnEZFYkQcL9XxVfAcKkwk4xpgl2FL4JcnXdnOrSR1uA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrleefgdefudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhr
    ohhmpefuvghrghhihicumfhisghrihhkuceoufgvrhhgihihpgfmihgsrhhikhesvghprg
    hmrdgtohhmqeenucggtffrrghtthgvrhhnpeegvdeffefhuddvteekgeelgefgleehkeev
    ieduudefhedtheellefhkeeivdevvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrkhhi
    sgesuggrrhhkshhtrghrrdhsihhtvgdpnhgspghrtghpthhtohepuddvpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhr
    ohhjvggtthdrohhrghdprhgtphhtthhopehsthgvfhgrnhhordhsthgrsggvlhhlihhnih
    esrghmugdrtghomhdprhgtphhtthhopehjuhhlihgvnhesgigvnhdrohhrghdprhgtphht
    thhopegsvghrthhrrghnugdrmhgrrhhquhhishesrghrmhdrtghomhdprhgtphhtthhope
    hmihgthhgrlhdrohhriigvlhesrghmugdrtghomhdprhgtphhtthhopehvohhlohguhihm
    hihrpggsrggstghhuhhksegvphgrmhdrtghomhdprhgtphhtthhopegrnhgurhgvfidrtg
    hoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtoheprghnthhhohhnhidrphgv
    rhgrrhgusehvrghtvghsrdhtvggthhdprhgtphhtthhopehjsggvuhhlihgthhesshhush
    gvrdgtohhm
X-ME-Proxy: <xmx:ghJgZ-8Xq3Qw_6omyBBU3oVAEyFPbLRwJTm22MmxriXGYLRy67wQgw>
    <xmx:ghJgZxuv8fIDhJ5qjZFrRO8xDuF2IEDKicp4GhB6zTQUQw2hyyNI5g>
    <xmx:ghJgZ9FsBOye0p0XPH7Vkm1n85jnP7P4IgQ6AmNWZ4KhDMGgofF0wg>
    <xmx:ghJgZ4Os73giIG3V6hmq7gg5M_Fa0N-eYpEWsu-4nc4BkQYK-vo5uA>
    <xmx:gxJgZyk-Xpt_h6xWNGJS_Jn-m4N-RGcNyaCmd37Q9VXL19OeOUDEmAOSb4TN>
Feedback-ID: i5753c467:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v1] arm: introduce kconfig options to disable hypercalls
Date: Mon, 16 Dec 2024 13:43:58 +0200
Message-Id: <20241216114358.2845447-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

It can be beneficial for some dom0less systems to further reduce Xen footprint
and disable some hypercalls handling code, which may not to be used & required
in such systems. Each hypercall has a separate option to keep configuration
flexible.

Options to disable hypercalls:
- domctl, sysctl
- hvm
- physdev
- platform

Some of these options are forced to be configurable only when DOM0LESS is
enabled, so that system won't become accidentally un-bootable when any hypercall
is disabled.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
---
changes in v1:
 - incorporated PV_SHIM_EXCLUSIVE check in Kconfig
 - drop excessive ifeq from Makefile & #ifdef from code
 - drop checks for CONFIG_HVM_OP & CONFIG_PLATFORM_HYP being off when !DOM0LESS
 - description updated

RFC patch here: https://lore.kernel.org/xen-devel/20240926095806.67149-1-Sergiy_Kibrik@epam.com/
---
 xen/arch/arm/Makefile        | 10 +++++-----
 xen/common/Kconfig           | 27 +++++++++++++++++++++++++++
 xen/common/Makefile          |  4 ++--
 xen/common/domain.c          |  2 ++
 xen/include/hypercall-defs.c | 14 ++++++++++++--
 xen/include/xen/hypercall.h  | 12 ++++++++++++
 6 files changed, 60 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index e4ad1ce851..b910ce3726 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -18,7 +18,7 @@ obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
 obj-y += domain.o
 obj-y += domain_build.init.o
-obj-y += domctl.o
+obj-$(CONFIG_DOMCTL) += domctl.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += efi/
 obj-y += gic.o
@@ -29,7 +29,7 @@ obj-$(CONFIG_HAS_ITS) += gic-v3-lpi.o
 obj-y += guestcopy.o
 obj-y += guest_atomics.o
 obj-y += guest_walk.o
-obj-y += hvm.o
+obj-$(CONFIG_HVM_OP) += hvm.o
 obj-y += io.o
 obj-$(CONFIG_IOREQ_SERVER) += ioreq.o
 obj-y += irq.o
@@ -40,8 +40,8 @@ obj-y += mm.o
 obj-y += monitor.o
 obj-y += p2m.o
 obj-y += platform.o
-obj-y += platform_hypercall.o
-obj-y += physdev.o
+obj-$(CONFIG_PLATFORM_HYP) += platform_hypercall.o
+obj-$(CONFIG_PHYSDEVOP) += physdev.o
 obj-y += processor.o
 obj-y += psci.o
 obj-y += setup.o
@@ -51,7 +51,7 @@ obj-y += smpboot.o
 obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
 obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
 obj-$(CONFIG_STATIC_SHM) += static-shmem.init.o
-obj-y += sysctl.o
+obj-$(CONFIG_SYSCTL) += sysctl.o
 obj-y += time.o
 obj-y += traps.o
 obj-y += vcpreg.o
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 90268d9249..22b1b10700 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -516,4 +516,31 @@ config TRACEBUFFER
 	  to be collected at run time for debugging or performance analysis.
 	  Memory and execution overhead when not active is minimal.
 
+menu "Supported hypercall interfaces"
+	visible if DOM0LESS_BOOT && EXPERT
+
+config SYSCTL
+	bool "Enable sysctl hypercall"
+	default y
+
+config DOMCTL
+	bool "Enable domctl hypercalls"
+	default y
+
+config HVM_OP
+	bool "Enable HVM hypercalls"
+	depends on HVM
+	default y
+
+config PLATFORM_HYP
+	bool "Enable platform hypercalls"
+	depends on !PV_SHIM_EXCLUSIVE
+	default y
+
+config PHYSDEVOP
+	bool "Enable physdev hypercall"
+	default y
+
+endmenu
+
 endmenu
diff --git a/xen/common/Makefile b/xen/common/Makefile
index b279b09bfb..26de84d122 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -66,9 +66,9 @@ obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo un
 obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o)
 
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
-obj-y += domctl.o
+obj-$(CONFIG_DOMCTL) += domctl.o
 obj-y += monitor.o
-obj-y += sysctl.o
+obj-$(CONFIG_SYSCTL) += sysctl.o
 endif
 
 extra-y := symbols-dummy.o
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 92263a4fbd..77d15a317f 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1053,7 +1053,9 @@ int domain_kill(struct domain *d)
         d->is_dying = DOMDYING_dying;
         rspin_barrier(&d->domain_lock);
         argo_destroy(d);
+#ifdef CONFIG_DOMCTL
         vnuma_destroy(d->vnuma);
+#endif
         domain_set_outstanding_pages(d, 0);
         /* fallthrough */
     case DOMDYING_dying:
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 7720a29ade..16b4c795e4 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -234,7 +234,7 @@ stack_switch                       do:2     do:2     -        -        -
 set_callbacks                      compat   do       -        -        -
 fpu_taskswitch                     do       do       -        -        -
 sched_op_compat                    do       do       -        -        dep
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
+#if defined(CONFIG_PLATFORM_HYP)
 platform_op                        compat   do       compat   do       do
 #endif
 set_debugreg                       do       do       -        -        -
@@ -247,7 +247,9 @@ set_timer_op                       compat   do       compat   do       -
 event_channel_op_compat            do       do       -        -        dep
 xen_version                        do       do       do       do       do
 console_io                         do       do       do       do       do
+#ifdef CONFIG_PHYSDEV
 physdev_op_compat                  compat   do       -        -        dep
+#endif
 #if defined(CONFIG_GRANT_TABLE)
 grant_table_op                     compat   do       hvm      hvm      do
 #elif defined(CONFIG_PV_SHIM)
@@ -269,14 +271,20 @@ callback_op                        compat   do       -        -        -
 xenoprof_op                        compat   do       -        -        -
 #endif
 event_channel_op                   do       do       do:1     do:1     do:1
+#ifdef CONFIG_PHYSDEVOP
 physdev_op                         compat   do       hvm      hvm      do_arm
-#ifdef CONFIG_HVM
+#endif
+#ifdef CONFIG_HVM_OP
 hvm_op                             do       do       do       do       do
 #endif
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
+#ifdef CONFIG_SYSCTL
 sysctl                             do       do       do       do       do
+#endif
+#ifdef CONFIG_DOMCTL
 domctl                             do       do       do       do       do
 #endif
+#endif
 #ifdef CONFIG_KEXEC
 kexec_op                           compat   do       -        -        -
 #endif
@@ -293,7 +301,9 @@ hypfs_op                           do       do       do       do       do
 #endif
 mca                                do       do       -        -        -
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
+#ifdef CONFIG_DOMCTL
 paging_domctl_cont                 do       do       do       do       -
 #endif
+#endif
 
 #endif /* !CPPCHECK */
diff --git a/xen/include/xen/hypercall.h b/xen/include/xen/hypercall.h
index f307dfb597..e47c6ddfd2 100644
--- a/xen/include/xen/hypercall.h
+++ b/xen/include/xen/hypercall.h
@@ -24,6 +24,18 @@
 /* Needs to be after asm/hypercall.h. */
 #include <xen/hypercall-defs.h>
 
+#if !defined(CONFIG_DOMCTL) && !defined(CONFIG_DOM0LESS_BOOT)
+#error "domctl and dom0less can't be disabled simultaneously"
+#endif
+
+#if !defined(CONFIG_PHYSDEVOP) && !defined(CONFIG_DOM0LESS_BOOT)
+#error "physdevop and dom0less can't be disabled simultaneously"
+#endif
+
+#if !defined(CONFIG_SYSCTL) && !defined(CONFIG_DOM0LESS_BOOT)
+#error "sysctl and dom0less can't be disabled simultaneously"
+#endif
+
 extern long
 arch_do_domctl(
     struct xen_domctl *domctl, struct domain *d,
-- 
2.25.1


