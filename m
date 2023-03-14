Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 964CB6B97EE
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 15:28:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509662.785860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5d4-0003SM-0F; Tue, 14 Mar 2023 14:27:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509662.785860; Tue, 14 Mar 2023 14:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5d3-0003Qa-Tm; Tue, 14 Mar 2023 14:27:53 +0000
Received: by outflank-mailman (input) for mailman id 509662;
 Tue, 14 Mar 2023 14:27:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6q5S=7G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pc5d2-0003Pt-JL
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 14:27:52 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 660bc775-c274-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 15:27:50 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 21FA21F899;
 Tue, 14 Mar 2023 14:27:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D7DEC13A26;
 Tue, 14 Mar 2023 14:27:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id itxPM2WEEGSlHQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 14 Mar 2023 14:27:49 +0000
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
X-Inumbo-ID: 660bc775-c274-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1678804070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n8TxNKtpI04XLAnLEmz7M3NSUXuLRT6vG3gdFIDxCXU=;
	b=TEKm+kbgBv5DNKUVg3fZVCjzh4vkguPjGhL+guVf0uW/1MQ3c4bjHWJmBRM27+NYVtaBmX
	sT9vW4z1vPpy6G3G/6ScEW8hEFfY0ksYLNNh2M8vmtkYhI3oK4SwXcpNajGIcuJ4Vm/qRn
	pIbfX21rDC/9PIkVGDg7vXXuGPjZi+0=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 1/4] xen/blkback: fix white space code style issues
Date: Tue, 14 Mar 2023 15:27:38 +0100
Message-Id: <20230314142741.24917-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230314142741.24917-1-jgross@suse.com>
References: <20230314142741.24917-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
 drivers/block/xen-blkback/blkback.c | 2 +-
 drivers/block/xen-blkback/common.h  | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index a5cf7f1e871c..6e2163aaf362 100644
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -891,7 +891,7 @@ static int xen_blkbk_map(struct xen_blkif_ring *ring,
 out:
 	for (i = last_map; i < num; i++) {
 		/* Don't zap current batch's valid persistent grants. */
-		if(i >= map_until)
+		if (i >= map_until)
 			pages[i]->persistent_gnt = NULL;
 		pages[i]->handle = BLKBACK_INVALID_HANDLE;
 	}
diff --git a/drivers/block/xen-blkback/common.h b/drivers/block/xen-blkback/common.h
index a28473470e66..9a13a6b420a6 100644
--- a/drivers/block/xen-blkback/common.h
+++ b/drivers/block/xen-blkback/common.h
@@ -296,7 +296,7 @@ struct xen_blkif_ring {
 	struct work_struct	free_work;
 	/* Thread shutdown wait queue. */
 	wait_queue_head_t	shutdown_wq;
-	struct xen_blkif 	*blkif;
+	struct xen_blkif	*blkif;
 };
 
 struct xen_blkif {
@@ -315,7 +315,7 @@ struct xen_blkif {
 	atomic_t		drain;
 
 	struct work_struct	free_work;
-	unsigned int 		nr_ring_pages;
+	unsigned int		nr_ring_pages;
 	bool			multi_ref;
 	/* All rings for this device. */
 	struct xen_blkif_ring	*rings;
@@ -329,7 +329,7 @@ struct seg_buf {
 };
 
 struct grant_page {
-	struct page 		*page;
+	struct page		*page;
 	struct persistent_gnt	*persistent_gnt;
 	grant_handle_t		handle;
 	grant_ref_t		gref;
-- 
2.35.3


