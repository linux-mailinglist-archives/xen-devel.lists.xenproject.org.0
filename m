Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F9A57CBCB
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 15:22:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372773.604781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEW7w-00057n-1S; Thu, 21 Jul 2022 13:22:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372773.604781; Thu, 21 Jul 2022 13:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEW7v-000522-Rh; Thu, 21 Jul 2022 13:22:03 +0000
Received: by outflank-mailman (input) for mailman id 372773;
 Thu, 21 Jul 2022 13:22:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AEVB=X2=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oEW7u-0002GA-EW
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 13:22:02 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 1ac2f87d-08f8-11ed-bd2d-47488cf2e6aa;
 Thu, 21 Jul 2022 15:22:01 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61CB823A;
 Thu, 21 Jul 2022 06:22:01 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E11B63F73D;
 Thu, 21 Jul 2022 06:21:57 -0700 (PDT)
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
X-Inumbo-ID: 1ac2f87d-08f8-11ed-bd2d-47488cf2e6aa
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v6 9/9] xen: Add static memory sharing in SUPPORT.md
Date: Thu, 21 Jul 2022 21:21:15 +0800
Message-Id: <20220721132115.3015761-10-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220721132115.3015761-1-Penny.Zheng@arm.com>
References: <20220721132115.3015761-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

on ARM, static memory sharing is tech preview, which shall be documented
in SUPPORT.md

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v6 change:
- new commit
---
 SUPPORT.md | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index 8e040d1c1e..3dfe6d2fbe 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -299,6 +299,12 @@ Allow sharing of identical pages between guests
 
     Status, x86 HVM: Experimental
 
+### Static Memory Sharing
+
+Allow memory pre-shared among multiple domains at boot time through device tree configuration
+
+    Status, ARM: Tech Preview
+
 ### Memory Paging
 
 Allow pages belonging to guests to be paged to disk
-- 
2.25.1


