Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E499E792B
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 20:41:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.850461.1264901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJeBj-0003eq-TH; Fri, 06 Dec 2024 19:40:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 850461.1264901; Fri, 06 Dec 2024 19:40:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJeBj-0003cA-Qg; Fri, 06 Dec 2024 19:40:31 +0000
Received: by outflank-mailman (input) for mailman id 850461;
 Fri, 06 Dec 2024 19:40:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tJeBi-0003CK-CK
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 19:40:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tJeBh-007AQt-3A;
 Fri, 06 Dec 2024 19:40:30 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tJeBi-0034Np-02;
 Fri, 06 Dec 2024 19:40:30 +0000
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
	bh=gm627I+Am5o4i2sMn6yJhycalKKIFzp8/ayRvTb16zU=; b=DPHjrIe27p4eJs/PmpicXlzUIe
	Hiq4+j7QMeTXM/AVuj+pX2gcxl5SNdXgMoyAOIqinPr4njTpl1FtzPwB4GUxs9TaFw8S1o8ODLHXR
	4enZYwgBfOsxMxXepIDUJdVrgGdjKcc0BUOCNKktqv+IuIfkUGDQFelJYbJwYSco/K4M=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.20 2/2] docs/process: branching-checklist: Remove any reference to OSSTest
Date: Fri,  6 Dec 2024 19:40:25 +0000
Message-Id: <20241206194025.31662-3-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241206194025.31662-1-julien@xen.org>
References: <20241206194025.31662-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

OSSTest was turned off a few weeks ago. So we don't need any steps
related to OSSTest when branching off to a new Xen version.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

Do we need any specific steps for gitlab CI?
---
 docs/process/branching-checklist.txt | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/docs/process/branching-checklist.txt b/docs/process/branching-checklist.txt
index 372d7268d20a..582bc86d6a67 100644
--- a/docs/process/branching-checklist.txt
+++ b/docs/process/branching-checklist.txt
@@ -2,7 +2,6 @@
 
 Access to the following accounts is necessary:
     * xenbits.xen.org: xen, xendocs
-    * osstest.osstest-test-lab: osstest
 
 === Check list ===
 
@@ -17,11 +16,6 @@ ov=4.0
     cd ~/git/qemu-xen-traditional.git
     git branch stable-$v master
 
-# make branch in libvirt
-    ssh xen@xenbits.xen.org
-    cd ~/git/libvirt.git/
-    git branch osstest/frozen/xen-$v-testing   xen-tested-master
-
 # make branches in xenbits.xen.org xen.git
     ssh xen@xenbits.xen.org
     cd ~/git/xen.git
@@ -43,17 +37,6 @@ ov=4.0
     git add -p
     git commit -m "Branch for $v"
 
-* make branches etc. in osstest
-    ssh osstest@osstest.test-lab
-    cd testing.git
-    OSSTEST_CONFIG=production-config ./mg-branch-setup xen-$v-testing bisect
-    OSSTEST_CONFIG=production-config ./mg-branch-setup qemu-upstream-$v-testing bisect
-
-* add branch to osstest
-    Add both qemu-upstream-$v-testing and xen-$v-testing to BRANCHES in cr-for-branches
-    git add -p
-    git commit -m "cr-for-branches: Add Xen and QEMU $v branch"
-
 * add to patchbot
     ssh xen@xenbits.xen.org
     cd ~/HG/patchbot/
@@ -84,11 +67,4 @@ Update newly diverging staging-$v according to
 release-technician-checklist.txt section re README etc.,
 including turning off debug.
 
-Set off a manual osstest run, since the osstest cr-for-branches change
-will take a while to take effect:
-    ssh osstest@osstest.test-lab
-    cd testing.git
-    screen -S $v
-    BRANCHES=xen-$v-testing ./cr-for-branches branches -w "./cr-daily-branch --real"
-
 Send message to committers and RM.  Use previous mail as a template.
-- 
2.40.1


