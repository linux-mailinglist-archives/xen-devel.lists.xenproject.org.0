Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E0F22115B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 17:42:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvjX5-0006VF-49; Wed, 15 Jul 2020 15:41:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o5qj=A2=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jvjX3-0006V4-AL
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 15:41:17 +0000
X-Inumbo-ID: 9e73d4c8-c6b1-11ea-b7bb-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e73d4c8-c6b1-11ea-b7bb-bc764e2007e4;
 Wed, 15 Jul 2020 15:41:16 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jvjX0-0006HI-Vv; Wed, 15 Jul 2020 16:41:15 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] docs/process/branching-checklist: Get osstest branch right
Date: Wed, 15 Jul 2020 16:41:12 +0100
Message-Id: <20200715154112.4719-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 ian.jackson@eu.citrix.com, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The runes for this manual osstest were wrong.  It needs to run as
osstest, and cr-for-branches should be run from testing.git.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 docs/process/branching-checklist.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/process/branching-checklist.txt b/docs/process/branching-checklist.txt
index e286e65962..0e83272caa 100644
--- a/docs/process/branching-checklist.txt
+++ b/docs/process/branching-checklist.txt
@@ -86,8 +86,8 @@ including turning off debug.
 
 Set off a manual osstest run, since the osstest cr-for-branches change
 will take a while to take effect:
-  ssh osstest.test-lab
-  cd branches/for-xen-$v-testing.git
+  ssh osstest@osstest.test-lab
+  cd testing.git
   screen -S $v
   BRANCHES=xen-$v-testing ./cr-for-branches branches -w "./cr-daily-branch --real"
 
-- 
2.20.1


