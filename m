Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C037F75F1
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 15:05:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640733.999379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6WnU-0005aa-Lb; Fri, 24 Nov 2023 14:04:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640733.999379; Fri, 24 Nov 2023 14:04:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6WnU-0005Wd-Hv; Fri, 24 Nov 2023 14:04:44 +0000
Received: by outflank-mailman (input) for mailman id 640733;
 Fri, 24 Nov 2023 14:04:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wuqv=HF=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r6WnT-0005N1-17
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 14:04:43 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69982414-8ad2-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 15:04:41 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.161.237.167])
 by support.bugseng.com (Postfix) with ESMTPSA id DD6024EE0C91;
 Fri, 24 Nov 2023 15:04:40 +0100 (CET)
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
X-Inumbo-ID: 69982414-8ad2-11ee-9b0e-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH 02/11] xen/aclinux: address violations of MISRA C:2012 Rule 8.2
Date: Fri, 24 Nov 2023 15:03:17 +0100
Message-Id: <98eabdc58a458188157765fd9ca8c9d4d4f6b11c.1700832962.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700832962.git.federico.serafini@bugseng.com>
References: <cover.1700832962.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/include/acpi/platform/aclinux.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/include/acpi/platform/aclinux.h b/xen/include/acpi/platform/aclinux.h
index 9e572460dc..f5e0a6108e 100644
--- a/xen/include/acpi/platform/aclinux.h
+++ b/xen/include/acpi/platform/aclinux.h
@@ -75,9 +75,9 @@
 
 #define acpi_thread_id struct vcpu *
 
-void *acpi_os_alloc_memory(size_t);
-void *acpi_os_zalloc_memory(size_t);
-void acpi_os_free_memory(void *);
+void *acpi_os_alloc_memory(size_t sz);
+void *acpi_os_zalloc_memory(size_t sz);
+void acpi_os_free_memory(void *ptr);
 
 #define ACPI_ALLOCATE(a)	acpi_os_alloc_memory(a)
 #define ACPI_ALLOCATE_ZEROED(a)	acpi_os_zalloc_memory(a)
-- 
2.34.1


