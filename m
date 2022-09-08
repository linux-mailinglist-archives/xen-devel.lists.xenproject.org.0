Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 815B35B23A4
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 18:33:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403470.645594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWKSa-0002Yi-KQ; Thu, 08 Sep 2022 16:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403470.645594; Thu, 08 Sep 2022 16:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWKSa-0002VW-HK; Thu, 08 Sep 2022 16:33:00 +0000
Received: by outflank-mailman (input) for mailman id 403470;
 Thu, 08 Sep 2022 16:32:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fLS5=ZL=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oWKSZ-0002V6-MI
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 16:32:59 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id e124b17f-2f7d-11ed-9760-273f2230c3a0;
 Thu, 08 Sep 2022 15:55:21 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47A40106F;
 Thu,  8 Sep 2022 06:56:01 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 529DC3F7B4;
 Thu,  8 Sep 2022 06:55:51 -0700 (PDT)
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
X-Inumbo-ID: e124b17f-2f7d-11ed-9760-273f2230c3a0
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Penny Zheng <penny.zheng@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v8 9/9] xen: Add static memory sharing in SUPPORT.md
Date: Thu,  8 Sep 2022 21:55:13 +0800
Message-Id: <20220908135513.1800511-10-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220908135513.1800511-1-Penny.Zheng@arm.com>
References: <20220908135513.1800511-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

on ARM, static memory sharing is tech preview, which shall be documented
in SUPPORT.md

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
v8 changes:
- no change
---
v7 changes:
- doc refinement
---
v6 change:
- new commit
---
 SUPPORT.md | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index 8e040d1c1e..1979824ce5 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -299,6 +299,13 @@ Allow sharing of identical pages between guests
 
     Status, x86 HVM: Experimental
 
+### Static Memory Sharing
+
+Allow to statically set up shared memory on dom0less system,
+enabling domains to do shm-based communication
+
+    Status, ARM: Tech Preview
+
 ### Memory Paging
 
 Allow pages belonging to guests to be paged to disk
-- 
2.25.1


