Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6B152145D
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 13:56:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325534.548149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noOTL-0006MQ-LQ; Tue, 10 May 2022 11:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325534.548149; Tue, 10 May 2022 11:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noOTL-0006I4-Fk; Tue, 10 May 2022 11:56:11 +0000
Received: by outflank-mailman (input) for mailman id 325534;
 Tue, 10 May 2022 11:56:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kgyf=VS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1noOTK-0006Eh-D5
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 11:56:10 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c3a9240-d058-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 13:56:07 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id C61EF3200907;
 Tue, 10 May 2022 07:56:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 10 May 2022 07:56:05 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 May 2022 07:56:02 -0400 (EDT)
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
X-Inumbo-ID: 2c3a9240-d058-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1652183764; x=1652270164; bh=56kiObAcqtyPo
	DVU7lVVW82nxC2+/WT3a7Eom84LACA=; b=eCIVkSXedPt6zjeBTwDJGjb+0KGVR
	ZEiVbUe/wf+yWAqvwlPWJWWR4+wAvB8VdfywQHiOWI1CgxqPNplgBFvu8CuaEL4U
	eY850XE6ptqDfRcx77iN6JCMK4BB67jf3BHECjd8dvcddbHHQph3Ca+gK/A8Cw/b
	lWRLQiu4a8DXgu8b2G2U6c/ZeOVcKk4VmizfyTVJLmoPvjF/WzO+GaovBgfg0xmM
	LbKFGrASikTbxRVaFLlu6Mfotjq0yj3BbWN62d3FXFuS1ZAwWqXcOK04RqSJsOXG
	UgyQG8xPYQ2mChHpXR+hB6XAo9/LerPMJyEswohXQYE4kjmVMuIcjjh6A==
X-ME-Sender: <xms:1FJ6YrZ3dkqkIfU4xc1wcHNmOI9vsnA3bbt5i3jCzoudWs34s9q6ZQ>
    <xme:1FJ6YqaYvJt-VHIsGVASWiOsuP79I9cENil1MjzTxavRJlA8DmVOmXK3Ga76JCJlL
    bZv7cITX9M19g>
X-ME-Received: <xmr:1FJ6Yt962mR7NGRypYnl-SRR2q1nD2oF6g4cRnlgeOcTHZDeghrA8ezhtzRQE2d6WFaG7RjCAU4Hwy1J1kL39Lu4TtgEKBmBOoS8e4SfvRMlAqNi0vM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedugdegudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeu
    udehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:1FJ6YhoX4idwYsITp6ucNjwaaWg55oaV-te2qHBvETQM7f-y2HdOug>
    <xmx:1FJ6Ymr2QDAnPGpw2mvsLQRaZVNeCljO4UY4lPrNTHCOzWw2bnTCLQ>
    <xmx:1FJ6YnTDqn9n9PideOT8-o7z8XkB16Wj13dkKtDJrBYnrfACpjompQ>
    <xmx:1FJ6YjD9Ugy7hGJI35RYpsGW1c1mwdodraLd24uQx0Spj1BgkzVTvw>
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/2] ns16550: Add more device IDs for Intel LPSS UART
Date: Tue, 10 May 2022 13:55:46 +0200
Message-Id: <20220510115546.1779279-2-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510115546.1779279-1-marmarek@invisiblethingslab.com>
References: <20220510115546.1779279-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is purely based on the spec:
- Intel 500 Series PCH: 635218-006
- Intel 600 Series PCH: 691222-001, 648364-003

This is tested only on TGL-LP added initially, but according to the
spec, they should behave the same.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v2:
 - new patch, adding more IDs to the patch that went in already
---
 xen/drivers/char/ns16550.c | 80 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 0c6f6ec43de1..b4486a4e8768 100644
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


