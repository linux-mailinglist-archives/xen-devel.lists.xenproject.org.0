Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CDD538A21
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 05:14:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338985.563829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvsK4-0004uQ-Sw; Tue, 31 May 2022 03:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338985.563829; Tue, 31 May 2022 03:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvsK4-0004qi-Pm; Tue, 31 May 2022 03:13:32 +0000
Received: by outflank-mailman (input) for mailman id 338985;
 Tue, 31 May 2022 03:13:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Brif=WH=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nvsK2-0004Go-MX
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 03:13:30 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id a5204b3c-e08f-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 05:13:29 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54EAF23A;
 Mon, 30 May 2022 20:13:29 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 35FB23F66F;
 Mon, 30 May 2022 20:13:25 -0700 (PDT)
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
X-Inumbo-ID: a5204b3c-e08f-11ec-837f-e5687231ffcc
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
Subject: [PATCH v5 3/9] xen: update SUPPORT.md for static allocation
Date: Tue, 31 May 2022 11:12:35 +0800
Message-Id: <20220531031241.90374-4-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531031241.90374-1-Penny.Zheng@arm.com>
References: <20220531031241.90374-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SUPPORT.md doesn't seem to explicitly say whether static memory is
supported, so this commit updates SUPPORT.md to add feature static
allocation tech preview for now.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v5 changes:
- new commit
---
 SUPPORT.md | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index ee2cd319e2..5980a82c4b 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -278,6 +278,13 @@ to boot with memory < maxmem.
 
     Status, x86 HVM: Supported
 
+### Static Allocation
+
+Static allocation refers to system or sub-system(domains) for which memory
+areas are pre-defined by configuration using physical address ranges.
+
+    Status, ARM: Tech Preview
+
 ### Memory Sharing
 
 Allow sharing of identical pages between guests
-- 
2.25.1


