Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BHSBNA8tGmDjQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:35:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1962871D6
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:35:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253913.1549911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Tj-0007UB-S9; Fri, 13 Mar 2026 16:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253913.1549911; Fri, 13 Mar 2026 16:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Tj-0007PE-I5; Fri, 13 Mar 2026 16:35:11 +0000
Received: by outflank-mailman (input) for mailman id 1253913;
 Fri, 13 Mar 2026 16:35:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WDTR=BN=bounce.vates.tech=bounce-md_30504962.69b43cb6.v1-be292d3c77f841e39b0ebfacbd36f6a1@srs-se1.protection.inumbo.net>)
 id 1w15Th-0006Ek-N8
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:35:09 +0000
Received: from mail136-12.atl41.mandrillapp.com
 (mail136-12.atl41.mandrillapp.com [198.2.136.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95ec48ac-1efa-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 17:35:03 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-12.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4fXVT26G1Rz5QlqMM
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 16:35:02 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 be292d3c77f841e39b0ebfacbd36f6a1; Fri, 13 Mar 2026 16:35:02 +0000
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
X-Inumbo-ID: 95ec48ac-1efa-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773419702; x=1773689702;
	bh=qbZoeBv8SgU3eWXReXQKgYvL+qyJ7a3Zk9GQ6xJBpd4=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=0WwwoKl5Gg/CHOMM9d7EBMCDk3yE9YP2PwHUU/ZBrkTr2630+XXSVWVUBX7YopKAi
	 7QWFjfczxzdDo+dRgdrGELUxF2+zLVX4e6SR+yvn3QV0Q/4/E95WeM+MKT4hdLrncw
	 Y9hDbSx6Q06xmMPVcPzXsYpX5oHXck2MNScbg7KE2iJKc2+amV/GiuCcWrODLQcv8x
	 rFbs8QC3QuEv+krEK7IWf9VzsEeWbCNao77K1SqEOhCDfqDrkR0ydIhhJdWR8G3G7G
	 +sE4Uugh21fnsC5JbU0zEyB4xDOfC2TYZ5dMBV8Slxn8uAN63mwuz1xsy+Nqqx1tGB
	 sOvO6ESEVnSRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773419702; x=1773680202; i=thierry.escande@vates.tech;
	bh=qbZoeBv8SgU3eWXReXQKgYvL+qyJ7a3Zk9GQ6xJBpd4=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=l9mt3IbMuetvw+obqEF3dVhNccAKFpxQjr7taWJQFUEetrltAOyhs8jY1wheecsmw
	 TsbETwCC+GBgtDNako0VEMJV0DaGIFRgaWf/hd54SjqfBWwwt8DwpU67XMZ9s2iA+A
	 x32KWc7RTkIdrpVIW3mRnSVNkU/cnrfETtA4cGPOXlNF2os0Sn6Gy258SYjYfdzZuN
	 VUBwSkhXM4s4L9MuX25ZYy2eWgXophPT7TFUjwD10sJ3gmh1J65euyzCn8MhwgxnqK
	 Ym5G7rl/UUP9c5AZA0wvXyYPGnaHwXRHnhii5SVv3RaeOQKmHFRiG7MSFBLxFTyTZN
	 p/4gxWcpgI2tg==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[PATCH=2006/17]=20hvmloader:=20Move=20pci=20devices=20setup=20to=20a=20separate=20function?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773419702054
To: xen-devel@lists.xenproject.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>
Message-Id: <20260313163455.790692-7-thierry.escande@vates.tech>
In-Reply-To: <20260313163455.790692-1-thierry.escande@vates.tech>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.be292d3c77f841e39b0ebfacbd36f6a1?=
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:thierry.escande@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.366];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BB1962871D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

For readability and code simplification, this patch moves PCI-device
specific initializations out of the pci_setup() function to a new
function class_specific_pci_device_setup().

Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
 tools/firmware/hvmloader/pci.c      | 117 +++++++++++++++-------------
 tools/firmware/hvmloader/pci_regs.h |   4 +
 2 files changed, 68 insertions(+), 53 deletions(-)

diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/pci.c
index c41c8d946a..a76d051bdf 100644
--- a/tools/firmware/hvmloader/pci.c
+++ b/tools/firmware/hvmloader/pci.c
@@ -84,12 +84,71 @@ static int find_next_rmrr(uint32_t base)
     return next_rmrr;
 }
 
