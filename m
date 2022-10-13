Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D655FD366
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 04:58:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421622.667123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oioQ2-000742-3M; Thu, 13 Oct 2022 02:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421622.667123; Thu, 13 Oct 2022 02:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oioQ2-00070f-0c; Thu, 13 Oct 2022 02:57:58 +0000
Received: by outflank-mailman (input) for mailman id 421622;
 Thu, 13 Oct 2022 02:57:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j8+s=2O=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oioQ0-0006zV-Hj
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 02:57:56 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d5fcc967-4aa2-11ed-8fd0-01056ac49cbb;
 Thu, 13 Oct 2022 04:57:55 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2381015DB;
 Wed, 12 Oct 2022 19:58:01 -0700 (PDT)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C5CC73F792;
 Wed, 12 Oct 2022 19:57:51 -0700 (PDT)
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
X-Inumbo-ID: d5fcc967-4aa2-11ed-8fd0-01056ac49cbb
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH for-4.17 2/2] SUPPORT.md: Mark static heap feature as supported
Date: Thu, 13 Oct 2022 02:57:22 +0000
Message-Id: <20221013025722.48802-3-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221013025722.48802-1-Henry.Wang@arm.com>
References: <20221013025722.48802-1-Henry.Wang@arm.com>

With the P2M pages pool bounding the domain memory runtime allocation
and the documented minimal size requirement of the static heap, it is
safe to mark static heap feature as supported.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
 SUPPORT.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index cf2ddfacaf..ddcf8a13a7 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -298,7 +298,7 @@ pre-defined by configuration using physical address ranges.
 Allow reserving parts of RAM through the device tree using physical
 address ranges as heap.
 
-    Status, ARM: Tech Preview
+    Status, ARM: Supported
 
 ### Memory Sharing
 
-- 
2.17.1


