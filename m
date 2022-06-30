Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EA15613B9
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 09:53:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358274.587393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6ozD-00030x-TR; Thu, 30 Jun 2022 07:53:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358274.587393; Thu, 30 Jun 2022 07:53:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6ozD-0002z2-QY; Thu, 30 Jun 2022 07:53:15 +0000
Received: by outflank-mailman (input) for mailman id 358274;
 Thu, 30 Jun 2022 07:50:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PGlj=XF=nfschina.com=jiaming@srs-se1.protection.inumbo.net>)
 id 1o6oww-0002vj-5O
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 07:50:54 +0000
Received: from mail.nfschina.com (unknown
 [2400:dd01:100f:2:72e2:84ff:fe10:5f45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 5bbd0596-f849-11ec-bdce-3d151da133c5;
 Thu, 30 Jun 2022 09:50:50 +0200 (CEST)
Received: from localhost (unknown [127.0.0.1])
 by mail.nfschina.com (Postfix) with ESMTP id 739951E80D11;
 Thu, 30 Jun 2022 15:49:28 +0800 (CST)
Received: from mail.nfschina.com ([127.0.0.1])
 by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ELo56DrHke8u; Thu, 30 Jun 2022 15:49:25 +0800 (CST)
Received: from localhost.localdomain (unknown [180.167.10.98])
 (Authenticated sender: jiaming@nfschina.com)
 by mail.nfschina.com (Postfix) with ESMTPA id 36A4A1E80CB6;
 Thu, 30 Jun 2022 15:49:25 +0800 (CST)
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
X-Inumbo-ID: 5bbd0596-f849-11ec-bdce-3d151da133c5
X-Virus-Scanned: amavisd-new at test.com
From: Zhang Jiaming <jiaming@nfschina.com>
To: jgross@suse.com,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	liqiong@nfschina.com,
	renyu@nfschina.com,
	Zhang Jiaming <jiaming@nfschina.com>
Subject: [PATCH] xen: Fix spelling mistake
Date: Thu, 30 Jun 2022 15:50:27 +0800
Message-Id: <20220630075027.68833-1-jiaming@nfschina.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change 'maped' to 'mapped'.
Change 'unmaped' to 'unmapped'.

Signed-off-by: Zhang Jiaming <jiaming@nfschina.com>
---
 drivers/xen/xen-front-pgdir-shbuf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/xen-front-pgdir-shbuf.c b/drivers/xen/xen-front-pgdir-shbuf.c
index bef8d72a6ca6..5c0b5cb5b419 100644
--- a/drivers/xen/xen-front-pgdir-shbuf.c
+++ b/drivers/xen/xen-front-pgdir-shbuf.c
@@ -89,7 +89,7 @@ EXPORT_SYMBOL_GPL(xen_front_pgdir_shbuf_get_dir_start);
  * shared by the frontend itself) or map the provided granted
  * references onto the backing storage (buf->pages).
  *
- * \param buf shared buffer which grants to be maped.
+ * \param buf shared buffer which grants to be mapped.
  * \return zero on success or a negative number on failure.
  */
 int xen_front_pgdir_shbuf_map(struct xen_front_pgdir_shbuf *buf)
@@ -110,7 +110,7 @@ EXPORT_SYMBOL_GPL(xen_front_pgdir_shbuf_map);
  * shared by the frontend itself) or unmap the provided granted
  * references.
  *
- * \param buf shared buffer which grants to be unmaped.
+ * \param buf shared buffer which grants to be unmapped.
  * \return zero on success or a negative number on failure.
  */
 int xen_front_pgdir_shbuf_unmap(struct xen_front_pgdir_shbuf *buf)
-- 
2.34.1


