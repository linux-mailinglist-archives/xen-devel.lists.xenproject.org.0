Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0647F263E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 08:21:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637531.993409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5L3p-0002T0-Ni; Tue, 21 Nov 2023 07:20:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637531.993409; Tue, 21 Nov 2023 07:20:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5L3p-0002Qt-Kf; Tue, 21 Nov 2023 07:20:41 +0000
Received: by outflank-mailman (input) for mailman id 637531;
 Tue, 21 Nov 2023 07:20:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AdV8=HC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r5L3o-0002Qn-H5
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 07:20:40 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7888b278-883e-11ee-98e0-6d05b1d4d9a1;
 Tue, 21 Nov 2023 08:20:39 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 133D91F8AA;
 Tue, 21 Nov 2023 07:20:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C5E73138E3;
 Tue, 21 Nov 2023 07:20:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id v1vtLkVaXGV4ZgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Nov 2023 07:20:37 +0000
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
X-Inumbo-ID: 7888b278-883e-11ee-98e0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700551238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IoTAqFPXtrydpOhzaoq9rK4oO0dLKtWTd80AkbGuZT4=;
	b=ihFGWK5eHcgQAzAoHFiTqc5q4Ev7FHcphqUyHpJFXt9eGjlEsCjJO8pUhw7Bvgd927TPvU
	Tt9x5/firfgISaf8ywTqU9rkNF8eguRMgqYeUcAzt6s8Oub0o/JMxgfoKIn/o6r/k5A4zS
	W6Cl5r45hjJbyHqpI1BLC/fdG6EOfD8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] SUPPORT.md: change current version to 4.19-unstable
Date: Tue, 21 Nov 2023 08:20:36 +0100
Message-Id: <20231121072036.12133-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.60
X-Spamd-Result: default: False [3.60 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.10)[65.75%]
X-Spam-Flag: NO

The version in SUPPORT.md is still "4.18-rc".

Change it to "4.19-unstable".

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 SUPPORT.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index fff4b4c5ba..a90d1108c9 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -9,7 +9,7 @@ for the definitions of the support status levels etc.
 
 # Release Support
 
-    Xen-Version: 4.18-rc
+    Xen-Version: 4.19-unstable
     Initial-Release: n/a
     Supported-Until: TBD
     Security-Support-Until: Unreleased - not yet security-supported
-- 
2.35.3


