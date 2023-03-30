Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C94F6CFF1A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 10:51:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516514.800755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phnzj-0008Ry-W0; Thu, 30 Mar 2023 08:50:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516514.800755; Thu, 30 Mar 2023 08:50:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phnzj-0008Nt-SS; Thu, 30 Mar 2023 08:50:55 +0000
Received: by outflank-mailman (input) for mailman id 516514;
 Thu, 30 Mar 2023 08:50:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QMey=7W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1phnzi-0005fr-2q
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 08:50:54 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa911ab0-ced7-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 10:50:53 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 75E2D1FEAA;
 Thu, 30 Mar 2023 08:50:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4AA7B138FF;
 Thu, 30 Mar 2023 08:50:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hlzcEG1NJWRDIwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 30 Mar 2023 08:50:53 +0000
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
X-Inumbo-ID: fa911ab0-ced7-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680166253; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eAHb8+QFjd5pkkPNHRs46idZapdPvMHUccr3ff2r5Dk=;
	b=VQiPEYFDNhYmB8OQVoK/9CWPHcjS0d4xwKwM+16jlaTU8Ajh+vamK3QFrQNB2VVhImis0D
	JKowpBqxphEuPUjezkyZD6HYyoRjGnklugh/8doRB3YnaoPC1jCBbHUsZSMp01bEt1v/Y2
	c6jMzFgG2ur6XFO6AOt2INwgjCFy+OE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 07/13] tools/xenstore: remove stale TODO file
Date: Thu, 30 Mar 2023 10:50:05 +0200
Message-Id: <20230330085011.9170-8-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230330085011.9170-1-jgross@suse.com>
References: <20230330085011.9170-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TODO file is not really helpful any longer. It contains only
entries which no longer apply or it is unknown what they are meant
for ("Dynamic/supply nodes", "Remove assumption that rename doesn't
fail").

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstore/TODO | 10 ----------
 1 file changed, 10 deletions(-)
 delete mode 100644 tools/xenstore/TODO

diff --git a/tools/xenstore/TODO b/tools/xenstore/TODO
deleted file mode 100644
index 71d5bbbf50..0000000000
--- a/tools/xenstore/TODO
+++ /dev/null
@@ -1,10 +0,0 @@
-TODO in no particular order.  Some of these will never be done.  There
-are omissions of important but necessary things.  It is up to the
-reader to fill in the blanks.
-
-- Timeout failed watch responses
-- Dynamic/supply nodes
-- Persistant storage of introductions, watches and transactions, so daemon can restart
-- Remove assumption that rename doesn't fail
-- Multi-root transactions, for setting up front and back ends at same time.
-
-- 
2.35.3


