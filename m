Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EFF77F3AE
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 11:43:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585228.916288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWZX3-0006C3-84; Thu, 17 Aug 2023 09:43:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585228.916288; Thu, 17 Aug 2023 09:43:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWZX3-000686-3n; Thu, 17 Aug 2023 09:43:09 +0000
Received: by outflank-mailman (input) for mailman id 585228;
 Thu, 17 Aug 2023 09:43:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+wLb=EC=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qWZX1-00065w-RS
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 09:43:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77cdc449-3ce2-11ee-8779-cb3800f73035;
 Thu, 17 Aug 2023 11:43:06 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-79-55-201-67.retail.telecomitalia.it [79.55.201.67])
 by support.bugseng.com (Postfix) with ESMTPSA id 273854EE073C;
 Thu, 17 Aug 2023 11:43:06 +0200 (CEST)
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
X-Inumbo-ID: 77cdc449-3ce2-11ee-8779-cb3800f73035
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 2/2] misra: add more entires to exclude-list.json
Date: Thu, 17 Aug 2023 11:42:56 +0200
Message-Id: <ce1bf98508d9d66b3e903a7ce19c0a2ee2420fc2.1692261955.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692261955.git.federico.serafini@bugseng.com>
References: <cover.1692261955.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add entries to the exclude-list.json for those files that need to be
excluded from the analysis scan.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 docs/misra/exclude-list.json | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
index ca1e2dd678..3be9421e4d 100644
--- a/docs/misra/exclude-list.json
+++ b/docs/misra/exclude-list.json
@@ -181,6 +181,18 @@
             "rel_path": "drivers/video/font_*",
             "comment": "Imported from Linux, ignore for now"
         },
+        {
+          "rel_path": "include/acpi/acpiosxf.h",
+          "comment": "Imported from Linux, ignore for now"
+        },
+        {
+          "rel_path": "include/acpi/acpixf.h",
+          "comment": "Imported from Linux, ignore for now"
+        },
+        {
+          "rel_path": "include/xen/acpi.h",
+          "comment": "Imported from Linux, ignore for now"
+        },
         {
             "rel_path": "lib/list-sort.c",
             "comment": "Imported from Linux, ignore for now"
-- 
2.34.1


