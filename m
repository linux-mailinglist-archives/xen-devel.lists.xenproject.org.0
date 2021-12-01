Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1325D4654CD
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 19:11:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236165.409632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msU4C-0006tU-39; Wed, 01 Dec 2021 18:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236165.409632; Wed, 01 Dec 2021 18:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msU4B-0006rh-VM; Wed, 01 Dec 2021 18:10:51 +0000
Received: by outflank-mailman (input) for mailman id 236165;
 Wed, 01 Dec 2021 18:10:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1msU4A-0006rb-20
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 18:10:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1msU49-0001Ya-Vj
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 18:10:49 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1msU49-0003wU-UZ
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 18:10:49 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1msU48-0007ir-3N; Wed, 01 Dec 2021 18:10:48 +0000
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
	d=xenproject.org; s=20200302mail; h=Subject:CC:To:Date:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=3iXUvNUvexIGQzvOlHI3bA60yLfZhmNzLyIcSpjub0M=; b=hio7nBOYYgyYmaBnvC1pnDV71p
	++LWQphhfLHZoW2u7ArMO3e/Q5oLpFW77mbdAKKJmJQr9ZVm1DfKQSH9rAwJKd0sip76PX+PWRo6b
	F5EMPQORlvQ+QeYX51GzJ0R7bLsS/PDyiW0rwFkzXRNwc9g48AXqcGhNmgtzZ7ozsps4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24999.47783.66521.232381@mariner.uk.xensource.com>
Date: Wed, 1 Dec 2021 18:10:47 +0000
To: xen-devel@lists.xenproject.org
CC: Community Manager <community.manager@xenproject.org>
Subject: [PATCH] CHANGELOG.md: Start new "unstable" section

I'm committing this now, along with the forward-ports mentioned.  I
think this is mechanical release technician stuff, so I don't feel the
need for an ack.

Ian.

From 6c1c97e24f830a921a23e3b9694e20493c9986ee Mon Sep 17 00:00:00 2001
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Community Manager <community.manager@xenproject.org>
Date: Wed, 1 Dec 2021 18:07:40 +0000
Subject: [PATCH] CHANGELOG.md: Start new "unstable" section

I have just forward-ported the CHANGELOG.md updates from the
stable-4.16 branch.  But we need a new section for work in this
release cycle.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 731db3590e..6c0cd88cdf 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -4,6 +4,8 @@ Notable changes to Xen will be documented in this file.
 
 The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
+## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
+
 ## [4.16.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - 2021-12-02
 
 ### Removed
-- 
2.20.1


