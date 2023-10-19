Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 993557CFB5E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 15:40:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619347.964323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtTGB-0001jo-HM; Thu, 19 Oct 2023 13:40:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619347.964323; Thu, 19 Oct 2023 13:40:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtTGB-0001d1-Ab; Thu, 19 Oct 2023 13:40:23 +0000
Received: by outflank-mailman (input) for mailman id 619347;
 Thu, 19 Oct 2023 13:40:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cQIi=GB=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qtTG9-0008Uq-3K
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 13:40:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b45632f-6e85-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 15:40:19 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id A36264EE0747;
 Thu, 19 Oct 2023 15:40:18 +0200 (CEST)
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
X-Inumbo-ID: 0b45632f-6e85-11ee-9b0e-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH][for-4.19 v3 8/8] docs/misra: exclude three more files
Date: Thu, 19 Oct 2023 15:40:06 +0200
Message-Id: <0eae39cdc68e48932936e2c510a867ebe1f7c298.1697722648.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697722648.git.nicola.vetrini@bugseng.com>
References: <cover.1697722648.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These files should not conform to MISRA guidelines at the moment,
therefore they are added to the exclusion list.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
These exclusions are automatically picked up by ECLAIR's automation
to hide reports originating from these files.
---
 docs/misra/exclude-list.json | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
index 575ed22a7f67..b2b4b9253615 100644
--- a/docs/misra/exclude-list.json
+++ b/docs/misra/exclude-list.json
@@ -145,6 +145,10 @@
             "rel_path": "common/zstd/*",
             "comment": "Imported from Linux, ignore for now"
         },
+        {
+            "rel_path": "common/symbols-dummy.c",
+            "comment": "The resulting code is not included in the final Xen binary, ignore for now"
+        },
         {
             "rel_path": "crypto/*",
             "comment": "Origin is external and documented in crypto/README.source"
@@ -189,6 +193,14 @@
             "rel_path": "include/acpi/acpixf.h",
             "comment": "Imported from Linux, ignore for now"
         },
+        {
+          "rel_path": "include/acpi/acexep.h",
+          "comment": "Imported from Linux, ignore for now"
+        },
+        {
+          "rel_path": "include/acpi/acglobal.h",
+          "comment": "Imported from Linux, ignore for now"
+        },
         {
             "rel_path": "include/xen/acpi.h",
             "comment": "Imported from Linux, ignore for now"
-- 
2.34.1


