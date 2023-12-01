Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F32580130B
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 19:47:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645647.1007858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r98Y6-0007Ej-Kr; Fri, 01 Dec 2023 18:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645647.1007858; Fri, 01 Dec 2023 18:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r98Y6-0007CK-I9; Fri, 01 Dec 2023 18:47:38 +0000
Received: by outflank-mailman (input) for mailman id 645647;
 Fri, 01 Dec 2023 18:47:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r98Y5-0007CE-7b
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 18:47:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r98Y4-00062A-SO; Fri, 01 Dec 2023 18:47:36 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r98Y4-0000Np-Hr; Fri, 01 Dec 2023 18:47:36 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=ndxVU3EWahiDQSPaDNSsgeLeNuG+m3VG8dgm4KveLBw=; b=grs4Uq
	RPBPjd0ayV8k4tc21JHaNE4tIi4aOVXx4F/iwEp7AmDrEAOEyupLc1Mj/bR03WCZtXy89YliIjK1N
	/lVTNLS1NBhwQKlJnOTb156qgZ03zlkTd5vYYPF4XRPHiTUW0aEcKvOfHrhTex8o0f3toRQdsq8J/
	Lcp/Hsa3cc0=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] CODING_STYLE: Add a section of the naming convention
Date: Fri,  1 Dec 2023 18:47:28 +0000
Message-Id: <20231201184728.31766-1-julien@xen.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Several maintainers have expressed a stronger preference
to use '-' when in filename and option that contains multiple
words.

So document it in CODING_STYLE.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 CODING_STYLE | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/CODING_STYLE b/CODING_STYLE
index ced3ade5a6fb..afd09177745b 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -144,6 +144,15 @@ separate lines and each line should begin with a leading '*'.
  * Note beginning and end markers on separate lines and leading '*'.
  */
 
+Naming convention
+-----------------
+
+When command line option or filename contain multiple words, a '-'
+should be to separate them. E.g. 'timer-works'.
+
+Note that some of the option and filename are using '_'. This is now
+deprecated.
+
 Emacs local variables
 ---------------------
 
-- 
2.40.1


