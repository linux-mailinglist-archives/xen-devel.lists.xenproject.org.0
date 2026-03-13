Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EZzAaM/tGlljgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:47:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB057287617
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:47:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1254170.1550174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15fX-0007ve-VI; Fri, 13 Mar 2026 16:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1254170.1550174; Fri, 13 Mar 2026 16:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15fX-0007t9-NO; Fri, 13 Mar 2026 16:47:23 +0000
Received: by outflank-mailman (input) for mailman id 1254170;
 Fri, 13 Mar 2026 16:47:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4COx=BN=bounce.vates.tech=bounce-md_30504962.69b43f98.v1-bf408e4098ba45c6b365cef3c2c3e264@srs-se1.protection.inumbo.net>)
 id 1w15fW-0006fv-3I
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:47:22 +0000
Received: from mail134-15.atl141.mandrillapp.com
 (mail134-15.atl141.mandrillapp.com [198.2.134.15])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d8262f6-1efc-11f1-b164-2bf370ae4941;
 Fri, 13 Mar 2026 17:47:21 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-15.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4fXVlD2XPwzPm0PqH
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 16:47:20 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 bf408e4098ba45c6b365cef3c2c3e264; Fri, 13 Mar 2026 16:47:20 +0000
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
X-Inumbo-ID: 4d8262f6-1efc-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773420440; x=1773690440;
	bh=BfeVwu07GpLrZnkbH1KHTfsb175OP+VcYPCDwc2bXBA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=VAcI6tTSK5w/V8dPnfOqMa21UdpOI2JaiSrxCu7eQ3wFafekWG+SxYK52H/Zf8rg7
	 CnBLKL1u4vBT73Y9Zjo8O7IOLmwhPQfyBAGPNesgcdAQ0GvnB7AUAHU/rEWx6VwHEz
	 o6kQBZWIlxdHh984pS7XBkknLRGEqLxfaXaCWFHIS/7tCMS506geVhNUTSBJXYSy3X
	 LzbMDHMmczBaHo12e2PU2W9ZsvLq4MuMjjhVvbSajt6I1kcKAc1MiFyT9M5rlWzMav
	 qxy7PWELKEeBlkegmYNDuh+AL9Ri+xpETxFrrO5uDQPux5oeXIGaKhjelyCP+zcm4M
	 aSSPm9ElW77cA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773420440; x=1773680940; i=thierry.escande@vates.tech;
	bh=BfeVwu07GpLrZnkbH1KHTfsb175OP+VcYPCDwc2bXBA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=0C1+M/hNJ/PXKbzmhP1sAXXgIql9jwyvWMNpfI2vxpF9AD/AA962uysI/jC+VQebX
	 FqcPSQxXBxiolMmCKxkr3ND4x06E/zhBZvHsi5VqNokF/7pEKffJpHw4XaPIYAaDWE
	 JRnDIyKTJABlUXIHGt693E8Wa0eJl4vI4vkje7nKCq0W/ktlyLg26NwDT97WkYGFFW
	 /7RtJa+oW30dsQVLERRKtuj+dKeFSGjer2aCwiMliuwvyj6st6++9el9x8C/sKGwOU
	 3JMRjBvvmZxghq174rWYGjRvEI7fQeab9FgTU4z4aneVMcHuJ16Tb/0OvAtiRvJyVi
	 NuHtUhAUnzJFA==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[PATCH=204/4]=20xen:=20Handle=20PCIe=20config=20space=20size=20in=20cpu=5Fioreq=5Fconfig()?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773420439492
To: qemu-devel@nongnu.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Paolo Bonzini" <pbonzini@redhat.com>, "Richard Henderson" <richard.henderson@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, "Eduardo Habkost" <eduardo@habkost.net>, "Anthony PERARD" <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Message-Id: <20260313164649.794591-5-thierry.escande@vates.tech>
In-Reply-To: <20260313164649.794591-1-thierry.escande@vates.tech>
References: <20260313164649.794591-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.bf408e4098ba45c6b365cef3c2c3e264?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260313:md
Date: Fri, 13 Mar 2026 16:47:20 +0000
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:thierry.escande@vates.tech,m:pbonzini@redhat.com,m:richard.henderson@linaro.org,m:mst@redhat.com,m:eduardo@habkost.net,m:anthony@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.351];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CB057287617
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This change allows to read and write to the extended config space of PCI
Express devices by setting the size limit to 4096 bytes. The size limit
remains 256 bytes for non PCIe devices.

Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
 hw/xen/xen-hvm-common.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 62d88804c4..15090d77cf 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -396,6 +396,7 @@ static void cpu_ioreq_config(XenIOState *state, ioreq_t *req)
 {
     uint32_t sbdf = req->addr >> 32;
     uint32_t reg = req->addr;
+    uint32_t limit;
     XenPciDevice *xendev;
 
     if (req->size != sizeof(uint8_t) && req->size != sizeof(uint16_t) &&
@@ -412,10 +413,12 @@ static void cpu_ioreq_config(XenIOState *state, ioreq_t *req)
             continue;
         }
 
+        limit = pci_is_express(xendev->pci_dev) ?
+                    PCIE_CONFIG_SPACE_SIZE : PCI_CONFIG_SPACE_SIZE;
         if (!req->data_is_ptr) {
             if (req->dir == IOREQ_READ) {
                 req->data = pci_host_config_read_common(
-                    xendev->pci_dev, reg, PCI_CONFIG_SPACE_SIZE,
+                    xendev->pci_dev, reg, limit,
                     req->size);
                 trace_cpu_ioreq_config_read(req, xendev->sbdf, reg,
                                             req->size, req->data);
@@ -423,7 +426,7 @@ static void cpu_ioreq_config(XenIOState *state, ioreq_t *req)
                 trace_cpu_ioreq_config_write(req, xendev->sbdf, reg,
                                              req->size, req->data);
                 pci_host_config_write_common(
-                    xendev->pci_dev, reg, PCI_CONFIG_SPACE_SIZE,
+                    xendev->pci_dev, reg, limit,
                     req->data, req->size);
             }
         } else {
@@ -431,7 +434,7 @@ static void cpu_ioreq_config(XenIOState *state, ioreq_t *req)
 
             if (req->dir == IOREQ_READ) {
                 tmp = pci_host_config_read_common(
-                    xendev->pci_dev, reg, PCI_CONFIG_SPACE_SIZE,
+                    xendev->pci_dev, reg, limit,
                     req->size);
                 trace_cpu_ioreq_config_read(req, xendev->sbdf, reg,
                                             req->size, tmp);
@@ -441,7 +444,7 @@ static void cpu_ioreq_config(XenIOState *state, ioreq_t *req)
                 trace_cpu_ioreq_config_write(req, xendev->sbdf, reg,
                                              req->size, tmp);
                 pci_host_config_write_common(
-                    xendev->pci_dev, reg, PCI_CONFIG_SPACE_SIZE,
+                    xendev->pci_dev, reg, limit,
                     tmp, req->size);
             }
         }
-- 
2.51.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


