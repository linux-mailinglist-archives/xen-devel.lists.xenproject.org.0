Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E00E74C66EB
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 11:12:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280335.478248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOd0V-0006dv-S8; Mon, 28 Feb 2022 10:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280335.478248; Mon, 28 Feb 2022 10:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOd0V-0006aj-Ok; Mon, 28 Feb 2022 10:11:55 +0000
Received: by outflank-mailman (input) for mailman id 280335;
 Mon, 28 Feb 2022 10:11:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nOd0U-0006aZ-2z
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 10:11:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOd0S-0002Sh-Tb; Mon, 28 Feb 2022 10:11:52 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOd0S-000540-Lg; Mon, 28 Feb 2022 10:11:52 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=DoUrmxmwcPTK3PDPM7WZ3Sm53KX/g68Md1TJD3kNGt0=; b=KQX20N
	kYJWJ0OsTE6aSgTqSga4YsjsZwDLnnBk9lOd7x4BdxG4eXnk1ewwxuqvgQSqRpldmsWNPFC192n4Z
	XUm+3II9qsh5vxY50nLqysgmghkO4jhZjWHqd1EJBuUmHNwcZneSin/VoPBcFLVdq904HsWCy3PxZ
	NTfXILCCNVg=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm32: head: Update the documentation for register r12
Date: Mon, 28 Feb 2022 10:11:50 +0000
Message-Id: <20220228101150.63816-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Since commit 54c4ae18d158 ("xen/arm32: head: Rework and document
launch()"), the boot code is not using the register r12.

So update the documentation to show r12 has no specific purpose.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/arm32/head.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 13cfc837d39c..78274a1c034f 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -79,7 +79,7 @@
  *   r9  - paddr(start)
  *   r10 - phys offset
  *   r11 - UART address
- *   r12 - is_secondary_cpu
+ *   r12 -
  *   r13 - SP
  *   r14 - LR
  *   r15 - PC
-- 
2.32.0


