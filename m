Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8F2715920
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 10:55:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540886.843013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3v8B-0004Zj-70; Tue, 30 May 2023 08:55:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540886.843013; Tue, 30 May 2023 08:55:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3v8B-0004WJ-1v; Tue, 30 May 2023 08:55:03 +0000
Received: by outflank-mailman (input) for mailman id 540886;
 Tue, 30 May 2023 08:55:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2tj/=BT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q3v89-0001Xf-Rv
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 08:55:01 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a909bf9e-fec7-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 10:55:00 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8C8AE1F889;
 Tue, 30 May 2023 08:55:00 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 5AB231341B;
 Tue, 30 May 2023 08:55:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id xBDPFOS5dWR9GwAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 30 May 2023 08:55:00 +0000
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
X-Inumbo-ID: a909bf9e-fec7-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685436900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VpYOE55y7dDkYrLF82bs2KE6V7NluVg/KzLUtjOisvA=;
	b=iMJzxlH9siBLYShrQFYqlH5CQYszTzmAOFp3HhomdYCbBt8B/Kc4C5X6Dv4RlLILzzMPfz
	z1INeqWlNT0XJ/Q50/xR2EtE+Wd57/qpIVwuJhaRggpPqXG6zymUsn/cuZ8Rq4xWI+49Rx
	t9XVoZxKFJzB0Jn69ZicAfzsJSNMqGE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 07/16] tools/xenstore: remove stale TODO file
Date: Tue, 30 May 2023 10:54:09 +0200
Message-Id: <20230530085418.5417-8-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230530085418.5417-1-jgross@suse.com>
References: <20230530085418.5417-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TODO file is not really helpful any longer. It contains only
entries which no longer apply or it is unknown what they are meant
for ("Dynamic/supply nodes", "Remove assumption that rename doesn't
fail").

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
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


