Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 241DE7F75EC
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 15:05:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640735.999407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6WnX-0006Nn-FA; Fri, 24 Nov 2023 14:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640735.999407; Fri, 24 Nov 2023 14:04:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6WnX-0006Lj-BZ; Fri, 24 Nov 2023 14:04:47 +0000
Received: by outflank-mailman (input) for mailman id 640735;
 Fri, 24 Nov 2023 14:04:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wuqv=HF=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r6WnU-0005N1-Ve
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 14:04:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ac27968-8ad2-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 15:04:43 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.161.237.167])
 by support.bugseng.com (Postfix) with ESMTPSA id 682354EE0C8A;
 Fri, 24 Nov 2023 15:04:42 +0100 (CET)
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
X-Inumbo-ID: 6ac27968-8ad2-11ee-9b0e-b553b5be7939
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
Subject: [XEN PATCH 04/11] xen/dmi: address a violation of MISRA C:2012 Rule 8.2
Date: Fri, 24 Nov 2023 15:03:19 +0100
Message-Id: <0eaa7a31011dc3b2f22217d2c7389570d5634549.1700832962.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700832962.git.federico.serafini@bugseng.com>
References: <cover.1700832962.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter name. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/include/xen/dmi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/dmi.h b/xen/include/xen/dmi.h
index 71a5c46dc6..0fef41842e 100644
--- a/xen/include/xen/dmi.h
+++ b/xen/include/xen/dmi.h
@@ -24,7 +24,7 @@ struct dmi_strmatch {
 };
 
 struct dmi_system_id {
-	int (*callback)(const struct dmi_system_id *);
+	int (*callback)(const struct dmi_system_id *d);
 	const char *ident;
 	struct dmi_strmatch matches[4];
 	void *driver_data;
-- 
2.34.1


