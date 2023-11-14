Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D377EBA29
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 00:13:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633383.988142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r32aZ-0002Ag-5F; Tue, 14 Nov 2023 23:12:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633383.988142; Tue, 14 Nov 2023 23:12:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r32aZ-000280-2F; Tue, 14 Nov 2023 23:12:59 +0000
Received: by outflank-mailman (input) for mailman id 633383;
 Tue, 14 Nov 2023 23:12:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wE9C=G3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r32aX-00027m-Mg
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 23:12:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 575ea215-8343-11ee-9b0e-b553b5be7939;
 Wed, 15 Nov 2023 00:12:55 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E8977614C6;
 Tue, 14 Nov 2023 23:12:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B2A5C433C7;
 Tue, 14 Nov 2023 23:12:52 +0000 (UTC)
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
X-Inumbo-ID: 575ea215-8343-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700003573;
	bh=MJwqOLCXiv/cq1mpQ9LZbnoB6FsQ1T2+CZlcPq8MhOA=;
	h=Date:From:To:cc:Subject:From;
	b=tIA1ui5lo8Hh0xixkI2OXSiiRtxhRzzs8gEUvra3XP3maw1yzWJsSS8IvbpG19Uyw
	 xVThMxuKJOVs6z8LUjk4oem4H4kaxKZ+qfkbfMnQnZSl9f0QCIuXU6CqBWAToesfiG
	 fMKKWAbK0ym8FEWprL+SSVLSCF4qqRBOqOGF0uvZ8NYQr1ByYMs9I7Fvxs36ADGnAt
	 x5Q4Al3Nec1/RD6OIwyKesq+bzaoBmWGGG8dS9c2bLbDEVb/bvoFkhliueMlWrZa1A
	 J6sWG/YYNnT/qbqu465nj16DCRT+78dhfQtC3ufaOwNqVy6Q5PHf/k3Cl4vJTykzkS
	 ndp4VUeUxwy0Q==
Date: Tue, 14 Nov 2023 15:12:51 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>
Subject: [PATCH] docs/misra: add R16.2 and R16.3
Message-ID: <alpine.DEB.2.22.394.2311141511510.160649@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

For Rule 16.2 deviate xen/arch/x86/x86_emulate.
For Rule 16.2 allow control flow statements and terminals. For the rest,
request the "fallthrough" psedo-keyword to be used.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 docs/misra/rules.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 375a886607..926ecc9d82 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -462,6 +462,20 @@ maintainers if you want to suggest a change.
 
        while(0) and while(1) and alike are allowed.
 
+   * - `Rule 16.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_02.c>`_
+     - Required
+     - A switch label shall only be used when the most closely-enclosing
+       compound statement is the body of a switch statement
+     - xen/arch/x86/x86_emulate/ doesn't follow this guideline
+
+   * - `Rule 16.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_03.c>`_
+     - Required
+     - An unconditional break statement shall terminate every
+       switch-clause
+     - Control flow statements (goto, return, continue) and terminals
+       (BUG()) are permitted. Other cases shall have the pseudo-keyword
+       "fallthrough".
+
    * - `Rule 16.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_07.c>`_
      - Required
      - A switch-expression shall not have essentially Boolean type
-- 
2.25.1


