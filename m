Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC51C17620
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 00:38:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152488.1483051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDtGO-0006vW-BU; Tue, 28 Oct 2025 23:38:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152488.1483051; Tue, 28 Oct 2025 23:38:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDtGO-0006t5-7z; Tue, 28 Oct 2025 23:38:04 +0000
Received: by outflank-mailman (input) for mailman id 1152488;
 Tue, 28 Oct 2025 23:38:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zQG5=5F=raptorengineering.com=tpearson@srs-se1.protection.inumbo.net>)
 id 1vDtGN-0006sz-4g
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 23:38:03 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2407965b-b457-11f0-9d16-b5c5bf9af7f9;
 Wed, 29 Oct 2025 00:38:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 7753C7791D57
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 18:38:00 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 9zntJxIdC4hV for <xen-devel@lists.xenproject.org>;
 Tue, 28 Oct 2025 18:38:00 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 0E24E7791D5B
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 18:38:00 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id KRvzGiFkgJQM for <xen-devel@lists.xenproject.org>;
 Tue, 28 Oct 2025 18:37:59 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E1A5D7791D57
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 18:37:59 -0500 (CDT)
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
X-Inumbo-ID: 2407965b-b457-11f0-9d16-b5c5bf9af7f9
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 0E24E7791D5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1761694680; bh=98sCZ/5lmW4MQtLMOGYKGrgYjJi1JpqWMjhV9u1Lfok=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=T5RpCI3/GQWGtSvKCuDK/JkpEmMR8fk2WEbkxdc2B+Oovf2GrT2Ziws2cgFR1H/3y
	 Aye+yCNfb2R6uP9AmwQadRvzh77Yc8J7FJU/3sxKfSjeH4yZ2mZJY7e/BsYnBMahEP
	 zNklaOnnjOz622gfHJasqzOYasgWSH7iYGXErq+E=
X-Virus-Scanned: amavisd-new at rptsys.com
Date: Tue, 28 Oct 2025 18:37:57 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <1520444748.4126.1761694677296.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH] tools: Add barrier instructions for PPC64
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC141 (Linux)/8.5.0_GA_3042)
Thread-Index: wtRPPnQxuKh7ju3znita6VsnbTudgQ==
Thread-Topic: tools: Add barrier instructions for PPC64

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 tools/include/xen-barrier.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/include/xen-barrier.h b/tools/include/xen-barrier.h
index 5c22ee112c..e738a647a1 100644
--- a/tools/include/xen-barrier.h
+++ b/tools/include/xen-barrier.h
@@ -32,6 +32,10 @@
 #define xen_mb()   asm volatile ("dmb sy" : : : "memory")
 #define xen_rmb()  asm volatile ("dmb sy" : : : "memory")
 #define xen_wmb()  asm volatile ("dmb sy" : : : "memory")
+#elif defined(__ppc64__) || defined(__PPC64__)
+#define xen_mb()   asm volatile ("sync" : : : "memory")
+#define xen_rmb()  asm volatile ("sync" : : : "memory")
+#define xen_wmb()  asm volatile ("sync" : : : "memory")
 #else
 #error "Define barriers"
 #endif
-- 
2.39.5

