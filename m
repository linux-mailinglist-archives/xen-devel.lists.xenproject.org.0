Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D40F614F22
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 17:25:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435139.688265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opu4x-0001lL-7N; Tue, 01 Nov 2022 16:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435139.688265; Tue, 01 Nov 2022 16:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opu4x-0001j3-3n; Tue, 01 Nov 2022 16:25:31 +0000
Received: by outflank-mailman (input) for mailman id 435139;
 Tue, 01 Nov 2022 16:25:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PfM8=3B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1optvR-0000i5-19
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 16:15:41 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ccac263-5a00-11ed-8fd0-01056ac49cbb;
 Tue, 01 Nov 2022 17:15:39 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E9ECD1F90F;
 Tue,  1 Nov 2022 16:15:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BD6A51346F;
 Tue,  1 Nov 2022 16:15:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aJTaLCpGYWN0dwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 01 Nov 2022 16:15:38 +0000
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
X-Inumbo-ID: 6ccac263-5a00-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667319338; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eAHb8+QFjd5pkkPNHRs46idZapdPvMHUccr3ff2r5Dk=;
	b=FXS0hBgkIjRdmY+XZX/5I1lbxMmzyG9Z7+97+Rs1Qr1mN9bRIPa5kiPpwRZ61AT9PwWsh5
	j4xCekkHPpCKyzn9DUUZGnp3gTlu1yjjIqZIIpLxcAG/vmCtZucKMk6umnOTHbDeGQk+b0
	P71e/QkSBWeOsJnrDfdF+rB2HF4IYeM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 07/10] tools/xenstore: remove stale TODO file
Date: Tue,  1 Nov 2022 17:14:54 +0100
Message-Id: <20221101161457.8470-8-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221101161457.8470-1-jgross@suse.com>
References: <20221101161457.8470-1-jgross@suse.com>
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


