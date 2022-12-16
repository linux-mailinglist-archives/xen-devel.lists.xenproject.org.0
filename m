Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8687864ED4A
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 15:59:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464763.723279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6CAT-0003Hj-Du; Fri, 16 Dec 2022 14:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464763.723279; Fri, 16 Dec 2022 14:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6CAT-0003E9-A4; Fri, 16 Dec 2022 14:58:33 +0000
Received: by outflank-mailman (input) for mailman id 464763;
 Fri, 16 Dec 2022 14:58:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IXf/=4O=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p6CAS-0002gY-1D
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 14:58:32 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b0bd78a-7d52-11ed-8fd4-01056ac49cbb;
 Fri, 16 Dec 2022 15:58:31 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3370A3431A;
 Fri, 16 Dec 2022 14:58:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EB6A1138FD;
 Fri, 16 Dec 2022 14:58:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id D5wpOJaHnGPAeAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 16 Dec 2022 14:58:30 +0000
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
X-Inumbo-ID: 1b0bd78a-7d52-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1671202711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DdtkNadGDanVmd8kJX65xjdddaLea0RGEwD4P1a+J98=;
	b=lODXEK7ebePxLiw4PLu3KgzPfwzpEJ8IAv4i/mfs4SKHCuKJrxjbYg1qOAihkqBC6oD+9U
	nhSOPxk8HT/dVvpZHdqnBP9Yo3K27sS+sbEM7f/LIiYFCQXYHMP0OtPzTqT1jic8TKGPY9
	KjNkKTIBe7WLq0e05vK4e9zGRsdkFbs=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 2/4] xen/blkback: remove stale prototype
Date: Fri, 16 Dec 2022 15:58:14 +0100
Message-Id: <20221216145816.27374-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221216145816.27374-1-jgross@suse.com>
References: <20221216145816.27374-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no function xen_blkif_purge_persistent(), so remove its
prototype from common.h.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/block/xen-blkback/common.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/block/xen-blkback/common.h b/drivers/block/xen-blkback/common.h
index 9a13a6b420a6..fab8a8dee0da 100644
--- a/drivers/block/xen-blkback/common.h
+++ b/drivers/block/xen-blkback/common.h
@@ -384,7 +384,6 @@ void xen_blkif_xenbus_fini(void);
 
 irqreturn_t xen_blkif_be_int(int irq, void *dev_id);
 int xen_blkif_schedule(void *arg);
-int xen_blkif_purge_persistent(void *arg);
 void xen_blkbk_free_caches(struct xen_blkif_ring *ring);
 
 int xen_blkbk_flush_diskcache(struct xenbus_transaction xbt,
-- 
2.35.3


