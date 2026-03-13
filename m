Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id luJjEc48tGlAjgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:35:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D90272871A1
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:35:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253907.1549858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Tf-0006Hz-Je; Fri, 13 Mar 2026 16:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253907.1549858; Fri, 13 Mar 2026 16:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Tf-0006Ey-H2; Fri, 13 Mar 2026 16:35:07 +0000
Received: by outflank-mailman (input) for mailman id 1253907;
 Fri, 13 Mar 2026 16:35:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6RdW=BN=bounce.vates.tech=bounce-md_30504962.69b43cb6.v1-3400e0b633134c63b4737acb401da8d3@srs-se1.protection.inumbo.net>)
 id 1w15Te-0006Ek-1y
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:35:06 +0000
Received: from mail179-36.suw41.mandrillapp.com
 (mail179-36.suw41.mandrillapp.com [198.2.179.36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 959554c3-1efa-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 17:35:03 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-36.suw41.mandrillapp.com (Mailchimp) with ESMTP id 4fXVT20tXpzlfcYX
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 16:35:02 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 3400e0b633134c63b4737acb401da8d3; Fri, 13 Mar 2026 16:35:02 +0000
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
X-Inumbo-ID: 959554c3-1efa-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773419702; x=1773689702;
	bh=ZFode1C11grIE/JKanD6R+1CjHsHBuSPqCWIftB9HSk=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=fFmc8jZsv3oHWELzoOSyw3b6GGkZrB0/Dvc6ayoQWpuVXfi+25ZMr+keBZsclO34/
	 1Tnw57+Qq+WzZilPFVEw8phSCQ/Ao8hlmal3vIjYcYl0IdNEi9EidRiFQl7LGR7IXQ
	 MQsHvlv5KoER3jJllVtqgEubuC5pUTxRf/qZjvdGSv+kxSGokcFj/oX/GRYBfPPZ+J
	 Nbi8Kn3aYorsL//OVvLG9ZIvzxJjr4h8z30Zk4mW4ZaVHGbEeu+KZYFpXRLFf8rEmg
	 Ox3JalRM5fCABhVYDdEzwT5dnVhYhzYlJteOLguAMtdiCuzH6r0ZDSGwBmWDuZHNIE
	 U/MJRq952W7Uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773419702; x=1773680202; i=thierry.escande@vates.tech;
	bh=ZFode1C11grIE/JKanD6R+1CjHsHBuSPqCWIftB9HSk=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=b4MczgNqHmRiJMLVpSOlr2OCMAYtVQVZWqBlTzi8rKRpQbwzm4zBAh3qFqJEDI/q8
	 DpG1dVL5ak6/PTIr6dJZP+DWHxanjVHOIPOCfMbdLiqB9prKlH/K6mS6yJwyxDeM7N
	 F3fZ6a27RDd5nJ/AgOnNWlegpRP+iINykW8a60nzv0BVWfEVnZWnWUoJe95FUVpAiN
	 /2zl26GcSnlXV67Eo8ji3Hk0ZeUQbMdl9CQT2aJhnWLYs0hihDSIP01zWNwE6JRqZi
	 9kEcoCTEsQpGZnf0hzZvCdCSzSGewsw3g7qMuZAqeenV8CDes2XjR1A+0C/LI1xre5
	 uYhC0x9/8cNRg==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[PATCH=2002/17]=20libacpi:=20new=20DSDT=20ACPI=20table=20for=20Q35?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773419700964
To: xen-devel@lists.xenproject.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Alexey Gerasimenko" <x1917x@gmail.com>
Message-Id: <20260313163455.790692-3-thierry.escande@vates.tech>
In-Reply-To: <20260313163455.790692-1-thierry.escande@vates.tech>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.3400e0b633134c63b4737acb401da8d3?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260313:md
Date: Fri, 13 Mar 2026 16:35:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:thierry.escande@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vates.tech,suse.com,citrix.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.558];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D90272871A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch adds the DSDT table for Q35 (new tools/libacpi/dsdt_q35.asl
file). It only contains the specific Q35 parts that differ from i440).
At the moment, these are:

- BDF location of LPC Controller
- Minor changes related to FDC detection
- Addition of _OSC method to inform OSPM about PCIe features supported

