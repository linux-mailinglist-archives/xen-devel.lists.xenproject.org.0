Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4034A6438E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 08:28:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916185.1321333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu4tJ-0003GY-79; Mon, 17 Mar 2025 07:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916185.1321333; Mon, 17 Mar 2025 07:28:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu4tJ-0003DQ-3z; Mon, 17 Mar 2025 07:28:05 +0000
Received: by outflank-mailman (input) for mailman id 916185;
 Mon, 17 Mar 2025 07:17:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iXYq=WE=zte.com.cn=tang.dongxing@srs-se1.protection.inumbo.net>)
 id 1tu4ix-0000v9-35
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 07:17:23 +0000
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db85edb3-02ff-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 08:17:19 +0100 (CET)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZGR9z4DFLz501gV;
 Mon, 17 Mar 2025 15:17:11 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
 by mse-fl1.zte.com.cn with SMTP id 52H7GjbN079096;
 Mon, 17 Mar 2025 15:16:45 +0800 (+08)
 (envelope-from tang.dongxing@zte.com.cn)
Received: from mapi (xaxapp01[null]) by mapi (Zmail) with MAPI id mid32;
 Mon, 17 Mar 2025 15:16:48 +0800 (CST)
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
X-Inumbo-ID: db85edb3-02ff-11f0-9aba-95dc52dad729
Date: Mon, 17 Mar 2025 15:16:48 +0800 (CST)
X-Zmail-TransId: 2af967d7cc60616-56a25
X-Mailer: Zmail v1.0
Message-ID: <20250317151648132Sj7qhbVfKcPYvqCievFUf@zte.com.cn>
Mime-Version: 1.0
From: <tang.dongxing@zte.com.cn>
To: <jgross@suse.com>
Cc: <sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
        <jiqian.chen@amd.com>, <ray.huang@amd.com>,
        <jeff.johnson@oss.qualcomm.com>, <minhuadotchen@gmail.com>,
        <tang.dongxing@zte.com.cn>, <xen-devel@lists.xenproject.org>,
        <linux-kernel@vger.kernel.org>, <ye.xingchen@zte.com.cn>,
        <yang.guang5@zte.com.cn>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSB4ZW4vcGNpYmFjazogdXNlIHN5c2ZzX2VtaXRfYXQoKSBpbnN0ZWFkIG9mIHNjbnByaW50Zigp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 52H7GjbN079096
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67D7CC77.001/4ZGR9z4DFLz501gV

From: TangDongxing <tang.dongxing@zte.com.cn>

Follow the advice in Documentation/filesystems/sysfs.rst:
show() should only use sysfs_emit() or sysfs_emit_at() when formatting
the value to be returned to user space.

Signed-off-by: TangDongxing <tang.dongxing@zte.com.cn>
---
 drivers/xen/xen-pciback/pci_stub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
index b616b7768c3b..a0782a74ed34 100644
--- a/drivers/xen/xen-pciback/pci_stub.c
+++ b/drivers/xen/xen-pciback/pci_stub.c
@@ -1281,7 +1281,7 @@ static ssize_t slots_show(struct device_driver *drv, char *buf)
 		if (count >= PAGE_SIZE)
 			break;

-		count += scnprintf(buf + count, PAGE_SIZE - count,
+		count += sysfs_emit_at(buf, count,
 				   "%04x:%02x:%02x.%d\n",
 				   pci_dev_id->domain, pci_dev_id->bus,
 				   PCI_SLOT(pci_dev_id->devfn),
-- 
2.25.1

