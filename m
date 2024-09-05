Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBF096DEE3
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 17:49:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791235.1201083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smEjY-0001TA-SI; Thu, 05 Sep 2024 15:49:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791235.1201083; Thu, 05 Sep 2024 15:49:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smEjY-0001RD-O2; Thu, 05 Sep 2024 15:49:20 +0000
Received: by outflank-mailman (input) for mailman id 791235;
 Thu, 05 Sep 2024 15:49:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N7ia=QD=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1smEjW-0000mM-AZ
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 15:49:18 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67d09bde-6b9e-11ef-99a1-01e77a169b0f;
 Thu, 05 Sep 2024 17:49:16 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-87-1-204-86.retail.telecomitalia.it [87.1.204.86])
 by support.bugseng.com (Postfix) with ESMTPSA id 6A0824EE07CF;
 Thu,  5 Sep 2024 17:49:13 +0200 (CEST)
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
X-Inumbo-ID: 67d09bde-6b9e-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725551355; bh=Izc9o/MJB7uDiFo7vIuphRiFcow3rSsmmhqILr+ETzg=;
	h=From:To:Cc:Subject:Date:From;
	b=B8oyc+QtbEr08AqpB0iyxIMmXgqEbpxcfONaK0TWTRUHBOSHBG6Lkb2b08tn/TXQM
	 Kdvq9aEGfwpbXOZI9YUMX0XFzBDfIkvIrJJTf2Q1NbX24ZncgoqPWSZXzqEB4mWAQP
	 uGfdinYpdSs5k0JoxeBL9r43pACQ90pwVoqiHXJBj0N8m6rHa6VWlAsotTYdjAv4on
	 NTx0wDve2rkThYUXb4QbybB/SS9/4MySVdruQRTXaBZDidFpCPFwAQM953md1W20ub
	 fcYnTk9KoE4M5eerJPjcI1ONoCiY5M/+fUTXuj+Z8CbHBvwSF1a7qegOR5V8Ce8P8w
	 7rwxW6HI0YyAg==
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v6] CODING_STYLE: Add a section on header guards naming conventions
Date: Thu,  5 Sep 2024 17:48:49 +0200
Message-Id: <a68267c7465a9b0d2ed8f844a5e0145de50b0f3a.1725550985.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This section explains which format should be followed by header
inclusion guards via a drop-down list of rules.

No functional change.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

---
Changes in v6:
- edit inclusion guards naming conventions, including more details
Changes in v5:
- edit inclusion guards naming conventions, according to feedback
  received

Note:
This patch is part of a 17-element patch series, which can be found at
the following link:
https://lore.kernel.org/xen-devel/cover.1721720583.git.alessandro.zucchelli@bugseng.com/
Since this is the only patch that required revision, and as requested by
the maintainers, it is now submitted as a standalone patch.
---
 CODING_STYLE | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/CODING_STYLE b/CODING_STYLE
index 7f6e9ad065..711f6811f8 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -159,6 +159,34 @@ Emacs local variables
 A comment block containing local variables for emacs is permitted at
 the end of files.  It should be:
 
+Header inclusion guards
+-----------------------
+
+Unless otherwise specified, all header files should include proper
+guards to prevent multiple inclusions. The following naming conventions
+apply:
+
+- Private headers: <dir>__<filename>_H
+    - arch/arm/arm64/lib/something.h -> ARM__ARM64__LIB__SOMETHING_H
+    - arch/arm/arm32/lib/something.h -> ARM__ARM32__LIB__SOMETHING_H
+    - arch/x86/lib/something.h -> X86__LIB__SOMETHING_H
+
+- asm-generic headers: ASM_GENERIC__<filename>_H
+    - include/asm-generic/something.h -> ASM_GENERIC__SOMETHING_H
+
+- arch-specific headers: ASM__<architecture>__<subdir>__<filename>_H
+    - arch/x86/include/asm/something.h -> ASM__X86__SOMETHING_H
+
+- Xen headers: XEN__<filename>_H
+    - include/xen/something.h -> XEN__SOMETHING_H
+
+Notes:
+
+- Filenames and directories are converted to uppercase.
+- Non-alphanumeric characters are converted to underscores.
+- Directories, subdirectories, and filenames are separated by double
+  underscores.
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


