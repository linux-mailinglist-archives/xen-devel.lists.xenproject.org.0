Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE595234E1
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 16:00:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326900.549576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nomsZ-0006A0-B6; Wed, 11 May 2022 13:59:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326900.549576; Wed, 11 May 2022 13:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nomsZ-00067g-74; Wed, 11 May 2022 13:59:51 +0000
Received: by outflank-mailman (input) for mailman id 326900;
 Wed, 11 May 2022 13:59:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+7Fu=VT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nomsY-0005rd-5d
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 13:59:50 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9eb26f5a-d132-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 15:59:49 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 1CD493200991;
 Wed, 11 May 2022 09:59:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 11 May 2022 09:59:47 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 09:59:45 -0400 (EDT)
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
X-Inumbo-ID: 9eb26f5a-d132-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1652277586; x=1652363986; bh=ZfxY+2eFR6OWb
	CCmCrA2H42ZM6QzR3zM4jhjtkm55Xc=; b=VJt1w9ZEu8UjoaKMPZwBHLG2ZBWsN
	rwSqktAkpWGW6Yi2julBbixasy70wX7MumWorCbdr6dlfXjkivEKE4xjCTFDQy7O
	bS2ppXmrS/zTz46qP6h7v0vyCqJEG1ViG/0k5GVOYfVxXEbnIWvFqXHUX8UYPggJ
	X38TqwmT6zwxLbeM1MRguczTr/vJte4ka+C/BmvaB7ZerHfilGIB89I31o6j+ckh
	7ZZVoK4sT0VCQMRucEa3jK4MMxgfKCXBWB2iQzADxQhCdMYqFPedz901bK1sZN1f
	0sDtYi7Q+7Hf6HZE0lPA3jYmUWO04F4stXCv0yZvXlZL12XVXELkdR46g==
X-ME-Sender: <xms:UsF7YrsSiRYgSa3hqtTByyMPvSdg5OH7PZgMkTv7r44wIcZIALlPAQ>
    <xme:UsF7YscXi3XPytRAEJLubraILtZLtOyJii4akEDPND-GdEGyQpZpX-xKYCR7wDfrR
    JeAP-3gJ9bVFg>
X-ME-Received: <xmr:UsF7YuxBanhyhEQ2m3RSKRcBfLUxOHoes3Z0UKMMc9gwibbH-gZRMY47jm3P-iGxJKoaJep2w3ptjyHe08oBrHvS4FpnIYUBHw5DOgRD7dHPLs77qRM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdeikecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeu
    udehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:UsF7YqOF627Kgyj9YLhFM1razbCgwYSFbcFVSgroMWFlyFCL1N-VSg>
    <xmx:UsF7Yr8c4JyQRkTcuF4k31kEtLuD9Gok0gGu17wr4fb92ftNsRyEcg>
    <xmx:UsF7YqVzOshB13sK8I-99My0mJZQBdQS9SqjgtEj8MYmOLGOx79Idw>
    <xmx:UsF7Yml16HRckddstGUBPKMY3Yc685saJmoiQihJof1mkJQaF1skSA>
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 2/2] ns16550: Add more device IDs for Intel LPSS UART
Date: Wed, 11 May 2022 15:59:29 +0200
Message-Id: <20220511135929.1823116-2-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220511135929.1823116-1-marmarek@invisiblethingslab.com>
References: <20220511135929.1823116-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is purely based on the spec:
- Intel 500 Series PCH: 635218-006
- Intel 600 Series PCH: 691222-001, 648364-003

This is tested only on TGL-LP added initially, but according to the
spec, they should behave the same.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes in v2:
 - new patch, adding more IDs to the patch that went in already
---
 xen/drivers/char/ns16550.c | 80 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index c0d65cff62fe..66b397391e3c 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1077,12 +1077,90 @@ static const struct ns16550_config __initconst uart_config[] =
         .dev_id = 0x0358,
         .param = param_exar_xr17v358
     },
-    /* Intel Corp. TGL-LP LPSS PCI */
+    /* Intel Corp. TGL-LP LPSS PCI UART #0 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0xa0a8,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. TGL-LP LPSS PCI UART #1 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0xa0a9,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. TGL-LP LPSS PCI UART #2 */
     {
         .vendor_id = PCI_VENDOR_ID_INTEL,
         .dev_id = 0xa0c7,
         .param = param_intel_lpss
     },
+    /* Intel Corp. TGL-H LPSS PCI UART #0 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x43a8,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. TGL-H LPSS PCI UART #1 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x43a9,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. TGL-H LPSS PCI UART #2 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x43a7,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. ADL-P LPSS PCI UART #0 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x51a8,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. ADL-P LPSS PCI UART #1 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x51a9,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. ADL-P LPSS PCI UART #2 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x51c7,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. ADL-P LPSS PCI UART #3 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x51da,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. ADL-S LPSS PCI UART #0 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x7aa8,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. ADL-S LPSS PCI UART #1 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x7aa9,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. ADL-S LPSS PCI UART #2 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x7afe,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. ADL-S LPSS PCI UART #3 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x7adc,
+        .param = param_intel_lpss
+    },
 };
 
 static int __init
-- 
2.35.1


