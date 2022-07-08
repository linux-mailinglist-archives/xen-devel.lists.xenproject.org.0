Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A257556B148
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 06:14:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363208.593647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9fMW-0003gK-D7; Fri, 08 Jul 2022 04:13:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363208.593647; Fri, 08 Jul 2022 04:13:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9fMW-0003dK-9a; Fri, 08 Jul 2022 04:13:04 +0000
Received: by outflank-mailman (input) for mailman id 363208;
 Fri, 08 Jul 2022 04:13:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t/Gy=XN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o9fMU-0003dE-La
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 04:13:02 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41047b32-fe74-11ec-bd2d-47488cf2e6aa;
 Fri, 08 Jul 2022 06:13:00 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D01331FE05;
 Fri,  8 Jul 2022 04:12:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 868D3134A9;
 Fri,  8 Jul 2022 04:12:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5uZhH8uux2KpTQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 08 Jul 2022 04:12:59 +0000
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
X-Inumbo-ID: 41047b32-fe74-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1657253579; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lrzw+Qqdip2nsfCNq9eOVaFJTXPMdrkiCgFxrgCBoiA=;
	b=O6X9HOHcY9G35+fQFSQhSv9s+e10W9RDexLSKAuAi1cEnrpUvWKV6RxX7jzxW7yM3R7+fq
	B3v3KTm7B58wrd1jN5+E5OgE0l2SqCK2wnyYhlxYbnDofX6NYp0rE+B+NEqpfLIxoFVKDp
	P2resB3vd317lb19CR5MEU+xVxdkHp4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] docs: add reference to release cycle discussion
Date: Fri,  8 Jul 2022 06:12:58 +0200
Message-Id: <20220708041258.10349-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As it is coming up basically every release cycle of Xen, add a
reference to the discussion why the current release scheme has been
selected in the release management documentation.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/process/xen-release-management.pandoc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/process/xen-release-management.pandoc b/docs/process/xen-release-management.pandoc
index b746c7157d..8f80d61d2f 100644
--- a/docs/process/xen-release-management.pandoc
+++ b/docs/process/xen-release-management.pandoc
@@ -19,6 +19,8 @@ The Xen hypervisor project now releases every 8 months.  We aim to
 release in the first half of March/July/November.  These dates have
 been chosen to avoid major holidays and cultural events; if one
 release slips, ideally the subsequent release cycle would be shortened.
+The reasons for this schedule have been discussed on
+[xen-devel](https://lists.xen.org/archives/html/xen-devel/2018-07/msg02240.html).
 
 We can roughly divide one release into two periods. The development period
 and the freeze period. The former is 6 months long and the latter is about 2
-- 
2.35.3


