Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D905387C6C9
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 01:35:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693600.1081948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkvXU-0002Ef-T3; Fri, 15 Mar 2024 00:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693600.1081948; Fri, 15 Mar 2024 00:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkvXU-0002Co-Q4; Fri, 15 Mar 2024 00:35:12 +0000
Received: by outflank-mailman (input) for mailman id 693600;
 Fri, 15 Mar 2024 00:35:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nznT=KV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rkvXT-0002Cc-Aq
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 00:35:11 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfcce535-e263-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 01:35:09 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 53B23CE1F0B;
 Fri, 15 Mar 2024 00:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72127C433C7;
 Fri, 15 Mar 2024 00:35:05 +0000 (UTC)
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
X-Inumbo-ID: dfcce535-e263-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710462906;
	bh=0w+MdDqKlm43yhbmnOm/SBn6kayFfUY9JQ+jwjYZNAk=;
	h=Date:From:To:cc:Subject:From;
	b=EgCvpnQJ1arwCbQPhXpdsbADIVI4MCkiD8gkG4tsuJSTaj+zwpMpoN0BU4zxeaR9W
	 olKBXyPS+ChghFa3dJ3flEnw4bu/vXJPlbP3BJEbfwhuCsQxQKhqZrdUIv+j/Ndo3Q
	 HKzL0tquheXnBca2RBeNkP7O7QDEXphcj3umw28H5jjkKtfa6FVG9S3BtiEMW+6pQ5
	 D9UdIzDqh+HilkC8ufi1JxtgRjTRE+MtoPQhhDxX2SaXY5a98sfhiU8LBBLusWZgzm
	 1oywlRQsrdeVzprEy5nS1+UW+3aJ1zIEBuZYZjuXafxCxeZedQsjmA7QYZUyIBQOXQ
	 LvR4NZmwt1/xA==
Date: Thu, 14 Mar 2024 17:35:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: andrew.cooper3@citrix.com, bertrand.marquis@arm.com, 
    george.dunlap@citrix.com, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org
Subject: [PATCH v3] docs/misra/rules.rst: add rule 5.5
Message-ID: <alpine.DEB.2.22.394.2403141733460.853156@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v3:
- better clarify what is allowed and not allowed with examples
---
 docs/misra/rules.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 1e134ccebc..5766b2286d 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -181,6 +181,21 @@ maintainers if you want to suggest a change.
        headers (xen/include/public/) are allowed to retain longer
        identifiers for backward compatibility.
 
+   * - `Rule 5.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_05.c>`_
+     - Required
+     - Identifiers shall be distinct from macro names
+     - Macros expanding to their own name are allowed, e.g.::
+
+           #define x x
+
+       Clashes between names of function-like macros and identifiers of
+       non-callable entities are allowed. Callable entities having an
+       identifier that is the same of the name of a
+       function-like macro are not allowed. Example (not allowed)::
+
+           #define f(x, y) f(x, y);
+           void f(int x, int y);
+
    * - `Rule 5.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_06.c>`_
      - Required
      - A typedef name shall be a unique identifier
-- 
2.25.1


