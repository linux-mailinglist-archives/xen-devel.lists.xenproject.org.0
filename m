Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 175A57D2F2C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 11:57:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621184.967438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qurgD-0000zs-TU; Mon, 23 Oct 2023 09:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621184.967438; Mon, 23 Oct 2023 09:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qurgD-0000su-GG; Mon, 23 Oct 2023 09:57:01 +0000
Received: by outflank-mailman (input) for mailman id 621184;
 Mon, 23 Oct 2023 09:56:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gXaf=GF=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qurgB-0007mv-52
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 09:56:59 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8154b5fc-718a-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 11:56:58 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id A2AA54EE0744;
 Mon, 23 Oct 2023 11:56:57 +0200 (CEST)
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
X-Inumbo-ID: 8154b5fc-718a-11ee-98d5-6d05b1d4d9a1
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
Subject: [XEN PATCH][for-4.19 v4 8/8] docs/misra: exclude three more files
Date: Mon, 23 Oct 2023 11:56:45 +0200
Message-Id: <741b3eee4c25296bc114cfcc0f38d7e7c2bef667.1698053876.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698053876.git.nicola.vetrini@bugseng.com>
References: <cover.1698053876.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These files should not conform to MISRA guidelines at the moment,
therefore they are added to the exclusion list.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
These exclusions are automatically picked up by ECLAIR's automation
to hide reports originating from these files.

Changes in v4:
- Fixed typo
---
 docs/misra/exclude-list.json | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
index 575ed22a7f67..b858a0baa106 100644
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
+          "rel_path": "include/acpi/acexcep.h",
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


