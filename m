Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2281F76B812
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 16:55:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574370.899629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQqla-00074t-SW; Tue, 01 Aug 2023 14:54:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574370.899629; Tue, 01 Aug 2023 14:54:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQqla-00071z-Pd; Tue, 01 Aug 2023 14:54:30 +0000
Received: by outflank-mailman (input) for mailman id 574370;
 Tue, 01 Aug 2023 14:54:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g6MH=DS=huawei.com=yuehaibing@srs-se1.protection.inumbo.net>)
 id 1qQqlZ-00071t-1J
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 14:54:29 +0000
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c68509b-307b-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 16:54:25 +0200 (CEST)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RFdMf2GZVzNmQW;
 Tue,  1 Aug 2023 22:50:54 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 1 Aug
 2023 22:54:19 +0800
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
X-Inumbo-ID: 4c68509b-307b-11ee-8613-37d641c3527e
From: Yue Haibing <yuehaibing@huawei.com>
To: <jgross@suse.com>, <sstabellini@kernel.org>,
	<oleksandr_tyshchenko@epam.com>, <rahul.singh@arm.com>
CC: <xen-devel@lists.xenproject.org>, <yuehaibing@huawei.com>
Subject: [PATCH -next] xen/evtchn: Remove unused function declaration xen_set_affinity_evtchn()
Date: Tue, 1 Aug 2023 22:54:13 +0800
Message-ID: <20230801145413.40684-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected

Commit 67473b8194bc ("xen/events: Remove disfunct affinity spreading")
leave this unused declaration.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 include/xen/events.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/xen/events.h b/include/xen/events.h
index 95970a2f7695..95d5e28de324 100644
--- a/include/xen/events.h
+++ b/include/xen/events.h
@@ -75,7 +75,6 @@ void evtchn_put(evtchn_port_t evtchn);
 
 void xen_send_IPI_one(unsigned int cpu, enum ipi_vector vector);
 void rebind_evtchn_irq(evtchn_port_t evtchn, int irq);
-int xen_set_affinity_evtchn(struct irq_desc *desc, unsigned int tcpu);
 
 static inline void notify_remote_via_evtchn(evtchn_port_t port)
 {
-- 
2.34.1


