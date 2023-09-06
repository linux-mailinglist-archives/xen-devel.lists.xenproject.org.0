Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F493793789
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 10:58:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596373.930261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdoMC-0000G5-Mw; Wed, 06 Sep 2023 08:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596373.930261; Wed, 06 Sep 2023 08:57:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdoMC-00009J-CR; Wed, 06 Sep 2023 08:57:52 +0000
Received: by outflank-mailman (input) for mailman id 596373;
 Wed, 06 Sep 2023 08:57:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5kCQ=EW=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qdoMA-0008Tb-PF
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 08:57:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 742b585f-4c93-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 10:57:48 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-87-6-207-235.retail.telecomitalia.it [87.6.207.235])
 by support.bugseng.com (Postfix) with ESMTPSA id 61D814EE073C;
 Wed,  6 Sep 2023 10:57:48 +0200 (CEST)
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
X-Inumbo-ID: 742b585f-4c93-11ee-9b0d-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 2/4] x86/io: address violations of MISRA C:2012 Rule 8.3
Date: Wed,  6 Sep 2023 10:57:39 +0200
Message-Id: <f1be66565b6a1155ee25a840ed62474ca9bc08a4.1693990010.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693990010.git.federico.serafini@bugseng.com>
References: <cover.1693990010.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make declarations consistent, no functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/io.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/io.h b/xen/arch/x86/include/asm/io.h
index 92b784a861..8c8a15bd06 100644
--- a/xen/arch/x86/include/asm/io.h
+++ b/xen/arch/x86/include/asm/io.h
@@ -51,6 +51,6 @@ __OUT(l,,int)
 #define IOEMUL_QUIRK_STUB_BYTES 9
 struct cpu_user_regs;
 extern unsigned int (*ioemul_handle_quirk)(
-    u8 opcode, char *io_emul_stub, struct cpu_user_regs *regs);
+    uint8_t opcode, char *io_emul_stub, struct cpu_user_regs *regs);
 
 #endif
-- 
2.34.1


