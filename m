Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D67BA768AD4
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 06:40:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572581.896421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQKhW-00030X-0j; Mon, 31 Jul 2023 04:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572581.896421; Mon, 31 Jul 2023 04:40:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQKhV-0002yO-T2; Mon, 31 Jul 2023 04:40:09 +0000
Received: by outflank-mailman (input) for mailman id 572581;
 Mon, 31 Jul 2023 03:00:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EPXn=DR=linux.alibaba.com=yang.lee@srs-se1.protection.inumbo.net>)
 id 1qQJ9K-0000dy-LB
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 03:00:46 +0000
Received: from out30-119.freemail.mail.aliyun.com
 (out30-119.freemail.mail.aliyun.com [115.124.30.119])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f10b9f4-2f4e-11ee-b254-6b7b168915f2;
 Mon, 31 Jul 2023 05:00:43 +0200 (CEST)
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VoXHf6M_1690772438) by smtp.aliyun-inc.com;
 Mon, 31 Jul 2023 11:00:39 +0800
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
X-Inumbo-ID: 6f10b9f4-2f4e-11ee-b254-6b7b168915f2
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R311e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0VoXHf6M_1690772438;
From: Yang Li <yang.lee@linux.alibaba.com>
To: jgross@suse.com,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] xen: Fix one kernel-doc comment
Date: Mon, 31 Jul 2023 11:00:37 +0800
Message-Id: <20230731030037.123946-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use colon to separate parameter name from their specific meaning.
silence the warning:

drivers/xen/grant-table.c:1051: warning: Function parameter or member 'nr_pages' not described in 'gnttab_free_pages'

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=6030
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/xen/grant-table.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index f13c3b76ad1e..35659bf70746 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -1044,7 +1044,7 @@ EXPORT_SYMBOL_GPL(gnttab_pages_clear_private);
 
 /**
  * gnttab_free_pages - free pages allocated by gnttab_alloc_pages()
- * @nr_pages; number of pages to free
+ * @nr_pages: number of pages to free
  * @pages: the pages
  */
 void gnttab_free_pages(int nr_pages, struct page **pages)
-- 
2.20.1.7.g153144c


