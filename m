Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC47945A940
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 17:51:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229787.397317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpZ0U-0004oU-TU; Tue, 23 Nov 2021 16:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229787.397317; Tue, 23 Nov 2021 16:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpZ0U-0004iK-NP; Tue, 23 Nov 2021 16:50:58 +0000
Received: by outflank-mailman (input) for mailman id 229787;
 Tue, 23 Nov 2021 16:50:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mpZ0S-0004O9-Or
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 16:50:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mpZ0S-0007z2-O5
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 16:50:56 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mpZ0S-0000Sp-Me
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 16:50:56 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mpZ0Q-00073B-6g; Tue, 23 Nov 2021 16:50:54 +0000
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
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=a+220sNw/iXmKHTJi7clWGP7YO3dOLIRBoh7wrJHBXQ=; b=hQzb3CNocZMH1qs5EHmLN7YQz2
	UlpIl9Xxh8rDtOvAJ/Z/oPagqmKNPGeJwjaDJsVhiazKf6DkaS8lD8GGvR5SzD6XLmGtW2F0kMxdz
	NsnUDzJMZ74QSQCzFnhyFhmfgK2nXoti/d4MqPgYuDCDSWn8qMUKKrU2WhhuXp4cSjDA=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH for-4.16 2/3] SUPPORT.md: Set Release Notes link
Date: Tue, 23 Nov 2021 16:50:43 +0000
Message-Id: <20211123165044.29546-3-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211123165044.29546-1-iwj@xenproject.org>
References: <20211123165044.29546-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 SUPPORT.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 3a34933c89..b1367e2b22 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -9,13 +9,13 @@ for the definitions of the support status levels etc.
 
 # Release Support
 
-    Xen-Version: unstable
+    Xen-Version: 4.16
     Initial-Release: n/a
     Supported-Until: TBD
     Security-Support-Until: Unreleased - not yet security-supported
 
 Release Notes
-: <a href="https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes">RN</a>
+: <a href="https://wiki.xenproject.org/wiki/Xen_Project_4.16_Release_Notes">RN</a>
 
 # Feature Support
 
-- 
2.20.1


