Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3BC7C8889
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 17:25:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616664.958854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrK25-0003Yo-OL; Fri, 13 Oct 2023 15:24:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616664.958854; Fri, 13 Oct 2023 15:24:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrK25-0003Wn-Ku; Fri, 13 Oct 2023 15:24:57 +0000
Received: by outflank-mailman (input) for mailman id 616664;
 Fri, 13 Oct 2023 15:24:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1cw9=F3=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qrK24-0002kz-0m
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 15:24:56 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a96ddf56-69dc-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 17:24:55 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.161.222.93])
 by support.bugseng.com (Postfix) with ESMTPSA id 6B48C4EE0745;
 Fri, 13 Oct 2023 17:24:53 +0200 (CEST)
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
X-Inumbo-ID: a96ddf56-69dc-11ee-98d4-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <henry.wang@arm.com>
Subject: [XEN PATCH 03/10] arm/smpboot: address violations of MISRA C:2012 Rule 8.2
Date: Fri, 13 Oct 2023 17:24:33 +0200
Message-Id: <9ff244730ac8a69598699acf663c086a5272ac82.1697207038.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697207038.git.federico.serafini@bugseng.com>
References: <cover.1697207038.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter name, no functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/arm/arm64/smpboot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/arm64/smpboot.c b/xen/arch/arm/arm64/smpboot.c
index 9637f42469..bf81d018b3 100644
--- a/xen/arch/arm/arm64/smpboot.c
+++ b/xen/arch/arm/arm64/smpboot.c
@@ -10,7 +10,7 @@
 #include <asm/acpi.h>
 
 struct smp_enable_ops {
-        int             (*prepare_cpu)(int);
+        int             (*prepare_cpu)(int cpu);
 };
 
 static paddr_t cpu_release_addr[NR_CPUS];
-- 
2.34.1


