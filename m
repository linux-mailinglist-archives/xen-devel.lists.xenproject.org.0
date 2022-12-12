Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 088BD649B47
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 10:35:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459161.716821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fCS-0002eQ-KJ; Mon, 12 Dec 2022 09:34:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459161.716821; Mon, 12 Dec 2022 09:34:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fCS-0002aK-GD; Mon, 12 Dec 2022 09:34:16 +0000
Received: by outflank-mailman (input) for mailman id 459161;
 Mon, 12 Dec 2022 09:34:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p4fCR-0002Nf-2s
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 09:34:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fCQ-0000mY-R3; Mon, 12 Dec 2022 09:34:14 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fCQ-0000rv-IY; Mon, 12 Dec 2022 09:34:14 +0000
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
	bh=kP1xPro9Nujh4ZNXQMchwHc6f62Mvtw9tY6G8ps3cXc=; b=yToWceGtyBU/nSuxgAYrnrzQ8p
	rtX+pKRN/xGOHTjVD1NBX8gc5UX+XRgBGjc6NTWGP2QndV0y5+XNWGx6sMDt1wnBDpJ2PhXF/OTuS
	K4y15U2qqiyUN26v/wkZyfFtK4bWEcF/JMf6p/JPx81khbgs5Avmj73i7cI4KSEDK5Vw=;
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
Subject: [PATCH 1/8] docs/process: branching-checklist: Use consistent indentation
Date: Mon, 12 Dec 2022 09:34:03 +0000
Message-Id: <20221212093410.36289-2-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212093410.36289-1-julien@xen.org>
References: <20221212093410.36289-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

At the moment, branch-checklist.txt is using a mix of soft and hard
tab. They are both meant to be represented using 8 characters.

In Xen we tend to use 4-space softtab represented with 4 characters. So
to avoid  having to use a different editor configuration, switch all
the indentation to 4-space softtab.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 docs/process/branching-checklist.txt | 102 +++++++++++++--------------
 1 file changed, 51 insertions(+), 51 deletions(-)

diff --git a/docs/process/branching-checklist.txt b/docs/process/branching-checklist.txt
index 0e83272caacb..9aac474734c1 100644
--- a/docs/process/branching-checklist.txt
+++ b/docs/process/branching-checklist.txt
@@ -2,78 +2,78 @@ v=4.1
 ov=4.0
 
 * make branch in qemu-iwj.git
-        git-branch $v-testing master
+    git-branch $v-testing master
 
 # make branches in xenbits.xen.org qemus
-        ssh xen@xenbits.xen.org
-	cd ~/git/qemu-xen.git
-	git branch staging-$v staging
-	git branch stable-$v master
-	cd ~/git/qemu-xen-traditional.git
-	git branch stable-$v master
+    ssh xen@xenbits.xen.org
+    cd ~/git/qemu-xen.git
+    git branch staging-$v staging
+    git branch stable-$v master
+    cd ~/git/qemu-xen-traditional.git
+    git branch stable-$v master
 
 # make branch in libvirt
-        ssh xen@xenbits.xen.org
-        cd ~/git/libvirt.git/
-	git branch osstest/frozen/xen-$v-testing   xen-tested-master
+    ssh xen@xenbits.xen.org
+    cd ~/git/libvirt.git/
+    git branch osstest/frozen/xen-$v-testing   xen-tested-master
 
 # make branches in xenbits.xen.org xen.git
-        ssh xen@xenbits.xen.org
-        cd ~/git/xen.git
-	git branch staging-$v staging
-	git branch stable-$v master
+    ssh xen@xenbits.xen.org
+    cd ~/git/xen.git
+    git branch staging-$v staging
+    git branch stable-$v master
 
 # update xendocs@xenbits docs generator to generate new stable branch
 #  docs too. commit to git.
 * make 13:37 <ijc> https://xenbits.xen.org/docs/4.2-testing/ is now live true
 #14:17 <ijc> HOWTO: login to xenbits. become "xendocs" . cd cronjobs . edit
 #            xenbits-docs-all.sh in the obvious way. git commit
-	ssh root@xenbits.xen.org
-	su - xendocs
-	cd cronjobs
-	ed xenbits-docs-all.sh
-	/for branch
-	s/$/ 4.6-testing
-	# ^ OR SIMILAR
-	w
-	q
-        git add -p
-	git commit -m "Branch for $v"
+    ssh root@xenbits.xen.org
+    su - xendocs
+    cd cronjobs
+    ed xenbits-docs-all.sh
+    /for branch
+    s/$/ 4.6-testing
+    # ^ OR SIMILAR
+    w
+    q
+    git add -p
+    git commit -m "Branch for $v"
 
 * make branches etc. in osstest
