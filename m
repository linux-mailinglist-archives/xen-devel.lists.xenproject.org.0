Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 156F6569E82
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 11:23:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362802.593051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9NjA-0003hO-4s; Thu, 07 Jul 2022 09:23:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362802.593051; Thu, 07 Jul 2022 09:23:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9NjA-0003eW-0b; Thu, 07 Jul 2022 09:23:16 +0000
Received: by outflank-mailman (input) for mailman id 362802;
 Thu, 07 Jul 2022 09:23:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DTeC=XM=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1o9Nj8-0002ms-Qg
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 09:23:14 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 6d2b33af-fdd6-11ec-bd2d-47488cf2e6aa;
 Thu, 07 Jul 2022 11:23:14 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBBA7106F;
 Thu,  7 Jul 2022 02:23:13 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4BDF13F792;
 Thu,  7 Jul 2022 02:23:10 -0700 (PDT)
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
X-Inumbo-ID: 6d2b33af-fdd6-11ec-bd2d-47488cf2e6aa
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
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v8 3/9] xen: update SUPPORT.md for static allocation
Date: Thu,  7 Jul 2022 17:22:38 +0800
Message-Id: <20220707092244.485936-4-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707092244.485936-1-Penny.Zheng@arm.com>
References: <20220707092244.485936-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SUPPORT.md doesn't seem to explicitly say whether static memory is
supported, so this commit updates SUPPORT.md to add feature static
allocation tech preview for now.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v8 changes:
- no change
---
v7 changes:
- no change
---
v6 changes:
- use domain instead of sub-systems
---
v5 changes:
- new commit
---
 SUPPORT.md | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index 70e98964cb..8e040d1c1e 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -286,6 +286,13 @@ to boot with memory < maxmem.
 
     Status, x86 HVM: Supported
 
+### Static Allocation
+
+Static allocation refers to domains for which memory areas are
+pre-defined by configuration using physical address ranges.
+
+    Status, ARM: Tech Preview
+
 ### Memory Sharing
 
 Allow sharing of identical pages between guests
-- 
2.25.1