As we are still using 4 PCI router links and their corresponding
device/register addresses are same (offset 0x60), no need to change PCI
routing descriptions.

Note that '15cpu' ACPI tables are only applicable to qemu-traditional
(which have no support for Q35), so we need to use 'anycpu' version only.

Signed-off-by: Alexey Gerasimenko <x1917x@gmail.com>
Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
 tools/firmware/hvmloader/Makefile |   2 +-
 tools/libacpi/Makefile            |   2 +-
 tools/libacpi/dsdt.asl            |   3 +
 tools/libacpi/dsdt_q35.asl        | 130 ++++++++++++++++++++++++++++++
 4 files changed, 135 insertions(+), 2 deletions(-)
 create mode 100644 tools/libacpi/dsdt_q35.asl

diff --git a/tools/firmware/hvmloader/Makefile b/tools/firmware/hvmloader/Makefile
index bdc33a877f..99f045efaa 100644
--- a/tools/firmware/hvmloader/Makefile
+++ b/tools/firmware/hvmloader/Makefile
@@ -78,7 +78,7 @@ rombios.o: roms.inc
 smbios.o: CFLAGS += -D__SMBIOS_DATE__="\"$(SMBIOS_REL_DATE)\""
 
 ACPI_PATH = ../../libacpi
-DSDT_FILES += dsdt_i440_anycpu_qemu_xen.c
+DSDT_FILES += dsdt_i440_anycpu_qemu_xen.c dsdt_q35_anycpu_qemu_xen.c
 ACPI_OBJS = $(patsubst %.c,%.o,$(DSDT_FILES)) build.o static_tables.o
 $(ACPI_OBJS): CFLAGS += -iquote . -DLIBACPI_STDUTILS=\"$(CURDIR)/util.h\"
 CFLAGS += -I$(ACPI_PATH)
diff --git a/tools/libacpi/Makefile b/tools/libacpi/Makefile
index d3d4bc9543..e6c4a3fd8b 100644
--- a/tools/libacpi/Makefile
+++ b/tools/libacpi/Makefile
@@ -11,7 +11,7 @@ endif
 
 MK_DSDT = $(ACPI_BUILD_DIR)/mk_dsdt
 
-C_SRC-$(CONFIG_X86) = dsdt_anycpu.c dsdt_15cpu.c dsdt_i440_anycpu_qemu_xen.c dsdt_pvh.c
+C_SRC-$(CONFIG_X86) = dsdt_anycpu.c dsdt_15cpu.c dsdt_i440_anycpu_qemu_xen.c dsdt_q35_anycpu_qemu_xen.c dsdt_pvh.c
 C_SRC-$(CONFIG_ARM_64) = dsdt_anycpu_arm.c
 DSDT_FILES ?= $(C_SRC-y)
 C_SRC = $(addprefix $(ACPI_BUILD_DIR)/, $(DSDT_FILES))
diff --git a/tools/libacpi/dsdt.asl b/tools/libacpi/dsdt.asl
index 130826fdcc..dc764881c9 100644
--- a/tools/libacpi/dsdt.asl
+++ b/tools/libacpi/dsdt.asl
@@ -201,6 +201,9 @@
                 #ifdef MACHINE_TYPE_I440
                     Name (_ADR, 0x00010000) /* device 1, fn 0 */
                 #endif
