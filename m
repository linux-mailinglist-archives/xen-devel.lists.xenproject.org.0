Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA785690F2F
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 18:28:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492820.762571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQAii-0004y4-RY; Thu, 09 Feb 2023 17:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492820.762571; Thu, 09 Feb 2023 17:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQAii-0004ut-NR; Thu, 09 Feb 2023 17:28:28 +0000
Received: by outflank-mailman (input) for mailman id 492820;
 Thu, 09 Feb 2023 17:28:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQAig-0004eR-Nd
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 17:28:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQAig-0003Ro-Hd; Thu, 09 Feb 2023 17:28:26 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQAig-0002Aq-9f; Thu, 09 Feb 2023 17:28:26 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=w4iF+gTE5wQfDiL31rxrejwQ7YJE6MtJmOBI/C4iJE4=; b=d0yEGQCjQY9XR9bpJlK8u8K1qu
	CM9SeXL3vZ8lU8QeDb+l5yCRF92kFr4uycD9NMDeAPPPljZ0KMkHfOhJwhRkH3f/ahLlGB597eLNv
	9idfH+0QFwZAWyEYSBIY0CuFjckLhHUs91oW1ZmAUlhxeA/C/Ik5nzGV3KQRaTMZbCM4=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@cloud.com>
Subject: [PATCH v2 2/4] docs/process: branching-checklist: Remove section about the cambridge colo
Date: Thu,  9 Feb 2023 17:28:18 +0000
Message-Id: <20230209172820.56292-3-julien@xen.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209172820.56292-1-julien@xen.org>
References: <20230209172820.56292-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The cambridge colo was internal to Citrix (now Cloud) and hasn't been used
by the community for a while.

So remove the section.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Acked-by: George Dunlap <george.dunlap@cloud.com>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>

---
    Changes in v2:
        - Add George's acked-by
        - Add Henry's reviewed-by
---
 docs/process/branching-checklist.txt | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/docs/process/branching-checklist.txt b/docs/process/branching-checklist.txt
index 7c4c107c250c..6fd1ab334185 100644
--- a/docs/process/branching-checklist.txt
+++ b/docs/process/branching-checklist.txt
@@ -42,12 +42,6 @@ ov=4.0
     OSSTEST_CONFIG=production-config ./mg-branch-setup xen-$v-testing bisect
     OSSTEST_CONFIG=production-config ./mg-branch-setup qemu-upstream-$v-testing bisect
 
-# make branches etc. in Cambridge osstest
-    ssh osstest@osstest.xs.citrite.net
-    cd testing.git
-    OSSTEST_CONFIG=production-config-cambridge ./mg-branch-setup xen-$v-testing bisect
-    OSSTEST_CONFIG=production-config-cambridge ./mg-branch-setup qemu-upstream-$v-testing bisect
-
 * add branch to osstest
     Add both qemu-upstream-$v-testing and xen-$v-testing to BRANCHES in cr-for-branches
     git add -p
-- 
2.39.1


