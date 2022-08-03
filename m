Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 130CC588BAA
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 14:00:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379827.613627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJD2a-0000FR-2r; Wed, 03 Aug 2022 11:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379827.613627; Wed, 03 Aug 2022 11:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJD2Z-0000Ba-Vc; Wed, 03 Aug 2022 11:59:55 +0000
Received: by outflank-mailman (input) for mailman id 379827;
 Wed, 03 Aug 2022 11:59:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCkI=YH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oJD2Y-00008E-Jb
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 11:59:54 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8f58012-1323-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 13:59:53 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6491F3FF36;
 Wed,  3 Aug 2022 11:59:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 25A6E13AE7;
 Wed,  3 Aug 2022 11:59:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4MH2Bzlj6mKNUgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 03 Aug 2022 11:59:53 +0000
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
X-Inumbo-ID: c8f58012-1323-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1659527993; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9GJyqkGHB0z8ieAkwvJPlzfO0eLrNZxVu98Q0w0DzuE=;
	b=Pz15mCl2nFRFfOrcaEpRtb2Z9kHgmW6spI5uPow+6JOlYkIwv4Ga9IFPdKGfJIdxsj2iCp
	mBpVpa4aMqvJQrnA6LxT7AudXStQML2PzD0HidceropneOVFEdeaR+HkKSTd2Dr0qTr7NO
	vDE/7onEAGt5dy2tbLWVhq8BUbQmi4o=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/5] tools/xenstore: minor fix of the migration stream doc
Date: Wed,  3 Aug 2022 13:59:46 +0200
Message-Id: <20220803115950.10904-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220803115950.10904-1-jgross@suse.com>
References: <20220803115950.10904-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop mentioning the non-existent read-only socket in the migration
stream description document.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 docs/designs/xenstore-migration.md | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
index b94af7fd7c..efa526f420 100644
--- a/docs/designs/xenstore-migration.md
+++ b/docs/designs/xenstore-migration.md
@@ -129,11 +129,9 @@ xenstored state that needs to be restored.
 | `evtchn-fd`    | The file descriptor used to communicate with |
 |                | the event channel driver                     |
 
-xenstored will resume in the original process context. Hence `rw-socket-fd` and
-`ro-socket-fd` simply specify the file descriptors of the sockets. Sockets
-are not always used, however, and so -1 will be used to denote an unused
-socket.
-
+xenstored will resume in the original process context. Hence `rw-socket-fd`
+simply specifies the file descriptor of the socket. Sockets are not always
+used, however, and so -1 will be used to denote an unused socket.
 
 \pagebreak
 
-- 
2.35.3


