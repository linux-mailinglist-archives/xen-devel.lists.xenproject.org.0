Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B170E87B00A
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 19:41:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692726.1080121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkTXl-0006Q9-MC; Wed, 13 Mar 2024 18:41:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692726.1080121; Wed, 13 Mar 2024 18:41:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkTXl-0006NG-Ij; Wed, 13 Mar 2024 18:41:37 +0000
Received: by outflank-mailman (input) for mailman id 692726;
 Wed, 13 Mar 2024 18:41:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1rkTXk-0006N8-2C
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 18:41:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1rkTXj-0004uH-Us; Wed, 13 Mar 2024 18:41:35 +0000
Received: from ec2-63-33-11-17.eu-west-1.compute.amazonaws.com ([63.33.11.17]
 helo=REM-PW02S00X.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1rkTXj-0002Ct-Hp; Wed, 13 Mar 2024 18:41:35 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=N9fRCgST6Y0xZgmCssbdnEf4QwnDWFyNxFJ9at5808g=; b=eP/fvdhG/fEQXgzkEhzn5A6z+c
	h1qNDJopJyJnCtrjxh6SpgTK7XVpuY/byHAdVHB/EBgxpYGvtm0toBBeijEUBi3a3MNZ4opjb1bFP
	E24PiY4GU0WG/GFWxhPwTV1WMzZRZp3q8b/0GlN4jzdOyI9yXM3pu0RYX4NEEDEMmJnE=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] MAINTAINERS: Remove myself from several subsystems
Date: Wed, 13 Mar 2024 18:41:25 +0000
Message-Id: <20240313184125.39185-1-paul@xen.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

I am not as actively involved with the Xen project as I once was so I need
to relinquish some of my maintainer responsibilities: IOMMU and I/O
emulation.

NOTE: Since I am sole maintainer for I/O EMULATION (IOREQ) and
      X86 I/O EMULATION, these sections are removed.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
---
 MAINTAINERS | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 56a6932037fe..b2cc3cc3921b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -358,7 +358,6 @@ F:	xen/drivers/passthrough/vtd/
 
 IOMMU VENDOR INDEPENDENT CODE
 M:	Jan Beulich <jbeulich@suse.com>
-M:	Paul Durrant <paul@xen.org>
 R:	Roger Pau Monné <roger.pau@citrix.com>
 S:	Supported
 F:	xen/drivers/passthrough/
@@ -368,13 +367,6 @@ X:	xen/drivers/passthrough/vtd/
 X:	xen/drivers/passthrough/device_tree.c
 F:	xen/include/xen/iommu.h
 
-I/O EMULATION (IOREQ)
-M:	Paul Durrant <paul@xen.org>
-S:	Supported
-F:	xen/common/ioreq.c
-F:	xen/include/xen/ioreq.h
-F:	xen/include/public/hvm/ioreq.h
-
 KCONFIG
 M:	Doug Goldstein <cardoe@cardoe.com>
 S:	Supported
@@ -608,18 +600,6 @@ F:	tools/misc/xen-cpuid.c
 F:	tools/tests/cpu-policy/
 F:	tools/tests/x86_emulator/
 
-X86 I/O EMULATION
-M:	Paul Durrant <paul@xen.org>
-S:	Supported
-F:	xen/arch/x86/hvm/emulate.c
-F:	xen/arch/x86/hvm/intercept.c
-F:	xen/arch/x86/hvm/io.c
-F:	xen/arch/x86/hvm/ioreq.c
-F:	xen/arch/x86/include/asm/hvm/emulate.h
-F:	xen/arch/x86/include/asm/hvm/io.h
-F:	xen/arch/x86/include/asm/hvm/ioreq.h
-F:	xen/arch/x86/include/asm/ioreq.h
-
 X86 MEMORY MANAGEMENT
 M:	Jan Beulich <jbeulich@suse.com>
 M:	Andrew Cooper <andrew.cooper3@citrix.com>
-- 
2.39.2


