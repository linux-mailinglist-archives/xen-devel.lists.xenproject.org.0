Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 864BF939C57
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 10:15:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762680.1172922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWAgV-0000bC-DB; Tue, 23 Jul 2024 08:15:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762680.1172922; Tue, 23 Jul 2024 08:15:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWAgV-0000YV-8M; Tue, 23 Jul 2024 08:15:47 +0000
Received: by outflank-mailman (input) for mailman id 762680;
 Tue, 23 Jul 2024 08:15:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0IL=OX=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sWAgU-0007w0-4B
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 08:15:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c228f9dd-48cb-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 10:15:44 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-79-35-51-193.retail.telecomitalia.it [79.35.51.193])
 by support.bugseng.com (Postfix) with ESMTPSA id D04FC4EE073E;
 Tue, 23 Jul 2024 10:15:41 +0200 (CEST)
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
X-Inumbo-ID: c228f9dd-48cb-11ef-8776-851b0ebba9a2
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Subject: [XEN PATCH v5 04/17] xen/arm: address violations of MISRA C:2012 Directive 4.10
Date: Tue, 23 Jul 2024 10:14:56 +0200
Message-Id: <33365a3adcf26a814f760005fd4d87adcac9c3e2.1721720583.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721720583.git.alessandro.zucchelli@bugseng.com>
References: <cover.1721720583.git.alessandro.zucchelli@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Simone Ballarin <simone.ballarin@bugseng.com>

Add inclusion guard to address violations of
MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
to prevent the contents of a header file being included more than
once").

Mechanical change.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Signed-off-by: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

---
Changes in v5:
- edit inclusion guard, according to the feedback received
Changes in v4:
- Dropped ARCH_ string from the guard, according to the
feedback received
Changes in v3:
- remove trailing underscores
- change inclusion guard name to adhere to the new standard
Changes in v2:
- drop changes in xen/arch/arm/include/asm/hypercall.h
- drop changes in xen/arch/arm/include/asm/iocap.h since they are
  not related with the directive
---
 xen/arch/arm/efi/efi-boot.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 199f526022..612c20f96f 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -3,6 +3,10 @@
  * is intended to be included by common/efi/boot.c _only_, and
  * therefore can define arch specific global variables.
  */
+
+#ifndef ARM__EFI__EFI_BOOT_H
+#define ARM__EFI__EFI_BOOT_H
+
 #include <xen/device_tree.h>
 #include <xen/libfdt/libfdt.h>
 #include <asm/setup.h>
@@ -992,6 +996,8 @@ static void __init efi_arch_flush_dcache_area(const void *vaddr, UINTN size)
     __flush_dcache_area(vaddr, size);
 }
 
+#endif /* ARM__EFI__EFI_BOOT_H */
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


