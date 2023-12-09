Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F69980B184
	for <lists+xen-devel@lfdr.de>; Sat,  9 Dec 2023 02:39:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650842.1016673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBmJf-0006mx-VQ; Sat, 09 Dec 2023 01:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650842.1016673; Sat, 09 Dec 2023 01:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBmJf-0006lI-Sa; Sat, 09 Dec 2023 01:39:39 +0000
Received: by outflank-mailman (input) for mailman id 650842;
 Sat, 09 Dec 2023 01:39:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dmD7=HU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rBmJe-0006lC-5J
 for xen-devel@lists.xenproject.org; Sat, 09 Dec 2023 01:39:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ceec90bf-9633-11ee-98e8-6d05b1d4d9a1;
 Sat, 09 Dec 2023 02:39:36 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2009062643;
 Sat,  9 Dec 2023 01:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A49C433C7;
 Sat,  9 Dec 2023 01:39:33 +0000 (UTC)
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
X-Inumbo-ID: ceec90bf-9633-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702085974;
	bh=Q2GzXjIXdKxRwIccBhM03LNp5hdlLKWdzIqiG/AbYYc=;
	h=Date:From:To:cc:Subject:From;
	b=b715I5ThEGu+esTcB5wXiQzlhGS+rT6kJAsuXvZCqxdRWt4u8ypsVelnqGRC+t6u0
	 xwoGNTqYNK7XeogSTXKL2RBx4EutoZ7pUwTgYb1o0vtFJuLn0IjZQEx3rOpNtiUk/c
	 FElSY/wIEhqs8IHQlVo3tMk3m4x9iNiwz1oYv4prWVCtTxzfm/0LzJCu4vM/z7RItx
	 DzNBGoeG62b5wN/7zWhoXuygKpnKS1Td21tJmBluGYOAZG1sLJTefuVkpw1XFkHhaz
	 DoWxXOjlzFyHLXiadb+euhEDef0glwy32/GGVR+Te4t2fkop1yiSlKlzV98tRFv/zI
	 D81AeeItrDu1A==
Date: Fri, 8 Dec 2023 17:39:31 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: andrew.cooper3@citrix.com, jbeulich@suse.com, george.dunlap@citrix.com, 
    julien@xen.org, sstabellini@kernel.org, bertrand.marquis@arm.com, 
    roger.pau@citrix.com, roberto.bagnara@bugseng.com, 
    federico.serafini@bugseng.com
Subject: [PATCH v2] docs/misra/rules.rst: add Rule 17.1
Message-ID: <alpine.DEB.2.22.394.2312081738100.1703076@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- separated 17.1 in its own patch
- add a comment

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 8a659d8d47..f29b4c3d9a 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -189,6 +189,12 @@ existing codebase are work-in-progress.
      - A switch-expression shall not have essentially Boolean type
      -
 
+   * - `Rule 17.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_01.c>`_
+     - Required
+     - The features of <stdarg.h> shall not be used
+     - It is understood that in some limited circumstances <stdarg.h> is
+       appropriate to use, such as the implementation of printk.
+
    * - `Rule 17.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_03.c>`_
      - Mandatory
      - A function shall not be declared implicitly

