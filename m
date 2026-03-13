Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1evdCM48tGk/jgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:35:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A66C28719E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:35:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253910.1549882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Th-0006oI-Jx; Fri, 13 Mar 2026 16:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253910.1549882; Fri, 13 Mar 2026 16:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Th-0006hb-E3; Fri, 13 Mar 2026 16:35:09 +0000
Received: by outflank-mailman (input) for mailman id 1253910;
 Fri, 13 Mar 2026 16:35:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fZ8g=BN=bounce.vates.tech=bounce-md_30504962.69b43cb8.v1-59b3d60feaeb4f9283ad2ed0cc719c6c@srs-se1.protection.inumbo.net>)
 id 1w15Tg-0006Ps-9T
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:35:08 +0000
Received: from mail179-36.suw41.mandrillapp.com
 (mail179-36.suw41.mandrillapp.com [198.2.179.36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97848431-1efa-11f1-b164-2bf370ae4941;
 Fri, 13 Mar 2026 17:35:06 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-36.suw41.mandrillapp.com (Mailchimp) with ESMTP id 4fXVT457MqzlfgFM
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 16:35:04 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 59b3d60feaeb4f9283ad2ed0cc719c6c; Fri, 13 Mar 2026 16:35:04 +0000
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
X-Inumbo-ID: 97848431-1efa-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773419704; x=1773689704;
	bh=oACyCsIVsnwSUu/TjdHiufId4TiklazXrlevhafTKHs=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=LR0cXLuQPXiCs/hQvAs5Ib+He1LVsnXEdISk+MtdSZu3OYmcbf5hyENSkayKq70tR
	 Tc53IbnybhxF1NrcA9rIe0+BXO7RwwJud6ZZBDT6O6OA08VPMBwKVTwCTk8fafdJOq
	 tZfTjn+PJR1Ci9V6VknsKphBZaoIouvo72dNGBsfDFR/N2uqOi6CrWB6dlGTOoxUTN
	 UJqlm4xkLP8pysBnSmLDGqymeiNgqqaslHtpTe2z+t8JDN7kZ2gfaeMJBukTzpIkH6
	 hWk3C41NRczl6jS3kv2vHVB0pDQIpQnzBxIttHUsnn3HxEDQnz2P83f1l/rsed1mJs
	 rYBWiR3IWoCXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773419704; x=1773680204; i=thierry.escande@vates.tech;
	bh=oACyCsIVsnwSUu/TjdHiufId4TiklazXrlevhafTKHs=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=dIoncJw2UWsY2zZT+HwGlQQRrmkkp2NkD5vkRdPk+SXb1CXLMEscVx1w+Jpgj9hyp
	 pSRR7+ERsbXw+CLEUP47xONrCpLVd/xIRv84qJ+hES9CfvkhRnbUT8qIZY1BGLosd3
	 3NmgLPtKc8IBzMrU2ASfjmDKnSsMS2wA1b5+hkk/+bhMIaTQVdjK0RH4aU+UYiHMYY
	 5AgNMWb8uyGL93wUaOw6zUACyeG+xv4NlvHzjQfqAO52yuR5QOQszzBWb55MK/2lbR
	 NPmtm/KayNElsEmAEGyzhkLDfze7Pla8rpxqBpHpm+j8ROdjWQBGjar/euaHPeTb+R
	 HXExTYpA89E4w==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[PATCH=2014/17]=20libacpi:=20build=20ACPI=20MCFG=20table=20if=20requested?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773419704069
To: xen-devel@lists.xenproject.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Alexey Gerasimenko" <x1917x@gmail.com>
Message-Id: <20260313163455.790692-15-thierry.escande@vates.tech>
In-Reply-To: <20260313163455.790692-1-thierry.escande@vates.tech>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.59b3d60feaeb4f9283ad2ed0cc719c6c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260313:md
Date: Fri, 13 Mar 2026 16:35:04 +0000
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url,mandrillapp.com:dkim];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:thierry.escande@vates.tech,m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vates.tech,suse.com,gmail.com];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	NEURAL_HAM(-0.00)[-0.105];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7A66C28719E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This adds construct_mcfg() function to libacpi which allows to build MCFG
table for a given mmconfig_addr/mmconfig_len pair if the ACPI_HAS_MCFG
flag was specified in acpi_config struct.

The maximum bus number is calculated from mmconfig_size using
MCFG_SIZE_TO_NUM_BUSES macro (1MByte of MMIO space per bus).

Signed-off-by: Alexey Gerasimenko <x1917x@gmail.com>
Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
 tools/libacpi/acpi2_0.h | 17 ++++++++++++++++
 tools/libacpi/build.c   | 43 +++++++++++++++++++++++++++++++++++++++++
 tools/libacpi/libacpi.h |  6 ++++++
 3 files changed, 66 insertions(+)

diff --git a/tools/libacpi/acpi2_0.h b/tools/libacpi/acpi2_0.h
index 51623e2a8a..2b16bd636a 100644
--- a/tools/libacpi/acpi2_0.h
+++ b/tools/libacpi/acpi2_0.h
@@ -442,6 +442,21 @@ struct acpi_20_slit {
     uint8_t entry[0];
 };
 
