Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E9EC2AAEA
	for <lists+xen-devel@lfdr.de>; Mon, 03 Nov 2025 10:06:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155209.1484767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFqVm-00033z-7y; Mon, 03 Nov 2025 09:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155209.1484767; Mon, 03 Nov 2025 09:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFqVm-00030r-4I; Mon, 03 Nov 2025 09:06:02 +0000
Received: by outflank-mailman (input) for mailman id 1155209;
 Mon, 03 Nov 2025 03:23:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2xPw=5L=inspur.com=chuguangqing@srs-se1.protection.inumbo.net>)
 id 1vFlA5-0001cN-Ja
 for xen-devel@lists.xenproject.org; Mon, 03 Nov 2025 03:23:17 +0000
Received: from ssh247.corpemail.net (ssh247.corpemail.net [210.51.61.247])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c8ea768-b864-11f0-9d16-b5c5bf9af7f9;
 Mon, 03 Nov 2025 04:23:13 +0100 (CET)
Received: from Jtjnmail201615.home.langchao.com
 by ssh247.corpemail.net ((D)) with ASMTP (SSL) id 202511031123089213;
 Mon, 03 Nov 2025 11:23:08 +0800
Received: from jtjnmailAR01.home.langchao.com (10.100.2.42) by
 Jtjnmail201615.home.langchao.com (10.100.2.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 3 Nov 2025 11:23:06 +0800
Received: from inspur.com (10.100.2.107) by jtjnmailAR01.home.langchao.com
 (10.100.2.42) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 3 Nov 2025 11:23:06 +0800
Received: from localhost.localdomain.com (unknown [10.94.13.117])
 by app3 (Coremail) with SMTP id awJkCsDw3fgXIAhpPa8JAA--.11940S4;
 Mon, 03 Nov 2025 11:23:06 +0800 (CST)
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
X-Inumbo-ID: 6c8ea768-b864-11f0-9d16-b5c5bf9af7f9
From: Chu Guangqing <chuguangqing@inspur.com>
To: <jgross@suse.com>, <sstabellini@kernel.org>,
	<oleksandr_tyshchenko@epam.com>, <andrew+netdev@lunn.ch>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>
CC: <xen-devel@lists.xenproject.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Chu Guangqing <chuguangqing@inspur.com>
Subject: [PATCH] xen/netfront: Comment Correction: Fix Spelling Error and Description of Queue Quantity Rules
Date: Mon, 3 Nov 2025 11:22:12 +0800
Message-ID: <20251103032212.2462-1-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: awJkCsDw3fgXIAhpPa8JAA--.11940S4
X-Coremail-Antispam: 1UD129KBjvJXoW7KFWfGw4fZr1DGFy3Xr4UCFg_yoW8Xw1Dpr
	ZxWwsIvwn5XanFy3Wvy3WxurW5Xa18GFyDWrWfu3y3Xws8ZFyjqry3KFW5Xr18Jr4kGa1Y
	yF4jqF9ruwn0v3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26rxl
	6s0DM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-CM-SenderInfo: 5fkxw35dqj1xlqj6x0hvsx2hhfrp/
X-CM-DELIVERINFO: =?B?WZlWr5RRTeOiUs3aOqHZ50hzsfHKF9Ds6CbXmDm38RucXu3DYXJR7Zlh9zE0nt/Iac
	D+Kd7qCoyzVvXU23E45gA/UozU+vTWs0UaMZjN3SDVnrRYOZ4d5fZaq5YsE8h+Y6TFhwys
	rNxsp/VnNVvUSEPN9bo=
Content-Type: text/plain
tUid: 20251103112308691f091018264b888eb3e7c243b9f925
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

The original comments contained spelling errors and incomplete logical
descriptions, which could easily lead to misunderstandings of the code
logic. The specific modifications are as follows:

Correct the spelling error by changing "inut max" to "but not exceed the
maximum limit";

Add the note "If the user has not specified a value, the default maximum
limit is 8" to clarify the default value logic;

Improve the coherence of the statement to make the queue quantity rules
clearer.

After the modification, the comments can accurately reflect the code
behavior of "taking the smaller value between the number of CPUs and the
default maximum limit of 8 for the number of queues", enhancing code
maintainability.

Signed-off-by: Chu Guangqing <chuguangqing@inspur.com>
---
 drivers/net/xen-netfront.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index a11a0e949400..7c2220366623 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -2696,8 +2696,9 @@ static int __init netif_init(void)
 
 	pr_info("Initialising Xen virtual ethernet driver\n");
 
-	/* Allow as many queues as there are CPUs inut max. 8 if user has not
-	 * specified a value.
+	/* Allow the number of queues to match the number of CPUs, but not exceed
+	 * the maximum limit. If the user has not specified a value, the default
+	 * maximum limit is 8.
 	 */
 	if (xennet_max_queues == 0)
 		xennet_max_queues = min_t(unsigned int, MAX_QUEUES_DEFAULT,
-- 
2.43.7


