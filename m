Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA65E304AB1
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 21:56:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75493.135959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4VMp-00079t-Vh; Tue, 26 Jan 2021 20:55:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75493.135959; Tue, 26 Jan 2021 20:55:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4VMp-00079X-SX; Tue, 26 Jan 2021 20:55:15 +0000
Received: by outflank-mailman (input) for mailman id 75493;
 Tue, 26 Jan 2021 20:55:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EN4V=G5=kernel.org=helgaas@srs-us1.protection.inumbo.net>)
 id 1l4VMo-00079S-G4
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 20:55:14 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3fa9dbc6-dd6c-4b66-bc54-814467f05dce;
 Tue, 26 Jan 2021 20:55:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E746221ED;
 Tue, 26 Jan 2021 20:55:12 +0000 (UTC)
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
X-Inumbo-ID: 3fa9dbc6-dd6c-4b66-bc54-814467f05dce
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611694512;
	bh=pPOPnPOUm7Mw8AlwqCOyx8JbwF0GWFV6pj6g8MexlgE=;
	h=From:To:Cc:Subject:Date:From;
	b=UPDIIZt9SCAvv/WudzznbJY2FXUjO8MVpNPND9VVuUMaDRR+M+QwJqf0GPAlzME28
	 4mkstN0AjoMhqMPc7ZKY1Ic9rdFwGGJcir4iTUYSICsA6IG70A6q/v+QkgMbhy+eZo
	 D825qWbno/faYo/84SJIIt7oWxu2CtxkwIRiXtuX4fO+3HONlb3Bx/QYKgp919GUjo
	 OCYyAmzeiewg+l3H37CketYQi0oeQYV9qXYAXQOWF+qdrP1G084asP3vXzUc+/SUUP
	 UOlXidOLJvFoCK847ej7ICjFIJsSaBTo2sXJ917VoU4HeBlgJ9XmWU5Z+UMpOORW6b
	 chXSaBybOJIFw==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: xen-devel@lists.xenproject.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH] xen-blkfront: Fix 'physical' typos
Date: Tue, 26 Jan 2021 14:55:09 -0600
Message-Id: <20210126205509.2917606-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bjorn Helgaas <bhelgaas@google.com>

Fix misspelling of "physical".

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/block/xen-blkfront.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 5265975b3fba..876db9fcf388 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -2403,7 +2403,7 @@ static void blkfront_connect(struct blkfront_info *info)
 	}
 
 	/*
-	 * physcial-sector-size is a newer field, so old backends may not
+	 * physical-sector-size is a newer field, so old backends may not
 	 * provide this. Assume physical sector size to be the same as
 	 * sector_size in that case.
 	 */
-- 
2.25.1


