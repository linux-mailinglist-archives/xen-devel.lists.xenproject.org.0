Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E72B2596EEC
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 15:05:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388898.625673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOIic-00023p-If; Wed, 17 Aug 2022 13:04:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388898.625673; Wed, 17 Aug 2022 13:04:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOIic-00020l-FR; Wed, 17 Aug 2022 13:04:22 +0000
Received: by outflank-mailman (input) for mailman id 388898;
 Wed, 17 Aug 2022 13:04:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SWwd=YV=citrix.com=prvs=2218cd774=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1oOIib-00020f-BK
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 13:04:21 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a5646fa-1e2d-11ed-bd2e-47488cf2e6aa;
 Wed, 17 Aug 2022 15:04:19 +0200 (CEST)
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
X-Inumbo-ID: 1a5646fa-1e2d-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660741459;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oV5jxY3Vy7N0wcLDUpSIFHleyGJVQ5PLv9TuzrzLEG0=;
  b=F1xqgJeH55PF++a9RusnwdZtsDZMTEspSiYD4CLzkY6WpABW4bpl30ZT
   i52u2b8UTj/zYEekXVNbYmxkbgHPbkLUkZb54b1703Ff8xSEicrn0x9l/
   ZRHuBDxg0Leje/cnic1Wkpqj8kHQbV1QV7krHq4sMFQSHNqbGb0MhD5bN
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80840540
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:83LLY6+2eI0LQfJN201/DrUD7H6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 zYcWmGBOq3ZNmD1et5zOYrgoEoB6sOGndNrSQVrpHs8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9z8kvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0gFaYDkpOs/jZ8EM246yr0N8llgdWic5j7Qe2e0Y9VPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhViroz6ZGBiuVIPM0SWuTBQpzRa70oOHKF0hXG7Kdm+t4sZJ
 N1l7fRcQOqyV0HGsLx1vxJwS0mSMUDakVNuzLfWXcG7liX7n3XQL/pGVBwQDIEk+9tLMXhn8
 99BNzsodhuAiLfjqF67YrEEasULKcDqOMUUu216zCGfBvEjKXzBa/yUv5kChm52350QW6aFD
 yYaQWMHgBDoQRRJNxEyAZY3mO6ui1H0ciFCqULTrq0yi4TW5FwpgOS1bYaNEjCMbZ4NtFSRn
 TjAxFSjWwBdH9K9xxS86Fv504cjmgukAdlPRdVU7MVCn1m71mEVThoMWjOTo/O0l0q/UNJ3M
 FEP92wlqq1a3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQA5oiVpMYJ88pVsHHpzi
 wHPz4iB6SFTXKO9ES+7x7uorA6OCTE8K0xbeiQhVQAG7Iy2yG0stS4jXuqPAYbs0IOtR2qqn
 2HXxMQtr+5N1JBWjs1X6XiC2mvx/caRE2bZ8y2NBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/5nzvp5pyBWG3TZS82AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaN51sPu8MCbSfzNvMfj2eN5yMCnMDd+SnNDKiIPrKinLArHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6RMJruMow+lWLeb7pMjtcWKtUWnzy7qWbTk0v6itJzpRe9Fd84Dbd5Rr5gsfzb+FuKr
 b6y9aKikn1ibQE3WQGPmaZ7ELzABSFT6UzewyCPStO+Hw==
IronPort-HdrOrdr: A9a23:4IfX3a3b1CpZWjZRw/N/QwqjBL4kLtp133Aq2lEZdPRUGvb3qy
 nIpoV96faUskd0ZJhOo7C90cW7LU80lqQFhLX5X43SPzUO0VHAROoJgLcKqweQfREWndQ96U
 4PScdD4aXLfDpHsfo=
X-IronPort-AV: E=Sophos;i="5.93,243,1654574400"; 
   d="scan'208";a="80840540"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2] x86/entry: move .init.text section higher up in the code for readability
Date: Wed, 17 Aug 2022 14:03:45 +0100
Message-ID: <20220817130345.28669-1-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

.init.text is a small section currently located amongst .text.entry
code. Move it above .text.entry.

This has no functional change but makes the code a bit more readable.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * code style
 * replace incorrect .popsection with .section
 * add commit message
---
 xen/arch/x86/x86_64/entry.S | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 26bf2f1941..9b34150bc7 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -140,6 +140,15 @@ process_trap:
         call create_bounce_frame
         jmp  test_all_events
 
+        .section .init.text, "ax", @progbits
+ENTRY(early_page_fault)
+        ENDBR64
+        movl  $TRAP_page_fault, 4(%rsp)
+        SAVE_ALL
+        movq  %rsp, %rdi
+        call  do_early_page_fault
+        jmp   restore_all_xen
+
         .section .text.entry, "ax", @progbits
 
 /* %rbx: struct vcpu, interrupts disabled */
@@ -982,16 +991,6 @@ ENTRY(double_fault)
         call  do_double_fault
         BUG   /* do_double_fault() shouldn't return. */
 
-        .pushsection .init.text, "ax", @progbits
-ENTRY(early_page_fault)
-        ENDBR64
-        movl  $TRAP_page_fault,4(%rsp)
-        SAVE_ALL
-        movq  %rsp,%rdi
-        call  do_early_page_fault
-        jmp   restore_all_xen
-        .popsection
-
 ENTRY(nmi)
         ENDBR64
         pushq $0
-- 
2.11.0


