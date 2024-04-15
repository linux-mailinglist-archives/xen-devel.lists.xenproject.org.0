Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 343CA8A4C14
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 11:58:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.705961.1102927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwJ4v-0008BH-7X; Mon, 15 Apr 2024 09:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 705961.1102927; Mon, 15 Apr 2024 09:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwJ4v-000896-4f; Mon, 15 Apr 2024 09:56:45 +0000
Received: by outflank-mailman (input) for mailman id 705961;
 Mon, 15 Apr 2024 09:56:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ro5Y=LU=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rwJ4t-000890-4A
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 09:56:43 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74ee568d-fb0e-11ee-94a3-07e782e9044d;
 Mon, 15 Apr 2024 11:56:40 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [37.161.163.182])
 by support.bugseng.com (Postfix) with ESMTPSA id 50FC54EE0737;
 Mon, 15 Apr 2024 11:56:38 +0200 (CEST)
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
X-Inumbo-ID: 74ee568d-fb0e-11ee-94a3-07e782e9044d
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH] docs/misra: mark the gzip folder as adopted code
Date: Mon, 15 Apr 2024 11:56:30 +0200
Message-Id: <2970c1010e227ca1460c5656d13fb87a05d87f29.1713174475.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mark the whole gzip folder as adopted code and remove the redundant
deviation of file inflate.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 5 -----
 docs/misra/exclude-list.json                     | 2 +-
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 0230b41c6d..4287805819 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -148,11 +148,6 @@ const-qualified."
 # Series 8.
 #
 
--doc_begin="The following file is imported from Linux: ignore for now."
--file_tag+={adopted_r8_2,"^xen/common/inflate\\.c$"}
--config=MC3R1.R8.2,reports+={deliberate,"any_area(any_loc(file(adopted_r8_2)))"}
--doc_end
-
 -doc_begin="The type ret_t is deliberately used and defined as int or long depending on the architecture."
 -config=MC3R1.R8.3,reports+={deliberate,"any_area(any_loc(text(^.*ret_t.*$)))"}
 -doc_end
diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
index 0956364158..cd69765427 100644
--- a/docs/misra/exclude-list.json
+++ b/docs/misra/exclude-list.json
@@ -118,7 +118,7 @@
             "comment": "Imported from Linux, ignore for now"
         },
         {
-            "rel_path": "common/gzip/inflate.c",
+            "rel_path": "common/gzip/*",
             "comment": "Imported from Linux, ignore for now"
         },
         {
-- 
2.34.1


