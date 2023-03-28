Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D6A6CC22A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 16:35:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515903.799243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phAQ1-00030v-9v; Tue, 28 Mar 2023 14:35:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515903.799243; Tue, 28 Mar 2023 14:35:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phAQ1-0002z0-6r; Tue, 28 Mar 2023 14:35:25 +0000
Received: by outflank-mailman (input) for mailman id 515903;
 Tue, 28 Mar 2023 14:35:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WLKu=7U=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1phAQ0-0002yu-LQ
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 14:35:24 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c54a345c-cd75-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 16:35:22 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F13081FDD8;
 Tue, 28 Mar 2023 14:35:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BD68F1390D;
 Tue, 28 Mar 2023 14:35:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yFw+LCn7ImQNewAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 28 Mar 2023 14:35:21 +0000
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
X-Inumbo-ID: c54a345c-cd75-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680014121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=cpP+qMBWSkWzFGiAjKpXztpzxl2tQH7Ol5+fc07JFl8=;
	b=QDfBS3AijC3KKlnDh41hx7ETWI84MuyaMBZy9LOUpv3fq9RUc/HFLrT7BsWSNDJBvQyRyH
	qi13l9FFlQe7E2/LTFmn3sWC5ONcnm1hvSMqB5umACJEI1r9wKl0aeNVX42Kr/7fXNvOAH
	xe0B9W9TyToq4X0fJEwfunKEnMjEkCI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2] tools/xenstore: remove stale comment in create_node()
Date: Tue, 28 Mar 2023 16:35:20 +0200
Message-Id: <20230328143520.5988-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a part of a comment in create_node() which should have been
deleted when modifying the related coding.

Fixes: 1cd3cc7ea27c ("tools/xenstore: create_node: Don't defer work to undo any changes on failure")
Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
V2:
- add Fixes: tag (Julien Grall)
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


