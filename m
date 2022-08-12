Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FBA5915DD
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 21:20:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385846.621620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMaC4-0007Ka-Ap; Fri, 12 Aug 2022 19:19:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385846.621620; Fri, 12 Aug 2022 19:19:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMaC4-0007Hs-7t; Fri, 12 Aug 2022 19:19:40 +0000
Received: by outflank-mailman (input) for mailman id 385846;
 Fri, 12 Aug 2022 19:19:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oMaC2-0007Hm-TJ
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 19:19:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMaC2-0000pg-Gz; Fri, 12 Aug 2022 19:19:38 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMaC2-0006Sz-74; Fri, 12 Aug 2022 19:19:38 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=Fz0+C4f7bozZC/MrmxJqWh27RYFvJRthKSx3P8U0yJI=; b=ZIXUgg
	rAoXNsGeIbgdUHSgWcMd5l2qGJjFZ95HH209JE0MGUz7cYAGYsLRpgZNzS4do+KRh6qXXQJCZr/K8
	/aaazVO4RYdRc3tXT17OaJbjSQJx+pC0cuvWNSVCb+NIohFltRn/ZGQO/vh1I5QEaLZfqgjy6sC4k
	4Ta6l7xTAjU=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Wei.Chen@arm.com,
	bertrand.marquis@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen/arm: Add xen/arch/arm/efi/stub.c in .gitignore
Date: Fri, 12 Aug 2022 20:19:30 +0100
Message-Id: <20220812191930.34494-1-julien@xen.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Xen build system the symbolic link xen/arch/arm/efi/stub.c. So we want
to ignore it.

Fixes: 7f96859b0d00 ("xen: reuse x86 EFI stub functions for Arm")
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index ed7bd8bdc76c..0d53eb304993 100644
--- a/.gitignore
+++ b/.gitignore
@@ -295,6 +295,7 @@ xen/.config
 xen/.config.old
 xen/.xen.elf32
 xen/System.map
+xen/arch/arm/efi/stub.c
 xen/arch/x86/boot/mkelf32
 xen/arch/x86/boot/cmdline.S
 xen/arch/x86/boot/reloc.S
-- 
2.37.1


