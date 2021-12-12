Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 893BA4718D1
	for <lists+xen-devel@lfdr.de>; Sun, 12 Dec 2021 06:48:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245554.423713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwHhN-0004JL-JG; Sun, 12 Dec 2021 05:47:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245554.423713; Sun, 12 Dec 2021 05:47:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwHhN-0004Hb-Ay; Sun, 12 Dec 2021 05:47:01 +0000
Received: by outflank-mailman (input) for mailman id 245554;
 Sun, 12 Dec 2021 03:25:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nb0k=Q5=cdjrlc.com=wangborong@srs-se1.protection.inumbo.net>)
 id 1mwFU2-0005S4-Vs
 for xen-devel@lists.xenproject.org; Sun, 12 Dec 2021 03:25:06 +0000
Received: from smtpbg587.qq.com (smtpbg126.qq.com [106.55.201.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15a073fc-5afb-11ec-bf02-3911bdbc85ab;
 Sun, 12 Dec 2021 04:25:01 +0100 (CET)
Received: from localhost.localdomain (unknown [182.132.179.213])
 by esmtp6.qq.com (ESMTP) with 
 id ; Sun, 12 Dec 2021 11:24:26 +0800 (CST)
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
X-Inumbo-ID: 15a073fc-5afb-11ec-bf02-3911bdbc85ab
X-QQ-mid: bizesmtp44t1639279467tpfmb7r9
X-QQ-SSF: 01000000002000D0H000B00A0000000
X-QQ-FEAT: F3yR32iATbjGUty7JOvTDi9n9m+mqQYI+e6hSssoDfBJE9Gd1TVesQbCMo/zT
	XaJoDxOp5Ul78RrkWXckhcOORY64vVS4qzStsNL3hzJL3LMVuIJNV1J3pJipQIrybW8xzxE
	7p+ghhl9NUn7a07iDNvzpo5d1cL0fM6v6Q/125FwcN3+X3jB7Yl27zeBaAXKADvcfOByLrJ
	W8HyHVBHvjzDxfeuSst7SyPhRrOd2kKwMcIXUz3XZrNsVRfzQH3YuaPbgh8R2qb63WFJY3M
	/vjwaqXnzof+3K+A5nfEEXeJDN/ET/+HV0h0P1t25lYBlvzf8kDycHW+Bt8hJk2iZ+tgNGn
	OPcKH6XRVfHOp5f/XEO5bZ6t8JEnIPFAV0cQONr
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: jgross@suse.com
Cc: boris.ostrovsky@oracle.com,
	sstabellini@kernel.org,
	wangborong@cdjrlc.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] xen/pciback: fix typo in a comment
Date: Sun, 12 Dec 2021 11:24:08 +0800
Message-Id: <20211212032408.52180-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam2

The double `the' in the comment in line 163 is repeated. Remove it
from the comment.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 drivers/xen/xen-pciback/pciback_ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/xen-pciback/pciback_ops.c b/drivers/xen/xen-pciback/pciback_ops.c
index 3fbc21466a93..e38b43b5065e 100644
--- a/drivers/xen/xen-pciback/pciback_ops.c
+++ b/drivers/xen/xen-pciback/pciback_ops.c
@@ -160,7 +160,7 @@ int xen_pcibk_enable_msi(struct xen_pcibk_device *pdev,
 	}
 
 	/* The value the guest needs is actually the IDT vector, not the
-	 * the local domain's IRQ number. */
+	 * local domain's IRQ number. */
 
 	op->value = dev->irq ? xen_pirq_from_irq(dev->irq) : 0;
 
-- 
2.34.1


