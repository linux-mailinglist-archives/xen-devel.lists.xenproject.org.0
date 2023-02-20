Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DF469CFC3
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 15:57:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498194.769019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU7bL-0000ds-SX; Mon, 20 Feb 2023 14:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498194.769019; Mon, 20 Feb 2023 14:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU7bL-0000bf-Pr; Mon, 20 Feb 2023 14:57:11 +0000
Received: by outflank-mailman (input) for mailman id 498194;
 Mon, 20 Feb 2023 14:57:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HMXb=6Q=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pU7bJ-0000bX-UY
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 14:57:09 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d91bfb4f-b12e-11ed-933d-83870f6b2ba8;
 Mon, 20 Feb 2023 15:57:08 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8D52F2049A;
 Mon, 20 Feb 2023 14:57:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 60ADC134BA;
 Mon, 20 Feb 2023 14:57:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id s10mFkSK82P1QwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Feb 2023 14:57:08 +0000
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
X-Inumbo-ID: d91bfb4f-b12e-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1676905028; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gW0vA6lTPSl+sxfxbA90Yvch05sHmFUrm4oBgNvFLrs=;
	b=nNfEFQUkkb9yR/Ds+9WAHF4G6bYAE3CDxo5xdaftCeoG/XRXuIgI2Xtko8EIRvQ6TWagXI
	iQPh3CC7kfyB1QWON4FMqAL1INBdsiKf5HgR3M5/xezCkCKX2IESBJRXAWjhOtAghDWYfX
	bugdWjdWJaV5b47c+TmV+gdCMAlRAW4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/xenstore: remove stale comment in create_node()
Date: Mon, 20 Feb 2023 15:57:06 +0100
Message-Id: <20230220145706.15905-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a part of a comment in create_node() which should have been
deleted when modifying the related coding.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 7348f935bc..a61db2db2d 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -1480,9 +1480,6 @@ static struct node *create_node(struct connection *conn, const void *ctx,
 	 * All new created nodes will have i->parent set, while the final
 	 * node will be already existing and won't have i->parent set.
 	 * New nodes are subject to quota handling.
-	 * Initially set a destructor for all new nodes removing them from
-	 * TDB again and undoing quota accounting for the case of an error
-	 * during the write loop.
 	 */
 	for (i = node; i; i = i->parent) {
 		/* i->parent is set for each new node, so check quota. */
-- 
2.35.3


