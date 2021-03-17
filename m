Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBA233EF8F
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 12:28:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98655.187223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMUL9-0002eI-29; Wed, 17 Mar 2021 11:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98655.187223; Wed, 17 Mar 2021 11:27:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMUL8-0002dw-V6; Wed, 17 Mar 2021 11:27:50 +0000
Received: by outflank-mailman (input) for mailman id 98655;
 Wed, 17 Mar 2021 11:27:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lMUL7-0002dr-Lp
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 11:27:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMUL6-0004mB-Sg; Wed, 17 Mar 2021 11:27:48 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMUL6-0007ws-CR; Wed, 17 Mar 2021 11:27:48 +0000
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
	bh=XlF8rrW4tjGwtwdIfgdzDd++2n1pZEO7qz4puUQ3oJE=; b=wqJe9dCBvg9ZkBnx/GFlWqvi0G
	YNfnhT+gAMp4NFgFEVEsQ4SBpFdqQfCY/FQIuwu7fZ/yGESNgRkImDKzt/3eVO9k3/vZANrVopH6/
	j8kNkOS3+cmVataabPhFhZZL8uIXyuTxaTgGwRnQ3F7hA7lf62mY5J8GMlEj/n3Bip/k=;
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
Subject: [PATCH for-4.15 v2] SUPPORT.MD: Mark LiveUpdate of C XenStored daemon as Tech Preview
Date: Wed, 17 Mar 2021 11:27:45 +0000
Message-Id: <20210317112745.15207-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Support to liveupdate C XenStored daemon was added during the 4.15
development cycle. Add a section in SUPPORT.MD to explain what is the
support state.

For now, it is a tech preview.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

CC: Juergen Gross <jgross@suse.com>

    Changes in v2:
        - Clarify this is only supported for the daemon version
        - Fix typoes
---
 SUPPORT.md | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index 7db4568f1a0f..4c93afa3613b 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -177,6 +177,10 @@ Support for running qemu-xen device model in a linux stubdomain.
 
     Status: Tech Preview
 
+## Liveupdate of C XenStored daemon
+
+    Status: Tech Preview
+
 ## Toolstack/3rd party
 
 ### libvirt driver for xl
-- 
2.17.1


