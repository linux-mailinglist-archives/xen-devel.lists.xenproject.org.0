Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 303EB9F4A48
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 12:48:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858875.1271102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNW30-0004EC-7y; Tue, 17 Dec 2024 11:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858875.1271102; Tue, 17 Dec 2024 11:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNW30-0004Bn-4m; Tue, 17 Dec 2024 11:47:30 +0000
Received: by outflank-mailman (input) for mailman id 858875;
 Tue, 17 Dec 2024 11:47:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pxTC=TK=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1tNW2y-0004Bh-Lh
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 11:47:28 +0000
Received: from fforwardh-a1-smtp.messagingengine.com
 (fforwardh-a1-smtp.messagingengine.com [103.168.172.196])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aede9349-bc6c-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 12:47:25 +0100 (CET)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfforwardh.phl.internal (Postfix) with ESMTP id 42621292030F;
 Tue, 17 Dec 2024 06:47:24 -0500 (EST)
Received: from phl-frontend-02 ([10.202.2.161])
 by phl-compute-04.internal (MEProxy); Tue, 17 Dec 2024 06:47:24 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Dec 2024 06:47:22 -0500 (EST)
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
X-Inumbo-ID: aede9349-bc6c-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1734436044; x=1734522444; bh=PYMG5GFNcXN7JJ/1QU0o6xfmGVmIMv5xTQd
	rMgfmzB0=; b=emYUW2IZ8kwvUpjmejwPbcpeoq7a8APJMm5BEMnxQcMBC02dVni
	wbn0nHTwngrjs5ftQW3vabRfRHG5x1hhdQ4KMsRPt7AXKhvUJqJGu6cqpMbH+Sb4
	FIQLkcYOJYbZGZbXr+ErscjuEDhQC33v09PueIwjLvy/zOCTDVMmrV8l+twDT3cj
	gxSSimgaf2k/Q8jJxSlXoxbk2s5oWuvIn9EnWjeVQ5af8s0qhOw4N9y1PsgXSyCe
	xjBypIx8Y91kaBH+WXxUO0foQU3BqFgzW8HEJxRWTBAVpBnQhbKA0S/Wkgx+T4aH
	nMv/PYTF2CpeI/J2m0DWvcffnS0umaoXWEA==
X-ME-Sender: <xms:y2RhZ89Bh3FmA1KZ-ZDc6937KD_DV3Mv63-yDAEbi4b7iBcK9AAy4w>
    <xme:y2RhZ0sbgVDNe36_NM6sSHzJwS_1egLLxw11UCOQzqLPUOXFRYdrhtVTt7k9T48O-
    LmJFrFI5o4BbIaC-mo>
X-ME-Received: <xmr:y2RhZyBZAnDVcVRpGU5tfrF3C20SedAnbVPatbMWzLVIIUpuKxh3ZdQq-rivPtOrSxYsDt1lbhdsfZ3mLcRhmXfIjC9CnFcp4h6R7Uc1Ce3kM5LS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrleehgdeffecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhr
    ohhmpefuvghrghhihicumfhisghrihhkuceoufgvrhhgihihpgfmihgsrhhikhesvghprg
    hmrdgtohhmqeenucggtffrrghtthgvrhhnpeffffdvieefieejhfehfeeuvdevtdehffej
    ieevhefgteetvdegudejgfdujeegvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehsrghkihgssegurghrkhhsthgrrhdrshhithgvpdhnsggp
    rhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdqug
    gvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepshgv
    rhhgihihpghkihgsrhhikhesvghprghmrdgtohhmpdhrtghpthhtoheprghnughrvgifrd
    gtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopegrnhhthhhonhihrdhp
    vghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepmhhitghhrghlrdhorhiivg
    hlsegrmhgurdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdp
    rhgtphhtthhopehjuhhlihgvnhesgigvnhdrohhrghdprhgtphhtthhopehrohhgvghrrd
    hprghusegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehk
    vghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:y2RhZ8cedvsQSc1JRRUJzhrH5HPCZH4iJHJllaTEfyLRXvVCrhkYgw>
    <xmx:y2RhZxOpqV4b8fiSiiU1ChKWlbLdSpTDJB_ZDj4PULubFPnEoF1ZMg>
    <xmx:y2RhZ2mrjpTxub1GOr6F689ibrBpIUyOzuXsfMpL2mZlXcfAftgbGA>
    <xmx:y2RhZzvjKPRdhtFPUEVO7VSd30yeTj6ZbAKz_GUsG_FmRYtD15qHeA>
    <xmx:zGRhZ6jJeQ_UvDEpBGoL4jX1vQwFt4mTVx1HAHYaIymgdAHekcNrQMVOx-vK>
Feedback-ID: i57af8f6a:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [RFC PATCH] xen/kconfig: allow LATE_HWDOM config for ARM
Date: Tue, 17 Dec 2024 13:47:19 +0200
Message-Id: <20241217114719.2870676-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow to build ARM configuration with support for initializing hardware domain.
On ARM it is only possible to start hardware domain in multiboot mode, so
dom0less support is required. This is reflected by dependency on DOM0LESS_BOOT
instead of directly depending on ARM config option.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/common/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 90268d9249..7368ca8208 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -374,7 +374,7 @@ endchoice
 config LATE_HWDOM
 	bool "Dedicated hardware domain"
 	default n
-	depends on XSM && X86
+	depends on XSM && (X86 || DOM0LESS_BOOT)
 	help
 	  Allows the creation of a dedicated hardware domain distinct from
 	  domain 0 that manages devices without needing access to other
-- 
2.25.1


