Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C757FDB28
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 16:24:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643995.1004605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8MQl-0002P5-8e; Wed, 29 Nov 2023 15:24:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643995.1004605; Wed, 29 Nov 2023 15:24:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8MQl-0002I3-15; Wed, 29 Nov 2023 15:24:51 +0000
Received: by outflank-mailman (input) for mailman id 643995;
 Wed, 29 Nov 2023 15:24:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQo/=HK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r8MQj-0001PY-0g
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 15:24:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ed6493e-8ecb-11ee-98e3-6d05b1d4d9a1;
 Wed, 29 Nov 2023 16:24:48 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.152])
 by support.bugseng.com (Postfix) with ESMTPSA id A0DE24EE0747;
 Wed, 29 Nov 2023 16:24:47 +0100 (CET)
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
X-Inumbo-ID: 6ed6493e-8ecb-11ee-98e3-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 5/7] docs/misra: add entry to exclude-list.json
Date: Wed, 29 Nov 2023 16:24:23 +0100
Message-Id: <538cd0aaacc5af9111c09664cd3c4a4f78ba36fa.1701270983.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701270983.git.nicola.vetrini@bugseng.com>
References: <cover.1701270983.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

x86/efi/check.c is not part of the final Xen binary, therefore
it doesn't need to conform to MISRA guidelines at the moment.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 docs/misra/exclude-list.json | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
index b858a0baa106..24e4de3ca524 100644
--- a/docs/misra/exclude-list.json
+++ b/docs/misra/exclude-list.json
@@ -93,6 +93,10 @@
             "rel_path": "arch/x86/x86_64/mmconf-fam10h.c",
             "comment": "Imported from Linux, ignore for now"
         },
+        {
+            "rel_path": "arch/x86/efi/check.c",
+            "comment": "The resulting code is not included in the final Xen binary, ignore for now"
+        },
         {
             "rel_path": "common/bitmap.c",
             "comment": "Imported from Linux, ignore for now"
-- 
2.34.1


