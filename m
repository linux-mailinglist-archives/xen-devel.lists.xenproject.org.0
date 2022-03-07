Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 875824CF1E1
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 07:27:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285641.484856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nR6p0-0000P9-Ho; Mon, 07 Mar 2022 06:26:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285641.484856; Mon, 07 Mar 2022 06:26:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nR6p0-0000Ln-ER; Mon, 07 Mar 2022 06:26:18 +0000
Received: by outflank-mailman (input) for mailman id 285641;
 Mon, 07 Mar 2022 06:26:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YAZl=TS=linux.alibaba.com=jiapeng.chong@srs-se1.protection.inumbo.net>)
 id 1nR6oy-0000Lh-TJ
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 06:26:16 +0000
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79883799-9ddf-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 07:26:11 +0100 (CET)
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0V6Qe3PL_1646634356) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 07 Mar 2022 14:26:06 +0800
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
X-Inumbo-ID: 79883799-9ddf-11ec-8eba-a37418f5ba1a
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04407;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0V6Qe3PL_1646634356;
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
Subject: [PATCH] x86/xen: Fix kerneldoc warning
Date: Mon,  7 Mar 2022 14:25:54 +0800
Message-Id: <20220307062554.8334-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following W=1 kernel warnings:

arch/x86/xen/setup.c:725: warning: expecting prototype for
machine_specific_memory_setup(). Prototype was for xen_memory_setup()
instead.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 arch/x86/xen/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/setup.c b/arch/x86/xen/setup.c
index af216feb63d9..81aa46f770c5 100644
--- a/arch/x86/xen/setup.c
+++ b/arch/x86/xen/setup.c
@@ -719,7 +719,7 @@ static void __init xen_reserve_xen_mfnlist(void)
 }
 
 /**
- * machine_specific_memory_setup - Hook for machine specific memory setup.
+ * xen_memory_setup - Hook for machine specific memory setup.
  **/
 char * __init xen_memory_setup(void)
 {
-- 
2.20.1.7.g153144c


