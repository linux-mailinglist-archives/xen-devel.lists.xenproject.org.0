Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 243C177F3EA
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 11:56:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585249.916312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWZjQ-0000SK-N5; Thu, 17 Aug 2023 09:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585249.916312; Thu, 17 Aug 2023 09:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWZjQ-0000QJ-KI; Thu, 17 Aug 2023 09:55:56 +0000
Received: by outflank-mailman (input) for mailman id 585249;
 Thu, 17 Aug 2023 09:55:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+wLb=EC=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qWZjP-0000QD-Qm
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 09:55:55 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f8b0b49-3ce4-11ee-9b0c-b553b5be7939;
 Thu, 17 Aug 2023 11:55:53 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-79-55-201-67.retail.telecomitalia.it [79.55.201.67])
 by support.bugseng.com (Postfix) with ESMTPSA id 8ECD94EE0737;
 Thu, 17 Aug 2023 11:55:50 +0200 (CEST)
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
X-Inumbo-ID: 3f8b0b49-3ce4-11ee-9b0c-b553b5be7939
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
Subject: [XEN PATCH v2] misra: add more entires to exclude-list.json
Date: Thu, 17 Aug 2023 11:55:42 +0200
Message-Id: <186af44774dc4670cb1ca0d8238e0620c3d0fc2f.1692266054.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add entries to the exclude-list.json for those files that need to be
excluded from the analysis scan.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
- fixed indentation.
---
 docs/misra/exclude-list.json | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
index ca1e2dd678..575ed22a7f 100644
--- a/docs/misra/exclude-list.json
+++ b/docs/misra/exclude-list.json
@@ -181,6 +181,18 @@
             "rel_path": "drivers/video/font_*",
             "comment": "Imported from Linux, ignore for now"
         },
+        {
+            "rel_path": "include/acpi/acpiosxf.h",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "include/acpi/acpixf.h",
+            "comment": "Imported from Linux, ignore for now"
+        },
+        {
+            "rel_path": "include/xen/acpi.h",
+            "comment": "Imported from Linux, ignore for now"
+        },
         {
             "rel_path": "lib/list-sort.c",
             "comment": "Imported from Linux, ignore for now"
-- 
2.34.1


