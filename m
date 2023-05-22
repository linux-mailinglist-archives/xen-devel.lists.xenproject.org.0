Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD16370C2E3
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 18:00:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538030.837763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q17xI-0005a1-LG; Mon, 22 May 2023 16:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538030.837763; Mon, 22 May 2023 16:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q17xI-0005Xa-HV; Mon, 22 May 2023 16:00:16 +0000
Received: by outflank-mailman (input) for mailman id 538030;
 Mon, 22 May 2023 16:00:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fRnz=BL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q17xG-0005XU-M0
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 16:00:14 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb16cc69-f8b9-11ed-8611-37d641c3527e;
 Mon, 22 May 2023 18:00:12 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A4DB51FFE7;
 Mon, 22 May 2023 16:00:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 57DC513336;
 Mon, 22 May 2023 16:00:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EWP8E4qRa2T4UwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 22 May 2023 16:00:10 +0000
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
X-Inumbo-ID: bb16cc69-f8b9-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1684771210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BP7MEx0wqpUzQfE6+pnt/+uKKqY6p022N72TDH/hyBc=;
	b=W57TZcpl8adxTy2DVoueq7OMTobqxZWxjHg21F10L+uNbshI1NvlxtaOr+VQTGI4mJHZu4
	gwtqXCDBTPn3RmreeHTLlagoiiODgphbTf/H7GWKPpePfrhQ7SVDgs0iEwHUP7rxjMEyDa
	cUZPZm6l8ZY3Yoqo03bbYZII3FIe9Zw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] MAINTAINERS: remove xenstore related files from LIBS
Date: Mon, 22 May 2023 18:00:08 +0200
Message-Id: <20230522160008.27779-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need to have the Xenstore headers listed in the LIBS
section now that they have been added to the XENSTORE section.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f2f1881b32..82ad8d1709 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -411,8 +411,6 @@ F:	tools/include/xengnttab.h
 F:	tools/include/xenguest.h
 F:	tools/include/xenhypfs.h
 F:	tools/include/xenstat.h
-F:	tools/include/xenstore*.h
-F:	tools/include/xenstore-compat/*.h
 F:	tools/include/xentoolcore*.h
 F:	tools/include/xentoollog.h
 F:	tools/libs/
-- 
2.35.3


