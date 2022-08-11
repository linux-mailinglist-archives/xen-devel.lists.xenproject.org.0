Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E5758FBF0
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 14:10:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384509.619893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM70g-0001iU-15; Thu, 11 Aug 2022 12:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384509.619893; Thu, 11 Aug 2022 12:09:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM70f-0001ff-UA; Thu, 11 Aug 2022 12:09:57 +0000
Received: by outflank-mailman (input) for mailman id 384509;
 Thu, 11 Aug 2022 12:09:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDJ2=YP=cdjrlc.com=wangborong@srs-se1.protection.inumbo.net>)
 id 1oM70e-0001fY-Bt
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 12:09:56 +0000
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7581e34b-196e-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 14:09:36 +0200 (CEST)
Received: from localhost.localdomain ( [182.148.14.53])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 11 Aug 2022 20:09:25 +0800 (CST)
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
X-Inumbo-ID: 7581e34b-196e-11ed-924f-1f966e50362f
X-QQ-mid: bizesmtp79t1660219767t4u30kic
X-QQ-SSF: 01000000002000G0V000B00A0000020
X-QQ-FEAT: TLc+rbMvNaH5OYpc2vpXRliUymwUm3enbmSFWCPJHLn06RxUVTo7PYfDoGSrc
	Bf1mjnddn5ysypy0lYDebVTCHb1ta+hJ42+ICX9bVZkki8fWJAPuB77P0BTPLB6E6/zKNOs
	1ygH0WkIG8GlHvaeknhZKc7QKboCryiP1Ijqxfjxi2VKh1aacbmp2VNYZhTxtnsC2jFNozo
	/f/iNMCOjFoFJnQJJcdFQ69fMJDgzc3frUXx5g/Hi8ESPD6iZWAW9Z764mt3GIh5wV3aKXV
	t0X9VnkZG8PaBahVKeJIMmJKfm0k18jOxCmOb7sPvA+Jo11o++jJxROa92NSXNR9ssAtSSK
	0UMEzj44QlR5zkEOMzW3bxqlWCoKbTfEjEwsPitTU+NyQK6Ep3/AuDqG35gmtMEDvKYZVG2
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: oleksandr_tyshchenko@epam.com
Cc: jgross@suse.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Jason Wang <wangborong@cdjrlc.com>
Subject: [PATCH] xen/pciback: Fix comment typo
Date: Thu, 11 Aug 2022 20:09:18 +0800
Message-Id: <20220811120918.17961-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6

The double `the' is duplicated in the comment, remove one.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 drivers/xen/xen-pciback/pciback_ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/xen-pciback/pciback_ops.c b/drivers/xen/xen-pciback/pciback_ops.c
index 3fbc21466a93..84e014490950 100644
--- a/drivers/xen/xen-pciback/pciback_ops.c
+++ b/drivers/xen/xen-pciback/pciback_ops.c
@@ -159,7 +159,7 @@ int xen_pcibk_enable_msi(struct xen_pcibk_device *pdev,
 		return XEN_PCI_ERR_op_failed;
 	}
 
-	/* The value the guest needs is actually the IDT vector, not the
+	/* The value the guest needs is actually the IDT vector, not
 	 * the local domain's IRQ number. */
 
 	op->value = dev->irq ? xen_pirq_from_irq(dev->irq) : 0;
-- 
2.36.1


