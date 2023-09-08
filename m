Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F3E79849D
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 11:14:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597901.932311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeXYf-0007wj-Gx; Fri, 08 Sep 2023 09:13:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597901.932311; Fri, 08 Sep 2023 09:13:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeXYf-0007ta-EM; Fri, 08 Sep 2023 09:13:45 +0000
Received: by outflank-mailman (input) for mailman id 597901;
 Fri, 08 Sep 2023 09:13:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qS4c=EY=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qeXYd-0007tU-Bl
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 09:13:43 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 008d8989-4e28-11ee-9b0d-b553b5be7939;
 Fri, 08 Sep 2023 11:13:41 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.160.105.86])
 by support.bugseng.com (Postfix) with ESMTPSA id 4E1204EE0738;
 Fri,  8 Sep 2023 11:13:40 +0200 (CEST)
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
X-Inumbo-ID: 008d8989-4e28-11ee-9b0d-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH] xen/vPCI: address violation of MISRA C:2012 Rule 8.3
Date: Fri,  8 Sep 2023 11:13:31 +0200
Message-Id: <c0a206c000f475f50d7ee52825567fcd111568ee.1694164323.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make function declaration consistent with the corresponding definition.
No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/include/xen/vpci.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 0b8a2a3c74..d743d96a10 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -26,7 +26,7 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
                __used_section(".data.vpci." p) = x
 
 /* Add vPCI handlers to device. */
-int __must_check vpci_add_handlers(struct pci_dev *dev);
+int __must_check vpci_add_handlers(struct pci_dev *pdev);
 
 /* Remove all handlers and free vpci related structures. */
 void vpci_remove_device(struct pci_dev *pdev);
-- 
2.34.1


