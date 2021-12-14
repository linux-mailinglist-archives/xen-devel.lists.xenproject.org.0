Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B08CA47459D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 15:53:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246803.425625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx9As-0001DP-KV; Tue, 14 Dec 2021 14:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246803.425625; Tue, 14 Dec 2021 14:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx9As-0001Ai-GM; Tue, 14 Dec 2021 14:53:02 +0000
Received: by outflank-mailman (input) for mailman id 246803;
 Tue, 14 Dec 2021 14:53:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mx9Ar-00017n-1C
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 14:53:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mx9Aq-0001ef-Vh
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 14:53:00 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mx9Aq-0006sd-Uc
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 14:53:00 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mx9AU-00022D-1i; Tue, 14 Dec 2021 14:52:38 +0000
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
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From;
	bh=sL/tFxUW5cMsBZucpfT8NrbTO2W9KHagvOGWHLKC/Pg=; b=cU5bjWUykB2Mkw4mtiZ7sst4SA
	pS7kKlxxXPM9/odW3nJ5DSlvE02Pugfz8R6Escnf8oPVVckRPDhQxE1DxP8NdHF+7bwqngOpTFqdb
	dOk5sK6Kr3id7V1Qa3Hp6vrbmHi3RSHeUxXqCQ/IRGmZe4/LlCOg1Fwe5RX9xdWUmYj0=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 1/2] daily-cron-email-{play,adhoc}-*: Drop Citrix email
Date: Tue, 14 Dec 2021 14:52:25 +0000
Message-Id: <20211214145226.2248-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Any such adhoc flights run from cron should be reported to
osstest-admin, not my (soon to be deleted) Citrix adddress.

Now the only remaining occurrences are
  - examples
  - authorship annotation of the init script
  - crontab-cambridge, which would need updating

CC: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 daily-cron-email-adhoc                | 2 +-
 daily-cron-email-adhoc-bisectcomplete | 2 +-
 daily-cron-email-adhoc-bisectdone     | 2 +-
 daily-cron-email-adhoc-bisectrun      | 2 +-
 daily-cron-email-play                 | 2 +-
 daily-cron-email-play-bisectcomplete  | 2 +-
 daily-cron-email-play-bisectdone      | 2 +-
 daily-cron-email-play-bisectrun       | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/daily-cron-email-adhoc b/daily-cron-email-adhoc
index d2028d928..d67754523 100644
--- a/daily-cron-email-adhoc
+++ b/daily-cron-email-adhoc
@@ -1 +1 @@
-To: ian.jackson@eu.citrix.com
+To: osstest-admin@xenproject.org
diff --git a/daily-cron-email-adhoc-bisectcomplete b/daily-cron-email-adhoc-bisectcomplete
index d2028d928..d67754523 100644
--- a/daily-cron-email-adhoc-bisectcomplete
+++ b/daily-cron-email-adhoc-bisectcomplete
@@ -1 +1 @@
-To: ian.jackson@eu.citrix.com
+To: osstest-admin@xenproject.org
diff --git a/daily-cron-email-adhoc-bisectdone b/daily-cron-email-adhoc-bisectdone
index d2028d928..d67754523 100644
--- a/daily-cron-email-adhoc-bisectdone
+++ b/daily-cron-email-adhoc-bisectdone
@@ -1 +1 @@
-To: ian.jackson@eu.citrix.com
+To: osstest-admin@xenproject.org
diff --git a/daily-cron-email-adhoc-bisectrun b/daily-cron-email-adhoc-bisectrun
index d2028d928..d67754523 100644
--- a/daily-cron-email-adhoc-bisectrun
+++ b/daily-cron-email-adhoc-bisectrun
@@ -1 +1 @@
-To: ian.jackson@eu.citrix.com
+To: osstest-admin@xenproject.org
diff --git a/daily-cron-email-play b/daily-cron-email-play
index d2028d928..d67754523 100644
--- a/daily-cron-email-play
+++ b/daily-cron-email-play
@@ -1 +1 @@
-To: ian.jackson@eu.citrix.com
+To: osstest-admin@xenproject.org
diff --git a/daily-cron-email-play-bisectcomplete b/daily-cron-email-play-bisectcomplete
index d2028d928..d67754523 100644
--- a/daily-cron-email-play-bisectcomplete
+++ b/daily-cron-email-play-bisectcomplete
@@ -1 +1 @@
-To: ian.jackson@eu.citrix.com
+To: osstest-admin@xenproject.org
diff --git a/daily-cron-email-play-bisectdone b/daily-cron-email-play-bisectdone
index d2028d928..d67754523 100644
--- a/daily-cron-email-play-bisectdone
+++ b/daily-cron-email-play-bisectdone
@@ -1 +1 @@
-To: ian.jackson@eu.citrix.com
+To: osstest-admin@xenproject.org
diff --git a/daily-cron-email-play-bisectrun b/daily-cron-email-play-bisectrun
index d2028d928..d67754523 100644
--- a/daily-cron-email-play-bisectrun
+++ b/daily-cron-email-play-bisectrun
@@ -1 +1 @@
-To: ian.jackson@eu.citrix.com
+To: osstest-admin@xenproject.org
-- 
2.20.1


