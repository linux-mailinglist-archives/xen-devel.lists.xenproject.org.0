Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D78F24B9F60
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 12:47:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274703.470271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKfFz-0005OK-Dk; Thu, 17 Feb 2022 11:47:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274703.470271; Thu, 17 Feb 2022 11:47:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKfFz-0005LT-AD; Thu, 17 Feb 2022 11:47:31 +0000
Received: by outflank-mailman (input) for mailman id 274703;
 Thu, 17 Feb 2022 11:47:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9h7v=TA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nKfFy-0005LN-Ai
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 11:47:30 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62360248-8fe7-11ec-b215-9bbe72dcb22c;
 Thu, 17 Feb 2022 12:47:29 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B20971F37D;
 Thu, 17 Feb 2022 11:47:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6FB3113BBF;
 Thu, 17 Feb 2022 11:47:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tj5sGdA1DmJTZgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 17 Feb 2022 11:47:28 +0000
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
X-Inumbo-ID: 62360248-8fe7-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1645098448; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uDJRyFd5hVkQNt9lps+kB/Y84BVoWZeCo2NQlN26dMc=;
	b=ddnVYCN4Mp8aGXWLtGMMIWx6JFk5hWeGRWr68NpKmaJY8CkNPckXi0o06FgaQxCr6vM/J9
	Z6XWIWgDvUMAmQcTNMqSKG4ExwClT3KIu0d+MDCPpTYPNd3zq8y/wLaNh0ei8ErrZ0VDhf
	wo2aMCa/4qPSU4WkHiUE41r1cccmzZk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] docs: add some clarification to xenstore-migration.md
Date: Thu, 17 Feb 2022 12:47:26 +0100
Message-Id: <20220217114726.8994-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Xenstore migration document is missing the specification that a
node record must be preceded by the record of its parent node in case
of live update.

Add that missing part.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- rephrase to cover non-LU case, too (Julien Grall)
---
 docs/designs/xenstore-migration.md | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
index 5f1155273e..b94af7fd7c 100644
--- a/docs/designs/xenstore-migration.md
+++ b/docs/designs/xenstore-migration.md
@@ -316,6 +316,11 @@ a _committed_ node (globally visible in xenstored) or a _pending_ node (created
 or modified by a transaction for which there is also a `TRANSACTION_DATA`
 record previously present).
 
+Each _committed_ node in the stream is required to have an already known parent
+node. A parent node is known if it was either in the node data base before the
+stream was started to be processed, or if a `NODE_DATA` record for that parent
+node has already been processed in the stream.
+
 
 ```
     0       1       2       3    octet
-- 
2.34.1


