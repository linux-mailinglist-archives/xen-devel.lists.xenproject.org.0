Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD439D9F96
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 00:23:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844074.1259733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG4tx-0003my-7C; Tue, 26 Nov 2024 23:23:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844074.1259733; Tue, 26 Nov 2024 23:23:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG4tw-0003P1-H8; Tue, 26 Nov 2024 23:23:24 +0000
Received: by outflank-mailman (input) for mailman id 844074;
 Tue, 26 Nov 2024 23:22:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rasV=SV=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tG4sj-0000Ao-MS
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 23:22:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f7c2e3a-ac4d-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 00:22:05 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BF25A5C5DA0;
 Tue, 26 Nov 2024 23:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE3DBC4CED7;
 Tue, 26 Nov 2024 23:21:57 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id E276FD66B94;
 Tue, 26 Nov 2024 23:21:57 +0000 (UTC)
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
X-Inumbo-ID: 3f7c2e3a-ac4d-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDQ6MTM4MDo0NjQxOmM1MDA6OjEiLCJoZWxvIjoiZGZ3LnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6IjNmN2MyZTNhLWFjNGQtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjYzMzI2LjEzODY4OCwic2VuZGVyIjoiZGV2bnVsbCtkbXVraGluLmZvcmQuY29tQGtlcm5lbC5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732663318;
	bh=YfYCHh0nVVhyUMXcW2poOpCSgAUn/qfDmEJPr0RM4oY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YTyhPPJYnhy04bo8F7f8koIfZXZgjBfIB05ZmxEwq9aFZ7xlvRaphAT9vt3DANNzx
	 ZQYH1TIFSRdNWl1Nb6i8Iie7rF7zqHQnWnCecWY/crT26czdMnE4zcWsl74guEwAcc
	 ZxVqp0v3u8x38Jt3QCfYCEDjL8gp5rqYK39ujPilLoK42nz9zpvgeA1g1Q6vFJy0mD
	 oUCQCL3czhCJNZBX+CQJs0U5du34E7pDX8CBkXo+/UR76HCQ603mi8YuYS/tZ+6pB0
	 j7lGnUyR49OEM1jSik6LQZpLPhi4vESjyNpZlPjeoWP4OCz1LsnjuHfe+WvfSX7Oeo
	 lu9/mbfi+bjyA==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Tue, 26 Nov 2024 15:22:24 -0800
Subject: [PATCH 34/36] x86/domain: implement domain_has_vuart()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-vuart-ns8250-v1-v1-34-87b9a8375b7a@ford.com>
References: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
In-Reply-To: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
To: Jan Beulich <jbeulich@suse.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
 Bertrand Marquis <bertrand.marquis@arm.com>, 
 Michal Orzel <michal.orzel@amd.com>, Rahul Singh <rahul.singh@arm.com>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bob Eshleman <bobbyeshleman@gmail.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Shawn Anastasio <sanastasio@raptorengineering.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, 
 Christian Lindig <christian.lindig@citrix.com>, 
 David Scott <dave@recoil.org>, 
 =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732663312; l=7401;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=tfiJLSOur1vSXiemSyjr8enIFIEF26fIRGrdEEwbY18=;
 b=/N/5CYqKcD6seLR4F2jKfzySETrT8B+vZVURCXKxLPT1koQC+NDS1ls5JLia0xD7s5pm/MeaL
 subrLZMun+cCOrcoQyaLAF7u6vvZSXh4d8Ja0x+Pt9dNifh/cn4ke3C
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Add new emulation flag for virtual UART on x86 and plumb it through the stack.

This change enables NS8250 emulator initialization.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 tools/libs/light/libxl_x86.c      |  6 +++++-
 tools/ocaml/libs/xc/xenctrl.ml    |  1 +
 tools/ocaml/libs/xc/xenctrl.mli   |  1 +
 tools/python/xen/lowlevel/xc/xc.c |  4 +---
 xen/arch/x86/domain.c             |  8 +++++---
 xen/arch/x86/include/asm/domain.h |  7 ++++---
 xen/include/public/arch-x86/xen.h | 14 +++++++++++++-
 7 files changed, 30 insertions(+), 11 deletions(-)

diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index a3164a3077fec7e1b81a34074894dc646954a49a..de5f05e18cb0671bb031b101b9a7159eb0fe0178 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -8,7 +8,11 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
 {
     switch(d_config->c_info.type) {
     case LIBXL_DOMAIN_TYPE_HVM:
-        config->arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
+        config->arch.emulation_flags = XEN_X86_EMU_ALL;
+        config->arch.emulation_flags &= ~XEN_X86_EMU_VPCI;
+        /* Virtual UART is selected at Xen build time */
+        config->arch.emulation_flags &= ~XEN_X86_EMU_VUART;
+
         if (!libxl_defbool_val(d_config->b_info.u.hvm.pirq))
             config->arch.emulation_flags &= ~XEN_X86_EMU_USE_PIRQ;
         break;
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 2690f9a92316b812ad3d3ff0e1c36823070adb4a..647239b3e55e88b00eb8e9773a5267894cbbae54 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -47,6 +47,7 @@ type x86_arch_emulation_flags =
   | X86_EMU_PIT
   | X86_EMU_USE_PIRQ
   | X86_EMU_VPCI
+  | X86_EMU_VUART
 
 type x86_arch_misc_flags =
   | X86_MSR_RELAXED
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index febbe1f6ae3f10c5abe45eaa3c06a8a67d9ba268..4f5f64c786e83e8a0c3dd3cdb0460f7095de4a62 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -41,6 +41,7 @@ type x86_arch_emulation_flags =
   | X86_EMU_PIT
   | X86_EMU_USE_PIRQ
   | X86_EMU_VPCI
+  | X86_EMU_VUART
 
 type x86_arch_misc_flags =
   | X86_MSR_RELAXED
diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc/xc.c
index 9feb12ae2b16e48cb5d0c3c45044ae226f152f2d..e54308956efc7061d58d2166ec9a95bc1dcd1781 100644
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -159,9 +159,7 @@ static PyObject *pyxc_domain_create(XcObject *self,
 
 #if defined (__i386) || defined(__x86_64__)
     if ( config.flags & XEN_DOMCTL_CDF_hvm )
-        config.arch.emulation_flags = XEN_X86_EMU_ALL &
-                                      ~(XEN_X86_EMU_VPCI |
-                                        XEN_X86_EMU_USE_PIRQ);
+        config.arch.emulation_flags = XEN_X86_EMU_HVM_ALLOWABLE;
 #elif defined (__arm__) || defined(__aarch64__)
     config.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
 #else
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index c88d422a64544531c1e1058fa484364bb4277d1e..439da7adc92a3a8eb481075bf834da5f9670dd54 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -752,10 +752,10 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
         if ( is_hardware_domain(d) &&
              emflags != (X86_EMU_VPCI | X86_EMU_LAPIC | X86_EMU_IOAPIC) )
             return false;
+
+        emflags &= ~X86_EMU_VUART;
         if ( !is_hardware_domain(d) &&
-             /* HVM PIRQ feature is user-selectable. */
-             (emflags & ~X86_EMU_USE_PIRQ) !=
-             (X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ)) &&
+             xen_emflags_allowable(emflags) != XEN_X86_EMU_HVM_ALLOWABLE &&
              emflags != X86_EMU_LAPIC )
             return false;
     }
@@ -806,6 +806,8 @@ int arch_domain_create(struct domain *d,
 
     emflags = config->arch.emulation_flags;
 
+    if ( IS_ENABLED(CONFIG_HAS_VUART_NS8250) && is_hvm_domain(d) )
+        emflags |= XEN_X86_EMU_VUART;
     if ( is_hardware_domain(d) && is_pv_domain(d) )
         emflags |= XEN_X86_EMU_PIT;
 
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index c1d0d1f47324e8cc678a4c76c43f86820a89e7b3..dacea6e1aad46e9f8710b2202bb81203c5e92807 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -484,7 +484,8 @@ struct arch_domain
 #define X86_EMU_VPCI     0
 #endif
 
-#define X86_EMU_PIT     XEN_X86_EMU_PIT
+#define X86_EMU_PIT      XEN_X86_EMU_PIT
+#define X86_EMU_VUART    XEN_X86_EMU_VUART
 
 /* This must match XEN_X86_EMU_ALL in xen.h */
 #define X86_EMU_ALL             (X86_EMU_LAPIC | X86_EMU_HPET |         \
@@ -492,7 +493,7 @@ struct arch_domain
                                  X86_EMU_IOAPIC | X86_EMU_PIC |         \
                                  X86_EMU_VGA | X86_EMU_IOMMU |          \
                                  X86_EMU_PIT | X86_EMU_USE_PIRQ |       \
-                                 X86_EMU_VPCI)
+                                 X86_EMU_VPCI | X86_EMU_VUART)
 
 #define has_vlapic(d)      (!!((d)->arch.emulation_flags & X86_EMU_LAPIC))
 #define has_vhpet(d)       (!!((d)->arch.emulation_flags & X86_EMU_HPET))
