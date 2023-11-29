Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABA87FDB2D
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 16:25:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643997.1004628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8MQn-00030w-2z; Wed, 29 Nov 2023 15:24:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643997.1004628; Wed, 29 Nov 2023 15:24:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8MQm-0002tY-Qd; Wed, 29 Nov 2023 15:24:52 +0000
Received: by outflank-mailman (input) for mailman id 643997;
 Wed, 29 Nov 2023 15:24:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQo/=HK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r8MQk-0001PZ-Oe
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 15:24:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f6bf152-8ecb-11ee-9b0e-b553b5be7939;
 Wed, 29 Nov 2023 16:24:49 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.152])
 by support.bugseng.com (Postfix) with ESMTPSA id 6FB884EE074E;
 Wed, 29 Nov 2023 16:24:48 +0100 (CET)
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
X-Inumbo-ID: 6f6bf152-8ecb-11ee-9b0e-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 6/7] xen/x86: remove stale comment
Date: Wed, 29 Nov 2023 16:24:24 +0100
Message-Id: <d06ee9f139392045fb8d927ff3a0c38fdc5080c6.1701270983.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701270983.git.nicola.vetrini@bugseng.com>
References: <cover.1701270983.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment referred to the declaration for do_mca, which
now is part of hypercall-defs.h, therefore the comment is stale.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/cpu/mcheck/mce.c        | 2 +-
 xen/arch/x86/include/asm/hypercall.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 779a458cd88f..53493c8e4778 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -14,7 +14,7 @@
 #include <xen/cpumask.h>
 #include <xen/event.h>
 #include <xen/guest_access.h>
-#include <xen/hypercall.h> /* for do_mca */
+#include <xen/hypercall.h>
 #include <xen/cpu.h>
 
 #include <asm/processor.h>
diff --git a/xen/arch/x86/include/asm/hypercall.h b/xen/arch/x86/include/asm/hypercall.h
index ec2edc771e9d..76658fff19ff 100644
--- a/xen/arch/x86/include/asm/hypercall.h
+++ b/xen/arch/x86/include/asm/hypercall.h
@@ -12,7 +12,7 @@
 #include <xen/types.h>
 #include <public/physdev.h>
 #include <public/event_channel.h>
-#include <public/arch-x86/xen-mca.h> /* for do_mca */
+#include <public/arch-x86/xen-mca.h>
 #include <asm/paging.h>
 
 #define __HYPERVISOR_paging_domctl_cont __HYPERVISOR_arch_1
-- 
2.34.1


