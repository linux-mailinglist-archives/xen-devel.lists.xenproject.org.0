Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8F37F474E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 14:03:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638755.995638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5msC-0006qb-9b; Wed, 22 Nov 2023 13:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638755.995638; Wed, 22 Nov 2023 13:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5msC-0006oN-6o; Wed, 22 Nov 2023 13:02:32 +0000
Received: by outflank-mailman (input) for mailman id 638755;
 Wed, 22 Nov 2023 13:02:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9zcJ=HD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r5msA-0006nv-Th
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 13:02:30 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63b89c56-8937-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 14:02:28 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 566C721963;
 Wed, 22 Nov 2023 13:02:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0A2BC13467;
 Wed, 22 Nov 2023 13:02:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FYwKAeT7XWUbXwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Nov 2023 13:02:28 +0000
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
X-Inumbo-ID: 63b89c56-8937-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700658148; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jiOxPL4BgbCdTD9PsC/V2+VgALOSvOhXgYDIvoCewV4=;
	b=DXAY9OMdRTfn1e8Vk0R3b+4Sf6HBRg2tz8aY3OPDwntt7N6HlyohL5vxNVg+EKv7Hc0leZ
	lTW4vWy3nac5VXYSoeC8+VduuhlQzs6RsrKR6kuy6Wdysx48eyhZOz3BGA8JqMl0+FTd2a
	wdRGUnswxsIB88HaICQbB9mUDZh6eaQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 1/2] tools/pygrub: add .gitignore file
Date: Wed, 22 Nov 2023 14:02:19 +0100
Message-Id: <20231122130220.10247-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231122130220.10247-1-jgross@suse.com>
References: <20231122130220.10247-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.30
X-Spamd-Result: default: False [-0.30 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[43.21%]
X-Spam-Flag: NO

Add a local .gitignore file for tools/pygrub.

As at least on some systems (e.g. OpenSUSE Leap 15.5) the build will
produce a tools/pygrub/pygrub.egg-info directory, add it to the new
.gitignore file, too.

Use "/dir/" as pattern for ignoring a directory and its contents, as
the "/dir/*" pattern won't ignore the directory itself (git just
doesn't complain when seeing a directory without any not ignored file
in it).

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 .gitignore              | 1 -
 tools/pygrub/.gitignore | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)
 create mode 100644 tools/pygrub/.gitignore

diff --git a/.gitignore b/.gitignore
index 2cea994934..3009545af2 100644
--- a/.gitignore
+++ b/.gitignore
@@ -213,7 +213,6 @@ tools/misc/xencov
 tools/pkg-config/*
 tools/qemu-xen-build
 tools/xentrace/xenalyze
-tools/pygrub/build/*
 tools/python/build/*
 tools/tests/depriv/depriv-fd-checker
 tools/tests/x86_emulator/*.bin
diff --git a/tools/pygrub/.gitignore b/tools/pygrub/.gitignore
new file mode 100644
index 0000000000..4fdf23ed8e
--- /dev/null
+++ b/tools/pygrub/.gitignore
@@ -0,0 +1,2 @@
+/build/
+/pygrub.egg-info/
-- 
2.35.3


