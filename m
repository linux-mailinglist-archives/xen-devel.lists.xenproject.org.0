Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAD1649B41
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 10:35:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459167.716887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fCa-0004JZ-ST; Mon, 12 Dec 2022 09:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459167.716887; Mon, 12 Dec 2022 09:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fCa-0004Ff-Mz; Mon, 12 Dec 2022 09:34:24 +0000
Received: by outflank-mailman (input) for mailman id 459167;
 Mon, 12 Dec 2022 09:34:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p4fCY-0003tm-KU
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 09:34:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fCY-0000oW-Ex; Mon, 12 Dec 2022 09:34:22 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fCY-0000rv-7h; Mon, 12 Dec 2022 09:34:22 +0000
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
	bh=Or7ZWEnr7wyYNrxuahpihixmx7ZXU2xnjY4e99wUaXU=; b=mFbi9eRX2q7G0iEz1UuzoxcgLH
	Ewmk1zK/oJUEiMOfQMafqiXOn2Tscex+zs5uTPCqAvOs0oPNHFrilVrx+iBzTF0uxhXE0rP0t3U5X
	jrPWV/GBdJ67kfpYPTaFDr8BaqYaLP3od4CRN84gHlf92+ZcRb4e92xt8qNyMjtk/XGg=;
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
Subject: [PATCH 7/8] docs/proces: branching-checklist: Update the section "add to patchbot"
Date: Mon, 12 Dec 2022 09:34:09 +0000
Message-Id: <20221212093410.36289-8-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212093410.36289-1-julien@xen.org>
References: <20221212093410.36289-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Make clear the patchbot is accessible from the user "xen" on xenbits.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 docs/process/branching-checklist.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/process/branching-checklist.txt b/docs/process/branching-checklist.txt
index c63952886b50..9f385f137386 100644
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
2.38.1


