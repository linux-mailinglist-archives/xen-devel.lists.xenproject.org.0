Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0E936AB48
	for <lists+xen-devel@lfdr.de>; Mon, 26 Apr 2021 05:49:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117436.223342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lasEH-0000OT-Jj; Mon, 26 Apr 2021 03:48:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117436.223342; Mon, 26 Apr 2021 03:48:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lasEH-0000OE-DL; Mon, 26 Apr 2021 03:48:13 +0000
Received: by outflank-mailman (input) for mailman id 117436;
 Mon, 26 Apr 2021 03:48:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ltoc=JX=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1lasEF-0000O6-P4
 for xen-devel@lists.xenproject.org; Mon, 26 Apr 2021 03:48:11 +0000
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9095dbae-5d5d-4f96-b99b-98b77f4501ce;
 Mon, 26 Apr 2021 03:48:08 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 9A8B65C0078;
 Sun, 25 Apr 2021 23:48:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 25 Apr 2021 23:48:08 -0400
Received: from localhost.localdomain (ip5b434f04.dynamic.kabel-deutschland.de
 [91.67.79.4])
 by mail.messagingengine.com (Postfix) with ESMTPA id A6E71240057;
 Sun, 25 Apr 2021 23:48:07 -0400 (EDT)
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
X-Inumbo-ID: 9095dbae-5d5d-4f96-b99b-98b77f4501ce
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:message-id:mime-version:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=g3BlWP
	aDuhYbF02cJ6YoeePymT94Qfj0PRakYSq2bxw=; b=PNBptw/QQT8lCwmC0Mn/o0
	xXYNhh9jv65KPbHvD6qTPe+3198OwdipKkpiJhJaFghdoxKL2rXg82/2nARlMIQD
	61z92iBLJlkKE5OC4JPod/cSwFCMLVUPJ2tltu+7VK03Dk95ofXGiJBCK1DPOCHa
	mk+PTlUqfi+Ioyc9432cWeQe/8eHOYVTfclhk1LuJlQtvvxRL7BtQ94tZ1/Cw9dI
	wIuArOMXXsN0MHlbV0fSRLfgACsFL6HI5EV5eKxxilAoWihwKAn+qhLhqyEM8wC2
	3C8Dw2MugKJR+y0F4jhQx68HuqYh/KNe+T1yJ+q5QLmbTi8v33nqQ5YSsprVVK3A
	==
X-ME-Sender: <xms:-DeGYKtwHWCTAFZvSuVHKhdBl4W7TCXpvZ59rEirOvjbPECRlwYDMg>
    <xme:-DeGYPe2XM_IRdHwR-jf9F3QuZ8M47WiYqrzbN3cGhF4txjcq9XPTSpr4FP7KXCbi
    yjZKmPkFOo6Ug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddujedgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofggtghogfesthekre
    dtredtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggt
    khhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    eqnecuggftrfgrthhtvghrnhephefhfeetueelvddvtedttdevieeluedtvedtfeejieel
    hedutdeuheduieejgfegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheple
    durdeijedrjeelrdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
    homh
X-ME-Proxy: <xmx:-DeGYFwp8Gv-mQfG9HsP2DIaCapDgasBkUij_-MKuh2S_A9oDD7gFw>
    <xmx:-DeGYFOwHegGMcKXwH3B9cytPLXUJti4d2zZkKxXkdDOS7Kx4kJTZw>
    <xmx:-DeGYK9p1kNEy35qL_JRyEK8OWzHoiMm5IuRLOyb1t_VkCOmMy7Sxw>
    <xmx:-DeGYLIxDpt0H1Ujid8eyf3LaL3PjbaT95R7DGAEqQUAze_McSEWbA>
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH] i386: load kernel on xen using DMA
Date: Mon, 26 Apr 2021 05:47:10 +0200
Message-Id: <20210426034709.595432-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Invisible Things Lab
Content-Transfer-Encoding: 8bit

Kernel on Xen is loaded via fw_cfg. Previously it used non-DMA version,
which loaded the kernel (and initramfs) byte by byte. Change this
to DMA, to load in bigger chunks.
This change alone reduces load time of a (big) kernel+initramfs from
~10s down to below 1s.

This change was suggested initially here:
https://lore.kernel.org/xen-devel/20180216204031.000052e9@gmail.com/
Apparently this alone is already enough to get massive speedup.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 hw/i386/pc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8a84b25a03..14e43d4da4 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -839,7 +839,8 @@ void xen_load_linux(PCMachineState *pcms)
 
     assert(MACHINE(pcms)->kernel_filename != NULL);
 
-    fw_cfg = fw_cfg_init_io(FW_CFG_IO_BASE);
+    fw_cfg = fw_cfg_init_io_dma(FW_CFG_IO_BASE, FW_CFG_IO_BASE + 4,
+                                &address_space_memory);
     fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, x86ms->boot_cpus);
     rom_set_fw(fw_cfg);
 
-- 
2.26.3


