Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2312446321C
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 12:16:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235035.407819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms17e-00054q-1b; Tue, 30 Nov 2021 11:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235035.407819; Tue, 30 Nov 2021 11:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms17d-00052Y-Tl; Tue, 30 Nov 2021 11:16:29 +0000
Received: by outflank-mailman (input) for mailman id 235035;
 Tue, 30 Nov 2021 11:16:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1ms17c-00052O-GQ
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 11:16:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1ms17c-0002TT-Ee
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 11:16:28 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1ms17c-00030v-Cy
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 11:16:28 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1ms17a-0001IF-AG; Tue, 30 Nov 2021 11:16:26 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=4nWf7wNA6mtOavsU3HdJwAQqo4+45MLRwyKnscohzts=; b=LzP3cBkrthbHqpGlAgZ5Brqkbs
	vk3UmUSsj3RBEhbKlxj7H4yZzXxHfFKTDMpku1pRU2KlSbA4lN5b5RkvACnXynZwxvxgDLKGEr9Ep
	VvESqRuOIGGn+LDySG0nPiollta0jtWkbHqhH3O5NKSumPQkZ/u7DU5fMYvj6Bc093vE=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Community Manager <community.manager@xenproject.org>,
	security@xenproject.org
Subject: [PATCH for-4.16] SUPPORT.md: Define support lifetime
Date: Tue, 30 Nov 2021 11:16:17 +0000
Message-Id: <20211130111617.14925-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 SUPPORT.md | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index b1367e2b22..85726102ea 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -10,9 +10,9 @@ for the definitions of the support status levels etc.
 # Release Support
 
     Xen-Version: 4.16
-    Initial-Release: n/a
-    Supported-Until: TBD
-    Security-Support-Until: Unreleased - not yet security-supported
+    Initial-Release: 2021-12-02
+    Supported-Until: 2023-06-02
+    Security-Support-Until: 2024-12-02
 
 Release Notes
 : <a href="https://wiki.xenproject.org/wiki/Xen_Project_4.16_Release_Notes">RN</a>
-- 
2.20.1


