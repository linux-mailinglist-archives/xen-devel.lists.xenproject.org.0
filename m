Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A646461F5
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 20:59:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456580.714352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p30Zd-00069V-2x; Wed, 07 Dec 2022 19:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456580.714352; Wed, 07 Dec 2022 19:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p30Zd-000667-0H; Wed, 07 Dec 2022 19:59:21 +0000
Received: by outflank-mailman (input) for mailman id 456580;
 Wed, 07 Dec 2022 19:59:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p30Zb-00065l-Gl
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 19:59:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p30Za-0002CJ-RS; Wed, 07 Dec 2022 19:59:18 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p30Za-0006SV-JM; Wed, 07 Dec 2022 19:59:18 +0000
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
	Subject:Cc:To:From; bh=1/152VQvFP1hpMt3cCHYlPuCC82zG2jG+7TSqT/0TCA=; b=L4d7MO
	nuyaJu35j8sTMQnV22GtZtgEQhPAy3sBxRoNNNE1tZLFzTZRXZ1TAJEmLeudG7l3hQyJXmc2PW2Fm
	2u0a/WFpMAEqi5pwGfCCj0d8YGaV1s7673k5KsSFICK1dC+Z90kl7V99OpDOgUVca/Vlj9QL3h3Cl
	gXC6axyswTk=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-4.17] SUPPORT.md: Define support lifetime
Date: Wed,  7 Dec 2022 19:59:07 +0000
Message-Id: <20221207195907.23606-1-julien@xen.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Julien Grall <julien@xen.org>
---
 SUPPORT.md | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 765dd15685..cb504eec1e 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -10,9 +10,9 @@ for the definitions of the support status levels etc.
 # Release Support
 
     Xen-Version: 4.17
-    Initial-Release: n/a
-    Supported-Until: TBD
-    Security-Support-Until: Unreleased - not yet security-supported
+    Initial-Release: 2022-12-12
+    Supported-Until: 2024-06-12
+    Security-Support-Until: 2025-12-12
 
 Release Notes
 : <a href="https://wiki.xenproject.org/wiki/Xen_Project_4.17_Release_Notes">RN</a>
-- 
2.37.1 (Apple Git-137.1)


