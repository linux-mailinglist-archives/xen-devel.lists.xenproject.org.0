Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F6B5AE3DE
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 11:09:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399695.640957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVUZr-0003MO-0q; Tue, 06 Sep 2022 09:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399695.640957; Tue, 06 Sep 2022 09:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVUZq-0003Ix-U3; Tue, 06 Sep 2022 09:09:02 +0000
Received: by outflank-mailman (input) for mailman id 399695;
 Tue, 06 Sep 2022 09:09:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YUvx=ZJ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oVURU-0007aG-2M
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 09:00:24 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 5750893b-2dc2-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 11:00:23 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E62C1139F;
 Tue,  6 Sep 2022 02:00:28 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 82CF83F7B4;
 Tue,  6 Sep 2022 02:00:19 -0700 (PDT)
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
X-Inumbo-ID: 5750893b-2dc2-11ed-a016-b9edf5238543
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
Subject: [PATCH v7 9/9] xen: Add static memory sharing in SUPPORT.md
Date: Tue,  6 Sep 2022 16:59:41 +0800
Message-Id: <20220906085941.944592-10-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906085941.944592-1-Penny.Zheng@arm.com>
References: <20220906085941.944592-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

on ARM, static memory sharing is tech preview, which shall be documented
in SUPPORT.md

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
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


