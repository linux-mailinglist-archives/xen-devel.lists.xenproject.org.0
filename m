Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD637B2EB4
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 10:58:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610426.949809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm9Jt-0007xf-Fx; Fri, 29 Sep 2023 08:57:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610426.949809; Fri, 29 Sep 2023 08:57:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm9Jt-0007v1-D5; Fri, 29 Sep 2023 08:57:57 +0000
Received: by outflank-mailman (input) for mailman id 610426;
 Fri, 29 Sep 2023 08:57:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2FIE=FN=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qm9Js-0007un-Kq
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 08:57:56 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47c760eb-5ea6-11ee-878b-cb3800f73035;
 Fri, 29 Sep 2023 10:57:55 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-87-11-204-216.retail.telecomitalia.it [87.11.204.216])
 by support.bugseng.com (Postfix) with ESMTPSA id 18FDA4EE073E;
 Fri, 29 Sep 2023 10:57:55 +0200 (CEST)
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
X-Inumbo-ID: 47c760eb-5ea6-11ee-878b-cb3800f73035
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Henry Wang <henry.wang@arm.com>
Subject: [XEN PATCH 1/4] video/vesa: drop bool_t
Date: Fri, 29 Sep 2023 10:56:14 +0200
Message-Id: <96027a74236514f38f54051d24a93b6d692644ac.1695972930.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695972930.git.federico.serafini@bugseng.com>
References: <cover.1695972930.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop bool_t to make function declaration and definition consistent and address
a violation of MISRA C:2012 Rule 8.3.
No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/drivers/video/vesa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/video/vesa.c b/xen/drivers/video/vesa.c
index b007ff5678..70feca21ac 100644
--- a/xen/drivers/video/vesa.c
+++ b/xen/drivers/video/vesa.c
@@ -145,7 +145,7 @@ static void cf_check lfb_flush(void)
     __asm__ __volatile__ ("sfence" : : : "memory");
 }
 
-void __init vesa_endboot(bool_t keep)
+void __init vesa_endboot(bool keep)
 {
     if ( keep )
     {
-- 
2.34.1


