Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 225617C888D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 17:25:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616666.958870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrK28-000406-G5; Fri, 13 Oct 2023 15:25:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616666.958870; Fri, 13 Oct 2023 15:25:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrK28-0003uS-BM; Fri, 13 Oct 2023 15:25:00 +0000
Received: by outflank-mailman (input) for mailman id 616666;
 Fri, 13 Oct 2023 15:24:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1cw9=F3=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qrK27-0002kj-Iq
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 15:24:59 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab17a39d-69dc-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 17:24:58 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.161.222.93])
 by support.bugseng.com (Postfix) with ESMTPSA id DB3C94EE073C;
 Fri, 13 Oct 2023 17:24:56 +0200 (CEST)
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
X-Inumbo-ID: ab17a39d-69dc-11ee-9b0e-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <henry.wang@arm.com>
Subject: [XEN PATCH 05/10] arm/p2m: address a violation of MISRA C:2012 Rule 8.2
Date: Fri, 13 Oct 2023 17:24:35 +0200
Message-Id: <b8dcbbbe9e6546f03ecc6e6a0c617cf98da9786a.1697207038.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697207038.git.federico.serafini@bugseng.com>
References: <cover.1697207038.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter name, no functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/arm/include/asm/p2m.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 940495d42b..9ad312bfb5 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -21,7 +21,7 @@ extern unsigned int p2m_root_level;
 
 struct domain;
 
-extern void memory_type_changed(struct domain *);
+extern void memory_type_changed(struct domain *d);
 
 /* Per-p2m-table state */
 struct p2m_domain {
-- 
2.34.1


