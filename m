Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E77339E5D
	for <lists+xen-devel@lfdr.de>; Sat, 13 Mar 2021 14:55:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97535.185298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lL4jS-0000d8-Ul; Sat, 13 Mar 2021 13:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97535.185298; Sat, 13 Mar 2021 13:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lL4jS-0000cj-RY; Sat, 13 Mar 2021 13:55:06 +0000
Received: by outflank-mailman (input) for mailman id 97535;
 Sat, 13 Mar 2021 13:55:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lL4jR-0000ce-36
 for xen-devel@lists.xenproject.org; Sat, 13 Mar 2021 13:55:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lL4jP-0003iA-VZ; Sat, 13 Mar 2021 13:55:03 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lL4jP-00019l-IB; Sat, 13 Mar 2021 13:55:03 +0000
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
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=pyaEz+9r3V6Dmziv7KgafVXgAmmD28nJLcQLfSvsft4=; b=hX8WnHCjuNYixNKROPZHFSQZls
	NM9HuV3fIYZbdOQHT2GbGeRHohCH2pTl4tyh717jcuTrPazGecynVhakSCKJyPXWoC54eMlKvyNLR
	Bq/PG7TfRLMSlCj3sAcJRfDd6Wmv63P9A7cG2hYKvcvyxMyE8hG0VE9TWRW5Z0vbeEjM=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.15] SUPPORT.MD: Mark C XenStored LiveUpdate as Tech Preview
Date: Sat, 13 Mar 2021 13:55:00 +0000
Message-Id: <20210313135500.27241-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Support to liveupdate C XenStored was adding during the 4.15
development cycle. Add a section in SUPPORT.MD to explain what is the
support state.

For now, it is a tech preview.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

CC: Juergen Gross <jgross@suse.com>

It looks like the OCaml side was not merged in 4.15. So I have only
described the support state for C XenStored.
---
 SUPPORT.md | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index 7db4568f1a0f..39855f2c7b32 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -177,6 +177,10 @@ Support for running qemu-xen device model in a linux stubdomain.
 
     Status: Tech Preview
 
+## C XenStored LiveUpdate
+
+    Status: Tech Preview
+
 ## Toolstack/3rd party
 
 ### libvirt driver for xl
-- 
2.17.1


