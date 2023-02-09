Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDD4690F32
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 18:28:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492822.762592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQAil-0005W4-KX; Thu, 09 Feb 2023 17:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492822.762592; Thu, 09 Feb 2023 17:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQAil-0005TW-DE; Thu, 09 Feb 2023 17:28:31 +0000
Received: by outflank-mailman (input) for mailman id 492822;
 Thu, 09 Feb 2023 17:28:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQAij-0005Dp-FH
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 17:28:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQAij-0003SO-9x; Thu, 09 Feb 2023 17:28:29 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQAij-0002Aq-1u; Thu, 09 Feb 2023 17:28:29 +0000
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
	bh=sCrD4nFlt1u+rYJPMeoIkTrye/Mk1XafmA3Bnu04F/4=; b=roQiV/9gN6CK1Uc2GOGhyIqJpp
	w6XF2pHIvm98kUyGYFEnXm8Z/5LY+BE4RvgTbdCwSVhzhfLfW29xFtcuRfCEtFmG0arQqYhI8kJ7d
	G09xg5pJ7e9WOo3F5rZ/GfL93Fh38OspSnSGIH4mcHqeyrIvo51zk/hlUjCGzeluXdWk=;
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
Subject: [PATCH v2 4/4] docs/process: branching-checklist: Add a list of accounts at the beginning
Date: Thu,  9 Feb 2023 17:28:20 +0000
Message-Id: <20230209172820.56292-5-julien@xen.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209172820.56292-1-julien@xen.org>
References: <20230209172820.56292-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The checklist requires to have access to several accounts on both
xenbits and osstest. List those accounts at the beginning of the file
so it is easier to check if one has the permissions before starting
the branching process.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>

---
    Changes in v2:
        - Add Henry's reviewed-by
---
 docs/process/branching-checklist.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/docs/process/branching-checklist.txt b/docs/process/branching-checklist.txt
index 6710cc234034..3dfa8ec2570b 100644
--- a/docs/process/branching-checklist.txt
+++ b/docs/process/branching-checklist.txt
@@ -1,3 +1,11 @@
+=== Before starting ===
+
+Access to the following accounts is necessary:
+    * xenbits.xen.org: xen, xendocs
+    * osstest.osstest-test-lab: osstest
+
+=== Check list ===
+
 v=4.1
 ov=4.0
 
-- 
2.39.1


