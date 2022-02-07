Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4648B4AB8C9
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 11:35:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266661.460360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH1Mf-0005Xq-F5; Mon, 07 Feb 2022 10:35:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266661.460360; Mon, 07 Feb 2022 10:35:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH1Mf-0005Vx-Bx; Mon, 07 Feb 2022 10:35:21 +0000
Received: by outflank-mailman (input) for mailman id 266661;
 Mon, 07 Feb 2022 10:35:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1Gu=SW=linux.alibaba.com=jiapeng.chong@srs-se1.protection.inumbo.net>)
 id 1nH1Me-0005Vr-0q
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 10:35:20 +0000
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a279d0f1-8801-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 11:35:17 +0100 (CET)
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0V3qO.zD_1644230107) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 07 Feb 2022 18:35:12 +0800
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
X-Inumbo-ID: a279d0f1-8801-11ec-8eb8-a37418f5ba1a
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0V3qO.zD_1644230107;
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: boris.ostrovsky@oracle.com
Cc: jgross@suse.com,
	sstabellini@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] xen/x2apic: Fix inconsistent indenting
Date: Mon,  7 Feb 2022 18:35:06 +0800
Message-Id: <20220207103506.102008-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Eliminate the follow smatch warning:

arch/x86/xen/enlighten_hvm.c:189 xen_cpu_dead_hvm() warn: inconsistent
indenting.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 arch/x86/xen/enlighten_hvm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
index 6448c5071117..6f4c9b57eda8 100644
--- a/arch/x86/xen/enlighten_hvm.c
+++ b/arch/x86/xen/enlighten_hvm.c
@@ -185,8 +185,7 @@ static int xen_cpu_dead_hvm(unsigned int cpu)
 
 	if (xen_have_vector_callback && xen_feature(XENFEAT_hvm_safe_pvclock))
 		xen_teardown_timer(cpu);
-
-       return 0;
+	return 0;
 }
 
 static bool no_vector_callback __initdata;
-- 
2.20.1.7.g153144c