@@ -507,7 +508,7 @@ struct arch_domain
 #define has_vpci(d)        (!!((d)->arch.emulation_flags & X86_EMU_VPCI))
 
 /* NB: same symbol as in Arm port */
-#define domain_has_vuart(d) false
+#define domain_has_vuart(d) (!!((d)->arch.emulation_flags & X86_EMU_VUART))
 
 #define gdt_ldt_pt_idx(v) \
       ((v)->vcpu_id >> (PAGETABLE_ORDER - GDT_LDT_VCPU_SHIFT))
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index fc2487986642a7694578ab9d2f5f16d09761bff8..e7922e3f9ddc1742a464d228807279839df31e52 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -283,13 +283,25 @@ struct xen_arch_domainconfig {
 #define XEN_X86_EMU_USE_PIRQ        (1U<<_XEN_X86_EMU_USE_PIRQ)
 #define _XEN_X86_EMU_VPCI           10
 #define XEN_X86_EMU_VPCI            (1U<<_XEN_X86_EMU_VPCI)
+#define _XEN_X86_EMU_VUART          11
+#define XEN_X86_EMU_VUART           (1U<<_XEN_X86_EMU_VUART)
 
 #define XEN_X86_EMU_ALL             (XEN_X86_EMU_LAPIC | XEN_X86_EMU_HPET |  \
                                      XEN_X86_EMU_PM | XEN_X86_EMU_RTC |      \
                                      XEN_X86_EMU_IOAPIC | XEN_X86_EMU_PIC |  \
                                      XEN_X86_EMU_VGA | XEN_X86_EMU_IOMMU |   \
                                      XEN_X86_EMU_PIT | XEN_X86_EMU_USE_PIRQ |\
-                                     XEN_X86_EMU_VPCI)
+                                     XEN_X86_EMU_VPCI | XEN_X86_EMU_VUART)
+
+/* HVM PIRQ feature is user-selectable (libxl). */
+#define XEN_X86_EMU_HVM_SELECTABLE  (XEN_X86_EMU_VPCI | \
+                                     XEN_X86_EMU_USE_PIRQ | \
+                                     XEN_X86_EMU_VUART)
+
+#define xen_emflags_allowable(x)    ((x) & ~XEN_X86_EMU_HVM_SELECTABLE)
+
+#define XEN_X86_EMU_HVM_ALLOWABLE   xen_emflags_allowable(XEN_X86_EMU_ALL)
+
     uint32_t emulation_flags;
 
 /*

-- 
2.34.1