+/*
+ * PCI Express Memory Mapped Configuration Description Table
+ */
+struct acpi_10_mcfg {
+    struct acpi_header header;
+    uint8_t reserved[8];
+    struct {
+        uint64_t base_address;
+        uint16_t pci_segment;
+        uint8_t  start_pci_bus_num;
+        uint8_t  end_pci_bus_num;
+        uint32_t reserved;
+    } entries[1];
+};
+
 /*
  * Table Signatures.
  */
@@ -457,6 +472,7 @@ struct acpi_20_slit {
 #define ACPI_2_0_WAET_SIGNATURE ASCII32('W','A','E','T')
 #define ACPI_2_0_SRAT_SIGNATURE ASCII32('S','R','A','T')
 #define ACPI_2_0_SLIT_SIGNATURE ASCII32('S','L','I','T')
+#define ACPI_MCFG_SIGNATURE     ASCII32('M','C','F','G')
 
 /*
  * Table revision numbers.
@@ -472,6 +488,7 @@ struct acpi_20_slit {
 #define ACPI_1_0_FADT_REVISION 0x01
 #define ACPI_2_0_SRAT_REVISION 0x01
 #define ACPI_2_0_SLIT_REVISION 0x01
+#define ACPI_1_0_MCFG_REVISION 0x01
 
 #pragma pack ()
 
diff --git a/tools/libacpi/build.c b/tools/libacpi/build.c
index 95188e217e..90080c76c4 100644
--- a/tools/libacpi/build.c
+++ b/tools/libacpi/build.c
@@ -295,6 +295,37 @@ static struct acpi_20_slit *construct_slit(struct acpi_ctxt *ctxt,
     return slit;
 }
 
+static struct acpi_10_mcfg *construct_mcfg(struct acpi_ctxt *ctxt,
+                                        const struct acpi_config *config)
+{
+    struct acpi_10_mcfg *mcfg;
+
+    /* Warning: this code expects that we have only one PCI segment */
+    mcfg = ctxt->mem_ops.alloc(ctxt, sizeof(*mcfg), 16);
+    if ( !mcfg )
+        return NULL;
+
+    memset(mcfg, 0, sizeof(*mcfg));
+    mcfg->header.signature        = ACPI_MCFG_SIGNATURE;
+    mcfg->header.revision         = ACPI_1_0_MCFG_REVISION;
+    mcfg->header.creator_id       = ACPI_CREATOR_ID;
+    mcfg->header.creator_revision = ACPI_CREATOR_REVISION;
+    mcfg->header.length           = sizeof(*mcfg);
+    mcfg->header.oem_revision     = ACPI_OEM_REVISION;
+    fixed_strcpy(mcfg->header.oem_id, ACPI_OEM_ID);
+    fixed_strcpy(mcfg->header.oem_table_id, ACPI_OEM_TABLE_ID);
+
+    mcfg->entries[0].base_address      = config->mmconfig_addr;
+    mcfg->entries[0].pci_segment       = 0;
+    mcfg->entries[0].start_pci_bus_num = 0;
+    mcfg->entries[0].end_pci_bus_num   =
+        MCFG_SIZE_TO_NUM_BUSES(config->mmconfig_size) - 1;
+
+    set_checksum(mcfg, offsetof(struct acpi_header, checksum), sizeof(*mcfg));
+
+    return mcfg;
+}
+
 static int construct_passthrough_tables(struct acpi_ctxt *ctxt,
                                         unsigned long *table_ptrs,
                                         int nr_tables,
@@ -343,6 +374,7 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
     struct acpi_20_waet *waet;
     struct acpi_20_tcpa *tcpa;
     struct acpi_20_tpm2 *tpm2;
+    struct acpi_10_mcfg *mcfg;
     unsigned char *ssdt;
     void *lasa;
 
@@ -402,6 +434,17 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
         memcpy(ssdt, ssdt_laptop_slate, sizeof(ssdt_laptop_slate));
         table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, ssdt);
     }
+
+    /* MCFG */
+    if ( config->table_flags & ACPI_HAS_MCFG )
+    {
+        mcfg = construct_mcfg(ctxt, config);
+        if ( !mcfg )
+            return -1;
+
+        table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, mcfg);
+    }
+
     /* TPM and its SSDT. */
     if ( config->table_flags & ACPI_HAS_TPM )
     {
diff --git a/tools/libacpi/libacpi.h b/tools/libacpi/libacpi.h
index deda39e5db..b2abda90b1 100644
--- a/tools/libacpi/libacpi.h
+++ b/tools/libacpi/libacpi.h
@@ -27,6 +27,9 @@
 #define ACPI_HAS_8042              (1<<13)
 #define ACPI_HAS_CMOS_RTC          (1<<14)
 #define ACPI_HAS_SSDT_LAPTOP_SLATE (1<<15)
+#define ACPI_HAS_MCFG              (1<<16)
+
+#define MCFG_SIZE_TO_NUM_BUSES(size)  ((size) >> 20)
 
 struct xen_vmemrange;
 struct acpi_numa {
@@ -89,6 +92,9 @@ struct acpi_config {
     uint32_t ioapic_base_address;
     uint16_t pci_isa_irq_mask;
     uint8_t ioapic_id;
+
+    uint64_t mmconfig_addr;
+    uint32_t mmconfig_size;
 };
 
 int acpi_build_tables(struct acpi_ctxt *ctxt, struct acpi_config *config);
-- 
2.51.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


