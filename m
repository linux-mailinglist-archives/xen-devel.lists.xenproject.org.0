Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1245B614F20
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 17:25:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435119.688220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opu4d-0008Pa-Nf; Tue, 01 Nov 2022 16:25:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435119.688220; Tue, 01 Nov 2022 16:25:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opu4d-0008Og-KT; Tue, 01 Nov 2022 16:25:11 +0000
Received: by outflank-mailman (input) for mailman id 435119;
 Tue, 01 Nov 2022 16:25:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optvV-0000i5-CS
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 16:15:45 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 701c7b69-5a00-11ed-8fd0-01056ac49cbb;
 Tue, 01 Nov 2022 17:15:44 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 80B543382E;
 Tue,  1 Nov 2022 16:15:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 53A851346F;
 Tue,  1 Nov 2022 16:15:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id djYBEzBGYWOHdwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 16:15:44 +0000
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
X-Inumbo-ID: 701c7b69-5a00-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667319344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IGeFv24ZPr/KZ3pFnNba31NdyHUcNMT973heFZoLWFU=;
	b=T7J3HDkC1l+3rUaVhUunMHYySpYRhVEQhxj6aYRXboYzG0eM5jAtqwPy+Y5ztLlixdE9Cp
	jFxZViANVTYtICCiE/OUOfbzUhZcQmhexZ7BjVWfAL+PNEY7kDBkLzOjAkIP3pP/IAlCJp
	MA5cjgldwEMICM5h6IrDvNF88tMcxWM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 08/10] tools/xenstore: remove unused events list
Date: Tue,  1 Nov 2022 17:14:55 +0100
Message-Id: <20221101161457.8470-9-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221101161457.8470-1-jgross@suse.com>
References: <20221101161457.8470-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct watch contains an used struct list_head events. Remove it.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/xenstored_watch.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tools/xenstore/xenstored_watch.c b/tools/xenstore/xenstored_watch.c
index ca0194966e..0078c60f32 100644
--- a/tools/xenstore/xenstored_watch.c
+++ b/tools/xenstore/xenstored_watch.c
@@ -36,9 +36,6 @@ struct watch
 	/* Watches on this connection */
 	struct list_head list;
 
-	/* Current outstanding events applying to this watch. */
-	struct list_head events;
-
 	/* Offset into path for skipping prefix (used for relative paths). */
 	unsigned int prefix_len;
 
@@ -205,8 +202,6 @@ static struct watch *add_watch(struct connection *conn, char *path, char *token,
 
 	watch->prefix_len = relative ? strlen(get_implicit_path(conn)) + 1 : 0;
 
-	INIT_LIST_HEAD(&watch->events);
-
 	domain_watch_inc(conn);
 	list_add_tail(&watch->list, &conn->watches);
 	talloc_set_destructor(watch, destroy_watch);
-- 
2.35.3


