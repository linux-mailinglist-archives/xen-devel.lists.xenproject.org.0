Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6804B0C4E
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 12:27:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269825.463949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI7bG-00074s-6w; Thu, 10 Feb 2022 11:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269825.463949; Thu, 10 Feb 2022 11:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI7bG-00071r-30; Thu, 10 Feb 2022 11:26:58 +0000
Received: by outflank-mailman (input) for mailman id 269825;
 Thu, 10 Feb 2022 11:26:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jhle=SZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nI7bE-00071l-4g
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 11:26:56 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59bd282a-8a64-11ec-8f75-fffcc8bd4f1a;
 Thu, 10 Feb 2022 12:26:55 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A9D5621128;
 Thu, 10 Feb 2022 11:26:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 71A4513B6A;
 Thu, 10 Feb 2022 11:26:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qJKgGn72BGKYDQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 10 Feb 2022 11:26:54 +0000
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
X-Inumbo-ID: 59bd282a-8a64-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644492414; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=jms15zoEbHPC0BQjeoHvItuq/ifuJoTS71Sh7OrlEG0=;
	b=Yha58CSvzPlABX9u4HFJaywX3z+JZDsTaUkw0Tmbu3smcR0GaGVPWlec/GjDtHKUo7xs3U
	Z33IFysHGXu3oGMK+xvDH314/jg+uZ22SYB4TOx847rFjYtnCiyRWhOhrT1MnZzHdcpIwQ
	rZ305fFqbK2nLZ8wak+C6CMguVAPcZw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] docs: add some clarification to xenstore-migration.md
Date: Thu, 10 Feb 2022 12:26:52 +0100
Message-Id: <20220210112652.6237-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Xenstore migration document is missing the specification that a
node record must be preceded by the record of its parent node in case
of live update.

Add that missing part.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/designs/xenstore-migration.md | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
index 5f1155273e..39e31c984b 100644
--- a/docs/designs/xenstore-migration.md
+++ b/docs/designs/xenstore-migration.md
@@ -316,6 +316,10 @@ a _committed_ node (globally visible in xenstored) or a _pending_ node (created
 or modified by a transaction for which there is also a `TRANSACTION_DATA`
 record previously present).
 
+In the live update case the _committed_ nodes must be in a top-down sequence,
+i.e. the first node needs to be `/`, and each other node in the stream must
+come _after_ its parent node.
+
 
 ```
     0       1       2       3    octet
-- 
2.34.1


