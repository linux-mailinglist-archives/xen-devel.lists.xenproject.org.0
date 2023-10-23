Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B06D7D2B2E
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 09:23:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.620995.966963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qupHR-0004cJ-VB; Mon, 23 Oct 2023 07:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620995.966963; Mon, 23 Oct 2023 07:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qupHR-0004NU-Mb; Mon, 23 Oct 2023 07:23:17 +0000
Received: by outflank-mailman (input) for mailman id 620995;
 Mon, 23 Oct 2023 07:23:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iWHG=GF=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qupHP-0003Om-N6
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 07:23:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0709b123-7175-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 09:23:14 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-95-247-204-25.retail.telecomitalia.it [95.247.204.25])
 by support.bugseng.com (Postfix) with ESMTPSA id 5737A4EE0749;
 Mon, 23 Oct 2023 09:23:13 +0200 (CEST)
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
X-Inumbo-ID: 0709b123-7175-11ee-98d5-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 6/8] x86/physdev: address violations of MISRA C:2012 Rule 8.2
Date: Mon, 23 Oct 2023 09:23:01 +0200
Message-Id: <dee7168f9ce2c52c8db0c4d5d48394550592756f.1698045505.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698045505.git.federico.serafini@bugseng.com>
References: <cover.1698045505.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/physdev.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
index 2f1d955a96..47c4da0af7 100644
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -18,9 +18,9 @@
 #include <xsm/xsm.h>
 #include <asm/p2m.h>
 
-int physdev_map_pirq(domid_t, int type, int *index, int *pirq_p,
-                     struct msi_info *);
-int physdev_unmap_pirq(domid_t, int pirq);
+int physdev_map_pirq(domid_t domid, int type, int *index, int *pirq_p,
+                     struct msi_info *msi);
+int physdev_unmap_pirq(domid_t domid, int pirq);
 
 #include "x86_64/mmconfig.h"
 
-- 
2.34.1


