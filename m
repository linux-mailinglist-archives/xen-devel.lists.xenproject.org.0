Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8028F39E012
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 17:16:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138035.255627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqGzA-0005CP-G0; Mon, 07 Jun 2021 15:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138035.255627; Mon, 07 Jun 2021 15:16:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqGzA-00059v-Cc; Mon, 07 Jun 2021 15:16:16 +0000
Received: by outflank-mailman (input) for mailman id 138035;
 Mon, 07 Jun 2021 15:16:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lqGz8-00059p-H1
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 15:16:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lqGz8-0002aJ-Dx
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 15:16:14 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lqGz8-0001jO-Cq
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 15:16:14 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1lqGz6-0000hp-JN; Mon, 07 Jun 2021 16:16:12 +0100
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
	bh=q/shnmVfKFQNYWEaQ8lptlXmoYPWwShZ0Rr21VZgANM=; b=nTkQkHBkbNxvsoTNrhiZaH+jXd
	tmtkeFFbMOcX/xF7zvzUJ/dHCIoKFTLs8PfWz0mJmWj2I4dqjvof+djtWYgKCmX7eTfl4HBNlZf7r
	yYgVNoWS82tEbnHlItC7GvdSJVZXhOr3kC6lJp4sKqvBYgYHL+8+250exDq3UdvbJ1j4=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [OSSTEST PATCH] ts-xen-build-prep: Install figlet
Date: Mon,  7 Jun 2021 16:16:01 +0100
Message-Id: <20210607151601.14049-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 ts-xen-build-prep | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ts-xen-build-prep b/ts-xen-build-prep
index 5ec70dd5..67b3eae6 100755
--- a/ts-xen-build-prep
+++ b/ts-xen-build-prep
@@ -197,7 +197,7 @@ END
 }
 
 sub prep () {
-    my @packages = qw(mercurial rsync
+    my @packages = qw(mercurial rsync figlet
                       build-essential bin86 bcc iasl bc
                       flex bison cmake ninja-build
                       libpci-dev libncurses5-dev libssl-dev python-dev
-- 
2.20.1


