Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C883D757BCB
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 14:28:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565157.883063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLjok-0007dj-2x; Tue, 18 Jul 2023 12:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565157.883063; Tue, 18 Jul 2023 12:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLjok-0007bz-0K; Tue, 18 Jul 2023 12:28:38 +0000
Received: by outflank-mailman (input) for mailman id 565157;
 Tue, 18 Jul 2023 12:26:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sJ2J=DE=mediatek.com=yang.xu@srs-se1.protection.inumbo.net>)
 id 1qLjmZ-0006w6-Tc
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 12:26:24 +0000
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a151a28-2566-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 14:26:19 +0200 (CEST)
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <yang.xu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 279153221; Tue, 18 Jul 2023 20:26:09 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 18 Jul 2023 20:26:08 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 18 Jul 2023 20:26:08 +0800
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
X-Inumbo-ID: 4a151a28-2566-11ee-8611-37d641c3527e
X-UUID: 46b03d28256611eeb20a276fd37b9834-20230718
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ulPwwsf65Hc4Ar5APFwltWA1+P9Wk9qu3MwmPW4ZbME=;
	b=LGCmYrk9h//PIFtlaNaLW98fNCMrJLT9ypoNzhN9WwHckJgmZfcF7fHW6CMkkIgvvBYbH1xU3rFCvOQ04tuvQ1I6BnrTzH0oFJBXsJbq4LAOJMDu3olKXow3MynhYD8oXeCaiG2JEDKQvb+zoiRhKbLuMkfY74kL+rTSPE4JzRc=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:832639cd-3b0e-41f2-a4e4-3c6c07a41fa2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:59,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:59
X-CID-INFO: VERSION:1.1.28,REQID:832639cd-3b0e-41f2-a4e4-3c6c07a41fa2,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:59,FILE:0,BULK:0,RULE:Release_HamU,ACTION:
	release,TS:59
X-CID-META: VersionHash:176cd25,CLOUDID:d9f5bbdc-dc79-4898-9235-1134b97257a8,B
	ulkID:230718202612VD7TQ9MQ,BulkQuantity:0,Recheck:0,SF:16|19|48|101|29|28|
	100|102,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:
	nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SDM,TF_CID_SPAM_USA,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR
X-UUID: 46b03d28256611eeb20a276fd37b9834-20230718
From: <yang.xu@mediatek.com>
To: <xen-devel@lists.xenproject.org>
CC: Yang Xu <yang.xu@mediatek.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] docs/misc: fix document typo
Date: Tue, 18 Jul 2023 12:25:29 +0000
Message-ID: <20230718122529.19912-1-yang.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

From: Yang Xu <yang.xu@mediatek.com>

Fix document typo for more accurate meaning

Signed-off-by: Yang Xu <yang.xu@mediatek.com>
---
 docs/misc/xen-makefiles/makefiles.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/misc/xen-makefiles/makefiles.rst b/docs/misc/xen-makefiles/makefiles.rst
index 04bc72601c..bc2f932fbc 100644
--- a/docs/misc/xen-makefiles/makefiles.rst
+++ b/docs/misc/xen-makefiles/makefiles.rst
@@ -68,7 +68,7 @@ Descending down in directories
 
 	It is good practice to use a `CONFIG_` variable when assigning directory
 	names. This allows the build system to totally skip the directory if the
-	corresponding `CONFIG_` option is 'y'.
+	corresponding `CONFIG_` option is not set to 'y'.
 
 Compilation flags
 -----------------
-- 
2.25.1