+static void class_specific_pci_device_setup(uint16_t vendor_id,
+                                            uint16_t device_id,
+                                            uint16_t class,
+                                            uint8_t bus,
+                                            uint8_t devfn, uint8_t *vga_devfn)
+{
+    switch ( class )
+    {
+    case PCI_CLASS_DISPLAY_VGA:
+        /* If emulated VGA is found, preserve it as primary VGA. */
+        if ( (vendor_id == 0x1234) && (device_id == 0x1111) )
+        {
+            *vga_devfn = devfn;
+            virtual_vga = VGA_std;
+        }
+        else if ( (vendor_id == 0x1013) && (device_id == 0xb8) )
+        {
+            *vga_devfn = devfn;
+            virtual_vga = VGA_cirrus;
+        }
+        else if ( virtual_vga == VGA_none )
+        {
+            *vga_devfn = devfn;
+            virtual_vga = VGA_pt;
+            if ( vendor_id == 0x8086 )
+            {
+                igd_opregion_pgbase = mem_hole_alloc(IGD_OPREGION_PAGES);
+                /*
+                 * Write the the OpRegion offset to give the opregion
+                 * address to the device model. The device model will trap
+                 * and map the OpRegion at the give address.
+                 */
+                pci_writel(*vga_devfn, PCI_INTEL_OPREGION,
+                           igd_opregion_pgbase << PAGE_SHIFT);
+            }
+        }
+        break;
+    case PCI_CLASS_BRIDGE_OTHER:
+        /* PIIX4 ACPI PM. Special device with special PCI config space. */
+        ASSERT((vendor_id == 0x8086) && (device_id == 0x7113));
+        pci_writew(devfn, 0x20, 0x0000); /* No smb bus IO enable */
+        pci_writew(devfn, 0xd2, 0x0000); /* No smb bus IO enable */
+        pci_writew(devfn, 0x22, 0x0000);
+        pci_writew(devfn, 0x3c, 0x0009); /* Hardcoded IRQ9 */
+        pci_writew(devfn, 0x3d, 0x0001);
+        pci_writel(devfn, 0x40, ACPI_PM1A_EVT_BLK_ADDRESS_V1 | 1);
+        pci_writeb(devfn, 0x80, 0x01); /* enable PM io space */
+        break;
+    case PCI_CLASS_STORAGE_IDE:
+        if ( vendor_id == 0x8086 )
+        {
+            /* Intel ICHs since PIIX3: enable IDE legacy mode. */
+            pci_writew(devfn, 0x40, 0x8000); /* enable IDE0 */
+            pci_writew(devfn, 0x42, 0x8000); /* enable IDE1 */
+        }
+        break;
+    }
+}
+
 void pci_setup(void)
 {
     uint8_t is_64bar, using_64bar, bar64_relocate = 0;
     uint32_t devfn, bar_reg, cmd, bar_data, bar_data_upper;
     uint64_t base, bar_sz, bar_sz_upper, mmio_total = 0;
-    uint32_t vga_devfn = 256;
+    uint8_t vga_devfn = 0xff;
     uint16_t class, vendor_id, device_id;
     unsigned int bar, pin, link, isa_irq;
     uint8_t pci_devfn_decode_type[256] = {};
@@ -170,57 +229,9 @@ void pci_setup(void)
         ASSERT((devfn != PCI_ISA_DEVFN) ||
                ((vendor_id == 0x8086) && (device_id == 0x7000)));
 
-        switch ( class )
-        {
-        case 0x0300:
-            /* If emulated VGA is found, preserve it as primary VGA. */
-            if ( (vendor_id == 0x1234) && (device_id == 0x1111) )
-            {
-                vga_devfn = devfn;
-                virtual_vga = VGA_std;
-            }
-            else if ( (vendor_id == 0x1013) && (device_id == 0xb8) )
-            {
-                vga_devfn = devfn;
-                virtual_vga = VGA_cirrus;
-            }
-            else if ( virtual_vga == VGA_none )
-            {
-                vga_devfn = devfn;
-                virtual_vga = VGA_pt;
-                if ( vendor_id == 0x8086 )
-                {
-                    igd_opregion_pgbase = mem_hole_alloc(IGD_OPREGION_PAGES);
-                    /*
-                     * Write the the OpRegion offset to give the opregion
-                     * address to the device model. The device model will trap 
-                     * and map the OpRegion at the give address.
-                     */
-                    pci_writel(vga_devfn, PCI_INTEL_OPREGION,
-                               igd_opregion_pgbase << PAGE_SHIFT);
-                }
-            }
-            break;
-        case 0x0680:
-            /* PIIX4 ACPI PM. Special device with special PCI config space. */
-            ASSERT((vendor_id == 0x8086) && (device_id == 0x7113));
-            pci_writew(devfn, 0x20, 0x0000); /* No smb bus IO enable */
-            pci_writew(devfn, 0xd2, 0x0000); /* No smb bus IO enable */
-            pci_writew(devfn, 0x22, 0x0000);
-            pci_writew(devfn, 0x3c, 0x0009); /* Hardcoded IRQ9 */
-            pci_writew(devfn, 0x3d, 0x0001);
-            pci_writel(devfn, 0x40, ACPI_PM1A_EVT_BLK_ADDRESS_V1 | 1);
-            pci_writeb(devfn, 0x80, 0x01); /* enable PM io space */
-            break;
-        case 0x0101:
-            if ( vendor_id == 0x8086 )
-            {
-                /* Intel ICHs since PIIX3: enable IDE legacy mode. */
-                pci_writew(devfn, 0x40, 0x8000); /* enable IDE0 */
-                pci_writew(devfn, 0x42, 0x8000); /* enable IDE1 */
-            }
-            break;
-        }
+        class_specific_pci_device_setup(vendor_id, device_id, class,
+                                        0 /* virt_bus support TBD */,
+                                        devfn, &vga_devfn);
 
         /*
          * It is recommended that BAR programming be done whilst decode
@@ -583,7 +594,7 @@ void pci_setup(void)
                           ((pci_hi_mem_start & -pci_hi_mem_start) - 1)) + 1;
     }
 
-    if ( vga_devfn != 256 )
+    if ( vga_devfn != 0xff )
     {
         /*
          * VGA registers live in I/O space so ensure that primary VGA
diff --git a/tools/firmware/hvmloader/pci_regs.h b/tools/firmware/hvmloader/pci_regs.h
index 4d4dc0cd01..c94278855b 100644
--- a/tools/firmware/hvmloader/pci_regs.h
+++ b/tools/firmware/hvmloader/pci_regs.h
@@ -111,6 +111,10 @@
 #define PCI_DEVICE_ID_INTEL_82441        0x1237
 #define PCI_DEVICE_ID_INTEL_Q35_MCH      0x29c0
 
+#define PCI_CLASS_STORAGE_IDE            0x0101
+#define PCI_CLASS_DISPLAY_VGA            0x0300
+#define PCI_CLASS_BRIDGE_OTHER           0x0680
+
 #endif /* __HVMLOADER_PCI_REGS_H__ */
 
 /*
-- 
2.51.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


