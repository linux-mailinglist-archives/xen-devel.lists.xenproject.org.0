Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9598D04BF
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 16:53:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730807.1136047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBbj7-0005d1-2H; Mon, 27 May 2024 14:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730807.1136047; Mon, 27 May 2024 14:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBbj6-0005Za-Q6; Mon, 27 May 2024 14:53:28 +0000
Received: by outflank-mailman (input) for mailman id 730807;
 Mon, 27 May 2024 14:53:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uY6H=M6=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sBbj5-00056V-8W
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 14:53:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de628393-1c38-11ef-b4bb-af5377834399;
 Mon, 27 May 2024 16:53:24 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 066114EE0742;
 Mon, 27 May 2024 16:53:23 +0200 (CEST)
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
X-Inumbo-ID: de628393-1c38-11ef-b4bb-af5377834399
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH 1/4] docs/misra: exclude gdbsx from MISRA compliance
Date: Mon, 27 May 2024 16:53:16 +0200
Message-Id: <83d89e6fa141bb91d7716cf33f086edf9a6d7ae1.1716814609.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716814609.git.nicola.vetrini@bugseng.com>
References: <cover.1716814609.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These files are used when debugging Xen, and are not meant to comply
with MISRA rules at the moment.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 docs/misra/exclude-list.json | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
index cd6976542793..2567e8467c78 100644
--- a/docs/misra/exclude-list.json
+++ b/docs/misra/exclude-list.json
@@ -77,6 +77,14 @@
             "rel_path": "arch/x86/dmi_scan.c",
             "comment": "Imported from Linux, ignore for now"
         },
+        {
+            "rel_path": "arch/x86/gdbsx.c",
+            "comment": "Used for debugging Xen, ignore for now"
+        },
+        {
+            "rel_path": "arch/x86/include/asm/gdbsx.h",
+            "comment": "Used for debugging Xen, ignore for now"
+        },
         {
             "rel_path": "arch/x86/mpparse.c",
             "comment": "Imported from Linux, ignore for now"
-- 
2.34.1