+                #ifdef MACHINE_TYPE_Q35
+                    Name (_ADR, 0x001f0000) /* device 31, fn 0 */
+                #endif
 
                 OperationRegion(PIRQ, PCI_Config, 0x60, 0x4)
                 Scope(\) {
diff --git a/tools/libacpi/dsdt_q35.asl b/tools/libacpi/dsdt_q35.asl
new file mode 100644
index 0000000000..7cefe63506
--- /dev/null
+++ b/tools/libacpi/dsdt_q35.asl
@@ -0,0 +1,130 @@
+/* SPDX-License-Identifier: LGPL-2.1-only */
+/******************************************************************************
+ * DSDT for Xen with Qemu device model (for Q35 machine)
+ */
+
+DefinitionBlock ("DSDT.aml", "DSDT", 2, "Xen", "HVM", 0)
+{
+    #define MACHINE_TYPE_Q35
+
+    #include "dsdt.asl"
+
+    Scope (\_SB.PCI0)
+    {
+       /* _OSC, modified from ASL sample in ACPI spec */
+       Name (SUPP, 0) /* PCI _OSC Support Field value */
+       Name (CTRL, 0) /* PCI _OSC Control Field value */
+       Method (_OSC, 4) {
+           /* Create DWORD-addressable fields from the Capabilities Buffer */
+           CreateDWordField (Arg3, 0, CDW1)
+
+           /* Switch by UUID.
+            * Only PCI Host Bridge Device capabilities UUID used for now
+            */
+           If (LEqual (Arg0, ToUUID ("33DB4D5B-1FF7-401C-9657-7441C03DD766"))) {
+               /* Create DWORD-addressable fields from the Capabilities Buffer */
+               CreateDWordField (Arg3, 4, CDW2)
+               CreateDWordField (Arg3, 8, CDW3)
+
+               /* Save Capabilities DWORD2 & 3 */
+               Store (CDW2, SUPP)
+               Store (CDW3, CTRL)
+
+               /* Validate Revision DWORD */
+               If (LNotEqual (Arg1, One)) {
+                   /* Unknown revision */
+                   /* Support and Control DWORDs will be returned anyway */
+                   Or (CDW1, 0x08, CDW1)
+               }
+
+               /* Control field bits are:
+                * bit 0    PCI Express Native Hot Plug control
+                * bit 1    SHPC Native Hot Plug control
+                * bit 2    PCI Express Native Power Management Events control
+                * bit 3    PCI Express Advanced Error Reporting control
+                * bit 4    PCI Express Capability Structure control
+                */
+
+               /* Always allow native PME, AER (no dependencies)
+                * Never allow SHPC (no SHPC controller in this system)
+                * Do not allow PCIe Capability Structure control for now
+                * Also, ACPI hotplug is used for now instead of PCIe
+                * Native Hot Plug
+                */
+               And (CTRL, 0x0C, CTRL)
+
+               If (LNotEqual (CDW3, CTRL)) {
+                   /* Some of Capabilities bits were masked */
+                   Or (CDW1, 0x10, CDW1)
+               }
+               /* Update DWORD3 in the buffer */
+               Store (CTRL, CDW3)
+           } Else {
+               Or (CDW1, 4, CDW1) /* Unrecognized UUID */
+           }
+           Return (Arg3)
+       }
+       /* end of _OSC */
+    }
+
+    /****************************************************************
+     * LPC ISA bridge
+     ****************************************************************/
+
+    Scope (\_SB.PCI0.ISA)
+    {
+        /*
+         LPC ISA bridge
+
+         PCI Interrupt Routing Register 2 (PIRQE..PIRQH) cannot be
+         used because of existing Xen IRQ limitations (4 PCI links
+         only)
+        */
+
+        /* LPC_I/O: I/O Decode Ranges Register */
+        OperationRegion (LPCD, PCI_Config, 0x80, 0x2)
+        Field (LPCD, AnyAcc, NoLock, Preserve) {
+            COMA,   3,
+                ,   1,
+            COMB,   3,
+
+            Offset(0x01),
+            LPTD,   2,
+                ,   2,
+            FDCD,   2
+        }
+
+        /* LPC_EN: LPC I/F Enables Register */
+        OperationRegion(LPCE, PCI_Config, 0x82, 0x2)
+        Field(LPCE, AnyAcc, NoLock, Preserve) {
+            CAEN,   1,
+            CBEN,   1,
+            LPEN,   1,
+            FDEN,   1
+        }
+
+        Device (FDC0)
+        {
+            Name (_HID, EisaId ("PNP0700"))
+            Method (_STA, 0, NotSerialized)
+            {
+                Store (FDEN, Local0)
+                If (LEqual (Local0, 0)) {
+                    Return (0x00)
+                } Else {
+                    Return (0x0F)
+                }
+           }
+
+           Name (_CRS, ResourceTemplate ()
+           {
+               IO (Decode16, 0x03F2, 0x03F2, 0x00, 0x04)
+               IO (Decode16, 0x03F7, 0x03F7, 0x00, 0x01)
+               IRQNoFlags () {6}
+               DMA (Compatibility, NotBusMaster, Transfer8) {2}
+           })
+        }
+    }
+
+    #include "dsdt_acpi_info.asl"
+}
-- 
2.51.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


