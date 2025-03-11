Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B99A5BDCF
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 11:25:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907727.1314985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwnc-0006oP-KY; Tue, 11 Mar 2025 10:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907727.1314985; Tue, 11 Mar 2025 10:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwnc-0006l5-Gi; Tue, 11 Mar 2025 10:25:24 +0000
Received: by outflank-mailman (input) for mailman id 907727;
 Tue, 11 Mar 2025 10:25:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RDOX=V6=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1trwna-0004A4-VP
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 10:25:22 +0000
Received: from fforwardh-b1-smtp.messagingengine.com
 (fforwardh-b1-smtp.messagingengine.com [202.12.124.196])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 227941d7-fe63-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 11:25:21 +0100 (CET)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfforwardh.stl.internal (Postfix) with ESMTP id 1C0421740202;
 Tue, 11 Mar 2025 06:25:20 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
 by phl-compute-10.internal (MEProxy); Tue, 11 Mar 2025 06:25:20 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Mar 2025 06:25:18 -0400 (EDT)
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
X-Inumbo-ID: 227941d7-fe63-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1741688719; x=1741775119; bh=8
	gtu3M66RCphGMRnb9LvcGgL3tCIvFU0NSfbGCgNSNk=; b=u8SNWHU6Yy8xgjpQ2
	vewv/lW60El1BSUgR2ilmhjELEPFKAk0JiPe5H5uh1tZkZqST2l5Md5d4m6LMziA
	UvQQo3qb5lQ0A/z0ty13YOlcTMjpoAPCJx00/InKXwIg8mntHdiYp2wxLvOfGso7
	mY0lzDNJpZTpqoYvEWwbKFIWIjyeQXx5cxqhhelzo98aCJ2kOKMt1Kct8V4jDMNJ
	12FsTuVnyV4Fh2K0McslFGjvU0MfiKE//k2pQUcaxkjUazjnihlxhPEZl4pzajZ+
	VsvQSGGiVq358dsYL93Tb3k8vN7ZoPonChqtdG3dJqjL5Vb/Q4aBE8YBUGYchMLJ
	gMuHg==
X-ME-Sender: <xms:jw_QZ29aw5blsO_My26eZs5WVBVtF58Iecw7RJRQTYh1zmyAxdQOTg>
    <xme:jw_QZ2tXt5ytFtARwbHmG236FcliH0zNZnD3DECR2Ju-eAYbft2yGb0G-bAdsKHSm
    iyXEkcG6okb0dekDMA>
X-ME-Received: <xmr:jw_QZ8CynsqazJCuYX_JRWIhsJR1EWuX1BzVX5KH_v4QeUJBo2MdXscf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdduleekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepufgvrhhgihihucfmihgsrhhikhcuoefuvghrghhihigpmfhisghrih
    hksegvphgrmhdrtghomheqnecuggftrfgrthhtvghrnheptdejgeegvdffkeekleefueev
    gfduheevkedvhfdvkeeludehleegheeivedugfejnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepshgrkhhisgesuggrrhhkshhtrghrrdhsihht
    vgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgi
    gvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthht
    ohepshgvrhhgihihpghkihgsrhhikhesvghprghmrdgtohhmpdhrtghpthhtohepjhgsvg
    hulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghr
    feestghithhrihigrdgtohhmpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrih
    igrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:jw_QZ-cHDmgPs7_ghUr6V1SoeQ8ukVwkFEMUHepUSl6T-oIdZ8ZnFQ>
    <xmx:jw_QZ7OrSsAClGmbBo-u2vms-VQiLnCfsX9cSA5uApeggJnJ7oNCKA>
    <xmx:jw_QZ4mJ-PmZhicezSZBPyhtPKkkZJiYqEdxOQgQIF666pO-DDUm9A>
    <xmx:jw_QZ9s2TcXFjxgL2J3pc8v52j1kT7uM1Hja5jFLMQRX_WmkofspRw>
    <xmx:jw_QZxvqveXxrBYq1rfwiAv82Bgf-pjXtxFjvEa9IPRmigv0Ji1f6w>
    <xmx:jw_QZ22kOo20lvr4k47Cyuvt_6MjM1IN55qVel2z1v34jJvukzhFp2mxTQjL>
Feedback-ID: i5fdb7c23:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 2/3] x86:monitor: control monitor.c build with CONFIG_VM_EVENT option
Date: Tue, 11 Mar 2025 12:25:17 +0200
Message-Id: <6acad259a83b09544b2ac7cec0bfc5dd5e434fb0.1741687645.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1741687645.git.Sergiy_Kibrik@epam.com>
References: <cover.1741687645.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace more general CONFIG_HVM option with CONFIG_VM_EVENT which is more
relevant and specific to monitoring. This is only to clarify at build level
to which subsystem this file belongs.

No functional change here, as VM_EVENT depends on HVM.

Acked-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index c763f80b0b..f59c9665fd 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -49,7 +49,7 @@ obj-$(CONFIG_PV) += ioport_emulate.o
 obj-y += irq.o
 obj-$(CONFIG_KEXEC) += machine_kexec.o
 obj-y += mm.o x86_64/mm.o
-obj-$(CONFIG_HVM) += monitor.o
+obj-$(CONFIG_VM_EVENT) += monitor.o
 obj-y += mpparse.o
 obj-y += nmi.o
 obj-y += numa.o
-- 
2.25.1


