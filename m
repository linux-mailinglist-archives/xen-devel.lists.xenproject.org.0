Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CCFB157C0
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 05:13:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063318.1429056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugxFL-0008FH-Ib; Wed, 30 Jul 2025 03:12:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063318.1429056; Wed, 30 Jul 2025 03:12:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugxFL-0008Cu-Et; Wed, 30 Jul 2025 03:12:51 +0000
Received: by outflank-mailman (input) for mailman id 1063318;
 Wed, 30 Jul 2025 03:12:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Z10=2L=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ugxFJ-0008Cm-Cj
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 03:12:50 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 113f478c-6cf3-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 05:12:47 +0200 (CEST)
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
X-Inumbo-ID: 113f478c-6cf3-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=3giom75fa5dt3kt6ejr66yxyym.protonmail; t=1753845166; x=1754104366;
	bh=qKPUNKV6U2Xni1W4Y2g4OPVCae1qvTa4Tanv4yev35k=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=UQQUaaBOw6G7rmdr+g9+wqgB0P7801XoAQrQAqHdjiBFzmBP+AOz7Fs6KG6g2uaqU
	 9oRu/R0ciZs0r7x5gZHgCkUs40zFcE9Tyc3sU6ZU5Cwr+Th9Y3LCnA59Vy0RGh6hL6
	 ZM4oknby3WZ09eFE6QMokCSzieDIleOGOvmxOh3XRNXDOachBrwkBMXQBH/v2NUPCL
	 161emgEiHv0FJUwPPNT70acE+Id44rC9+8T0bl1mwQGGlUD0Xj+fHS8YQayU/zoKCb
	 QCtRA02fClPtmoGFh/q40sTVelEWludAeittch/pT306LpP9ocNP2kTs+YmHJI94p4
	 uCMtpul7zrQQQ==
Date: Wed, 30 Jul 2025 03:12:40 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH] ns16550: remove trailing whitespaces
Message-ID: <20250730031148.1613104-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 4c67f892e43d0b355b7391dc1b863b7909c4e495
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Remove trailing whitespaces in NS16550-compatible UART driver.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/ns16550.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 0bbbafb49f6d..df7fff7f81df 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1,10 +1,10 @@
 /*************************************************************************=
*****
  * ns16550.c
- *=20
+ *
  * Driver for 16550-series UARTs. This driver is to be kept within Xen as
  * it permits debugging of seriously-toasted machines (e.g., in situations
  * where a device driver within a guest OS would be inaccessible).
- *=20
+ *
  * Copyright (c) 2003-2005, K A Fraser
  */
=20
@@ -688,13 +688,13 @@ static int __init parse_parity_char(int c)
     {
     case 'n':
         return UART_PARITY_NONE;
-    case 'o':=20
+    case 'o':
         return UART_PARITY_ODD;
-    case 'e':=20
+    case 'e':
         return UART_PARITY_EVEN;
-    case 'm':=20
+    case 'm':
         return UART_PARITY_MARK;
-    case 's':=20
+    case 's':
         return UART_PARITY_SPACE;
     }
     return 0;
--=20
2.34.1



