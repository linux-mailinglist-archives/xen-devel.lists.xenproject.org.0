Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1876F1976
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 15:29:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527329.819858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psO8p-0004Pp-Jj; Fri, 28 Apr 2023 13:28:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527329.819858; Fri, 28 Apr 2023 13:28:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psO8p-0004Mr-Fz; Fri, 28 Apr 2023 13:28:03 +0000
Received: by outflank-mailman (input) for mailman id 527329;
 Fri, 28 Apr 2023 13:28:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ym/r=AT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1psO8n-0004Ml-VX
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 13:28:01 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e476650-e5c8-11ed-8611-37d641c3527e;
 Fri, 28 Apr 2023 15:27:59 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 04EB521B36;
 Fri, 28 Apr 2023 13:27:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BBE64138FA;
 Fri, 28 Apr 2023 13:27:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NO6GLN7JS2SmHAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 28 Apr 2023 13:27:58 +0000
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
X-Inumbo-ID: 7e476650-e5c8-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1682688479; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rht8dosjRjMYbzmS7nuUus/q8ExMB9UOqXydMF+SbH8=;
	b=qLI8uJtk9SxX1ql52bOq61CXuH1Clugvwb5HktJPoCOwQYPJsEf5ynAX+Fgd8KYJVbmWa+
	XxjbGVGtTyPPWZBlKF1QTy+cRhxVgPQccCUD7mM8O4G4M/BfsacTbjl3x2eNt3yOIni4Xq
	WNv48oTd9ITlpaTDlTyDO/sDKdm1LbA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] MAINTAINERS: add more xenstore files
Date: Fri, 28 Apr 2023 15:27:56 +0200
Message-Id: <20230428132756.8763-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xenstore consists of more files than just the tools/xenstore directory.

Add them to the XENSTORE block.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0e5eba2312..f2f1881b32 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -653,6 +653,11 @@ M:	Wei Liu <wl@xen.org>
 M:	Juergen Gross <jgross@suse.com>
 R:	Julien Grall <julien@xen.org>
 S:	Supported
+F:	tools/helpers/init-xenstore-domain.c
+F:	tools/include/xenstore-compat/
+F:	tools/include/xenstore.h
+F:	tools/include/xenstore_lib.h
+F:	tools/libs/store/
 F:	tools/xenstore/
 
 XENTRACE
-- 
2.35.3


