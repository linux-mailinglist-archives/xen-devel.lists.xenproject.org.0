Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DF07EC202
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 13:17:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633604.988583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Eox-0004oe-BA; Wed, 15 Nov 2023 12:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633604.988583; Wed, 15 Nov 2023 12:16:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Eox-0004m5-7d; Wed, 15 Nov 2023 12:16:39 +0000
Received: by outflank-mailman (input) for mailman id 633604;
 Wed, 15 Nov 2023 12:16:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r3Eow-0004kO-CI
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 12:16:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3Eow-0008SN-0f; Wed, 15 Nov 2023 12:16:38 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3Eov-0002HO-Nu; Wed, 15 Nov 2023 12:16:37 +0000
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
	Subject:Cc:To:From; bh=/l7dvDU6hHLbwVLZIeJ3nlU+1NJa9cU0TGrmEu80dNs=; b=MZSLsx
	k+r2m8NFno6DcRbfUESKzNxfJTHm770Nan8V8pZ3AGjZuMDejIWuWXkEhG0LDLOd5ngVv2QIFg0AF
	lAweDO+RDIKzjf9FOro8mRdZ+oFWNuwKvvZzx46JM1AEyPgIlteMqB6x8dCxt1xgXpll0dLB2M5Ql
	2SoNIpoZhmI=;
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
Subject: [PATCH for-4.18] SUPPORT.md: Define support lifetime
Date: Wed, 15 Nov 2023 12:16:32 +0000
Message-Id: <20231115121632.63868-1-julien@xen.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 SUPPORT.md | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index fff4b4c5bad6..c452635eb552 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -9,10 +9,10 @@ for the definitions of the support status levels etc.
 
 # Release Support
 
-    Xen-Version: 4.18-rc
-    Initial-Release: n/a
-    Supported-Until: TBD
-    Security-Support-Until: Unreleased - not yet security-supported
+    Xen-Version: 4.18
+    Initial-Release: 2023-11-16
+    Supported-Until: 2025-05-16
+    Security-Support-Until: 2025-11-16
 
 Release Notes
 : <a href="https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes">RN</a>
-- 
2.40.1


