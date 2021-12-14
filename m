Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3C147459F
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 15:53:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246802.425619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx9As-0001An-Cb; Tue, 14 Dec 2021 14:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246802.425619; Tue, 14 Dec 2021 14:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx9As-000181-94; Tue, 14 Dec 2021 14:53:02 +0000
Received: by outflank-mailman (input) for mailman id 246802;
 Tue, 14 Dec 2021 14:53:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mx9Ar-00017o-1C
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 14:53:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mx9Aq-0001eh-W2
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 14:53:00 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mx9Aq-0006se-Uw
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 14:53:00 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mx9AU-00022D-Ae; Tue, 14 Dec 2021 14:52:38 +0000
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
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=bQCwcqRFVfQqb2XI4XqFeSRt/U/1Sd9ionlY70addAk=; b=ZERjAsUqGH945CWig1FxB9Lsm5
	ah51ZJCl7RruubkVvFa1/8e/ZMccF/qND0LNq9X4E3xrWCpycSir1KZUSqNpUjyhQvtCETE17RzUG
	we9UR8O8zpOUvOmcuFUGhXvWmbsyvJ9SIEAOvi36oQw0XTstcONS9oIdgh8Um7sDbcX0=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 2/2] daily-cron-email-real-*: Temporarily drop osstest-admin
Date: Tue, 14 Dec 2021 14:52:26 +0000
Message-Id: <20211214145226.2248-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211214145226.2248-1-iwj@xenproject.org>
References: <20211214145226.2248-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Roger has agreed to take on osstest admin for the moment.  Someone who
intents to take on the role long term will probably want to get CC's
of these flight reports, but it's fairly noisy.  So for now, send them
only to the lists.

CC: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 daily-cron-email-real                | 3 +--
 daily-cron-email-real-bisectcomplete | 3 +--
 daily-cron-email-real-bisectdone     | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/daily-cron-email-real b/daily-cron-email-real
index a52fe680c..743074c60 100644
--- a/daily-cron-email-real
+++ b/daily-cron-email-real
@@ -1,3 +1,2 @@
-To: xen-devel@lists.xenproject.org,
-    osstest-admin@xenproject.org
+To: xen-devel@lists.xenproject.org
 Bcc: osstest-output@lists.xenproject.org
diff --git a/daily-cron-email-real-bisectcomplete b/daily-cron-email-real-bisectcomplete
index a52fe680c..743074c60 100644
--- a/daily-cron-email-real-bisectcomplete
+++ b/daily-cron-email-real-bisectcomplete
@@ -1,3 +1,2 @@
-To: xen-devel@lists.xenproject.org,
-    osstest-admin@xenproject.org
+To: xen-devel@lists.xenproject.org
 Bcc: osstest-output@lists.xenproject.org
diff --git a/daily-cron-email-real-bisectdone b/daily-cron-email-real-bisectdone
index 50dc9cde3..1eb6909c6 100644
--- a/daily-cron-email-real-bisectdone
+++ b/daily-cron-email-real-bisectdone
@@ -1,2 +1 @@
-To: osstest-admin@xenproject.org
-Bcc: osstest-output@lists.xenproject.org
+To: osstest-output@lists.xenproject.org
-- 
2.20.1


