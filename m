Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 199EB7EEDA3
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 09:41:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634881.990486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3uPF-0005z8-Fy; Fri, 17 Nov 2023 08:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634881.990486; Fri, 17 Nov 2023 08:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3uPF-0005xZ-Bh; Fri, 17 Nov 2023 08:40:53 +0000
Received: by outflank-mailman (input) for mailman id 634881;
 Fri, 17 Nov 2023 08:40:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Lb0=G6=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r3uPE-0004eV-CN
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 08:40:52 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02b02779-8525-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 09:40:50 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.163.77.7])
 by support.bugseng.com (Postfix) with ESMTPSA id E0CA04EE074E;
 Fri, 17 Nov 2023 09:40:48 +0100 (CET)
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
X-Inumbo-ID: 02b02779-8525-11ee-9b0e-b553b5be7939
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
Subject: [XEN PATCH 5/5] xen/xalloc: address violations of MISRA C:2012 Rule 8.2
Date: Fri, 17 Nov 2023 09:40:09 +0100
Message-Id: <9e3eddd16c53f11097fce7d5e9bf57dea7681ce1.1700209834.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700209834.git.federico.serafini@bugseng.com>
References: <cover.1700209834.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/include/xen/xmalloc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/xmalloc.h b/xen/include/xen/xmalloc.h
index 16979a117c..9ecddbff5e 100644
--- a/xen/include/xen/xmalloc.h
+++ b/xen/include/xen/xmalloc.h
@@ -63,7 +63,7 @@
     })
 
 /* Free any of the above. */
-extern void xfree(void *);
+extern void xfree(void *p);
 
 /* Free an allocation, and zero the pointer to it. */
 #define XFREE(p) do { \
-- 
2.34.1


