Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C34F24A3531
	for <lists+xen-devel@lfdr.de>; Sun, 30 Jan 2022 09:43:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262413.454627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nE5nB-0006ZV-AO; Sun, 30 Jan 2022 08:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262413.454627; Sun, 30 Jan 2022 08:42:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nE5nB-0006XG-7a; Sun, 30 Jan 2022 08:42:37 +0000
Received: by outflank-mailman (input) for mailman id 262413;
 Sun, 30 Jan 2022 08:42:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KjUP=SO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nE5nA-0006XA-3e
 for xen-devel@lists.xenproject.org; Sun, 30 Jan 2022 08:42:36 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9164a2a3-81a8-11ec-8f75-fffcc8bd4f1a;
 Sun, 30 Jan 2022 09:42:34 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 22B5A1F37D;
 Sun, 30 Jan 2022 08:42:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CA80613638;
 Sun, 30 Jan 2022 08:42:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Xe2bL3hP9mF5RAAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 30 Jan 2022 08:42:32 +0000
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
X-Inumbo-ID: 9164a2a3-81a8-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1643532153; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0WD6MM0xV2jrKWDydcV9HlIP7ns73FO4UxZvrDTTYJU=;
	b=rRmJ3QBbRgkkbwG7dTYg1gB+rk+yX6d80MFs7ME83Kg8DkrH+zgO2LQg+HI1e2SnQo7N48
	u6zD5wbC4oZuhf2oXIlsZ09YuVuqd1URkcNemSz0V6UWh57oyM2cAiOBp6/7LfuZCXnPMW
	4AhPGECt5Vfmn55aBBm0ACPRfJZkkkQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] gitignore: remove stale entries
Date: Sun, 30 Jan 2022 09:42:31 +0100
Message-Id: <20220130084231.18896-1-jgross@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The entries referring to tools/security have become stale more than
10 years ago. Remove them.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 .gitignore | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/.gitignore b/.gitignore
index 3f9d55ba87..1f53b0320e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -252,9 +252,6 @@ tools/qemu-xen-build
 tools/xentrace/xenalyze
 tools/pygrub/build/*
 tools/python/build/*
-tools/security/secpol_tool
-tools/security/xen/*
-tools/security/xensec_tool
 tools/tests/depriv/depriv-fd-checker
 tools/tests/x86_emulator/*.bin
 tools/tests/x86_emulator/*.tmp
-- 
2.31.1


