Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB3F818402
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 10:03:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656610.1024899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFVzz-00070I-4H; Tue, 19 Dec 2023 09:02:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656610.1024899; Tue, 19 Dec 2023 09:02:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFVzz-0006yc-1E; Tue, 19 Dec 2023 09:02:47 +0000
Received: by outflank-mailman (input) for mailman id 656610;
 Tue, 19 Dec 2023 09:02:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aNFb=H6=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rFVzx-0006xB-H1
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 09:02:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f420b7a-9e4d-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 10:02:44 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id BCB4A4EE0738;
 Tue, 19 Dec 2023 10:02:42 +0100 (CET)
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
X-Inumbo-ID: 5f420b7a-9e4d-11ee-98eb-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] xen: add acmacros.h to exclude-list.json
Date: Tue, 19 Dec 2023 10:02:39 +0100
Message-Id: <664ddc412905546d44d3e311a743ba5217a6243b.1702976486.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The file was inherited from Linux and ACPI CA, therefore it's
not subject to MISRA compliance at the moment.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 docs/misra/exclude-list.json | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
index 48f671c548b6..36cca71fae2d 100644
--- a/docs/misra/exclude-list.json
+++ b/docs/misra/exclude-list.json
@@ -209,6 +209,10 @@
           "rel_path": "include/acpi/acglobal.h",
           "comment": "Imported from Linux, ignore for now"
         },
+        {
+          "rel_path": "include/acpi/acmacros.h",
+          "comment": "Imported from Linux, ignore for now"
+        },
         {
             "rel_path": "include/xen/acpi.h",
             "comment": "Imported from Linux, ignore for now"
-- 
2.34.1


