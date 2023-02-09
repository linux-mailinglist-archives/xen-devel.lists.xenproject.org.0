Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43363690F30
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 18:28:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492821.762578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQAij-00056H-8N; Thu, 09 Feb 2023 17:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492821.762578; Thu, 09 Feb 2023 17:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQAij-0004yZ-3o; Thu, 09 Feb 2023 17:28:29 +0000
Received: by outflank-mailman (input) for mailman id 492821;
 Thu, 09 Feb 2023 17:28:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQAii-0004ud-AU
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 17:28:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQAih-0003S4-To; Thu, 09 Feb 2023 17:28:27 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQAih-0002Aq-Lt; Thu, 09 Feb 2023 17:28:27 +0000
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
	bh=s5BFpJN+RHpTf1V7aOw2lLRr1sJNG3mQ0d/1DqAPibY=; b=6znmKaCsqyOpsSL5zpLyKkXjnz
	D/YPqiohE+1ZFbTRSAFZxFhSCp9LviR7ej5L895UMC7ER4JU4c1vVR/CgiSoMOjATc80RSnBHhzLf
	9R1gGqr4eCgOxGz8L9HJVmNRtEU9vhVjfGEYZ/e6G4Zmuh6+TN6e0dGo/716O3aoyUmo=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 3/4] docs/proces: branching-checklist: Update the section "add to patchbot"
Date: Thu,  9 Feb 2023 17:28:19 +0000
Message-Id: <20230209172820.56292-4-julien@xen.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209172820.56292-1-julien@xen.org>
References: <20230209172820.56292-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Make clear the patchbot is accessible from the user "xen" on xenbits.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Acked-by: George Dunlap <george.dunlap@citrix.com>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>

---
    Changes in v2:
        - Add Henry's reviewed-by
        - Add George's acked-by
---
 docs/process/branching-checklist.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/process/branching-checklist.txt b/docs/process/branching-checklist.txt
index 6fd1ab334185..6710cc234034 100644
--- a/docs/process/branching-checklist.txt
+++ b/docs/process/branching-checklist.txt
@@ -48,7 +48,7 @@ ov=4.0
     git commit -m "cr-for-branches: Add Xen and QEMU $v branch"
 
 * add to patchbot
-    on xenbits
+    ssh xen@xenbits.xen.org
     cd ~/HG/patchbot/
 
     cp xen--master.patchbot-reported-heads xen--stable-$v.patchbot-reported-heads
-- 
2.39.1