-        ssh osstest@osstest.test-lab
-	cd testing.git
-	OSSTEST_CONFIG=production-config ./mg-branch-setup xen-$v-testing bisect
-	OSSTEST_CONFIG=production-config ./mg-branch-setup qemu-upstream-$v-testing bisect
+    ssh osstest@osstest.test-lab
+    cd testing.git
+    OSSTEST_CONFIG=production-config ./mg-branch-setup xen-$v-testing bisect
+    OSSTEST_CONFIG=production-config ./mg-branch-setup qemu-upstream-$v-testing bisect
 
 # make branches etc. in Cambridge osstest
-        ssh osstest@osstest.xs.citrite.net
-	cd testing.git
-	OSSTEST_CONFIG=production-config-cambridge ./mg-branch-setup xen-$v-testing bisect
-	OSSTEST_CONFIG=production-config-cambridge ./mg-branch-setup qemu-upstream-$v-testing bisect
+    ssh osstest@osstest.xs.citrite.net
+    cd testing.git
+    OSSTEST_CONFIG=production-config-cambridge ./mg-branch-setup xen-$v-testing bisect
+    OSSTEST_CONFIG=production-config-cambridge ./mg-branch-setup qemu-upstream-$v-testing bisect
 
 * add branch to osstest
-        ie add both eg qemu-upstream-4.2-testing and xen-4.2-testing to BRANCHES in cr-for-branches
+    ie add both eg qemu-upstream-4.2-testing and xen-4.2-testing to BRANCHES in cr-for-branches
 
 * add to patchbot
-        on xenbits
-        cd ~/HG/patchbot/
+    on xenbits
+    cd ~/HG/patchbot/
 
-	cp xen--master.patchbot-reported-heads xen--stable-$v.patchbot-reported-heads
-	cp xen--staging.patchbot-reported-heads xen--staging-$v.patchbot-reported-heads
-        cp qemu-xen--master.patchbot-reported-heads  qemu-xen--stable-$v.patchbot-reported-heads
-        cp qemu-xen--staging.patchbot-reported-heads  qemu-xen--staging-$v.patchbot-reported-heads
-        cp qemu-xen-traditional--master.patchbot-reported-heads qemu-xen-traditional--stable-$v.patchbot-reported-heads
+    cp xen--master.patchbot-reported-heads xen--stable-$v.patchbot-reported-heads
+    cp xen--staging.patchbot-reported-heads xen--staging-$v.patchbot-reported-heads
+    cp qemu-xen--master.patchbot-reported-heads  qemu-xen--stable-$v.patchbot-reported-heads
+    cp qemu-xen--staging.patchbot-reported-heads  qemu-xen--staging-$v.patchbot-reported-heads
+    cp qemu-xen-traditional--master.patchbot-reported-heads qemu-xen-traditional--stable-$v.patchbot-reported-heads
 
-        #emacs versions
-	perl -i~ -pe 'next unless m/\b\Q'$ov'\E\b/; $x=$_; $x=~ s/\b\Q'$ov'\E\b/'$v'/g; print $x;' versions
-        git diff
-	git add versions
-	git commit -m "Branch for $v"
+    #emacs versions
+    perl -i~ -pe 'next unless m/\b\Q'$ov'\E\b/; $x=$_; $x=~ s/\b\Q'$ov'\E\b/'$v'/g; print $x;' versions
+    git diff
+    git add versions
+    git commit -m "Branch for $v"
 
 Ensure references to qemu trees in xen.git's Config.mk are updated.
 Check this with
-        grep unstable Config.mk 
+    grep unstable Config.mk
 which should produce no output.  Replace as necessary.
 (There may well be none.)
 
@@ -86,9 +86,9 @@ including turning off debug.
 
 Set off a manual osstest run, since the osstest cr-for-branches change
 will take a while to take effect:
-  ssh osstest@osstest.test-lab
-  cd testing.git
-  screen -S $v
-  BRANCHES=xen-$v-testing ./cr-for-branches branches -w "./cr-daily-branch --real"
+    ssh osstest@osstest.test-lab
+    cd testing.git
+    screen -S $v
+    BRANCHES=xen-$v-testing ./cr-for-branches branches -w "./cr-daily-branch --real"
 
 Send message to committers and RM.  Use previous mail as a template.
-- 
2.38.1


