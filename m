Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 634488B2D96
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 01:32:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712324.1112946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s08Yd-0001pX-Qc; Thu, 25 Apr 2024 23:31:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712324.1112946; Thu, 25 Apr 2024 23:31:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s08Yd-0001mh-NZ; Thu, 25 Apr 2024 23:31:15 +0000
Received: by outflank-mailman (input) for mailman id 712324;
 Thu, 25 Apr 2024 23:31:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N29f=L6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s08Yc-0001mL-D2
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 23:31:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e36bccef-035b-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 01:31:07 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E68E661BD2;
 Thu, 25 Apr 2024 23:31:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E53CC113CC;
 Thu, 25 Apr 2024 23:31:04 +0000 (UTC)
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
X-Inumbo-ID: e36bccef-035b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714087865;
	bh=3hwlbemcdwx8Yy0QxfaWgHHGqAAgR057pv69Lpg+KfY=;
	h=Date:From:To:cc:Subject:From;
	b=rB57mkHLHQsy5X+aTUtZRWBZjUM6Ku/9cU68pkfIGuYhjwxGppSpP6AKielOqt23O
	 8WUItkyz3atKT/r0L0Yb0xZuTeTtXq6V5LkkT1gSyJ36t4f217PlIGpsAgccMV4ADD
	 j/e8F3bbePAe5KpU1uyaQmGCLtpsmdpWz0goo9nieWAV5VSjSOjhezCeOtuLKxFEBL
	 bi6/t4qgQjuFV8jrO5FP9xEHSlKgwEMYiziutDOinptnWIj9xMJUIZkdZayUzhmqYv
	 SVHiy7wvp1KxtVEr1/4BiwRoQhHJQJF7B2PtA8IhJHRecMtktBO/j0rxytKa4aYlQv
	 v+L6mB5Vs+jlg==
Date: Thu, 25 Apr 2024 16:31:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2] docs/misra: add R21.6 R21.9 R21.10 R21.14 R21.15 R21.16
Message-ID: <alpine.DEB.2.22.394.2404251629570.3940@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- remove trailing whitespaces
- add rules 21.9 and 21.10
- remove deviations.rst deviations (to be done separately if required)
- add a note explaning that Xen has no standard library
---
 docs/misra/rules.rst | 60 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index b7b447e152..661879a3de 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -652,12 +652,72 @@ maintainers if you want to suggest a change.
        declared
      - See comment for Rule 21.1
 
+   * - `Rule 21.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_06.c>`_
+     - Required
+     - The Standard Library input/output routines shall not be used
+     - Xen doesn't provide, use, or link against any Standard Library.
+       Xen implements itself a few functions with names that match the
+       corresponding function names of the Standard Library for
+       developers' convenience. These functions are part of the Xen code
+       and subject to analysis.
+
+   * - `Rule 21.9 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_09.c>`_
+     - Required
+     - The library functions bsearch and qsort of <stdlib.h> shall not be used
+     - Xen doesn't provide, use, or link against any Standard Library.
+       Xen implements itself a few functions with names that match the
+       corresponding function names of the Standard Library for
+       developers' convenience. These functions are part of the Xen code
+       and subject to analysis.
+
+   * - `Rule 21.10 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_10.c>`_
+     - Required
+     - The Standard Library time and date routines shall not be used
+     - Xen doesn't provide, use, or link against any Standard Library.
+       Xen implements itself a few functions with names that match the
+       corresponding function names of the Standard Library for
+       developers' convenience. These functions are part of the Xen code
+       and subject to analysis.
+
    * - `Rule 21.13 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_13.c>`_
      - Mandatory
      - Any value passed to a function in <ctype.h> shall be representable as an
        unsigned char or be the value EOF
      -
 
+   * - `Rule 21.14 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_14.c>`_
+     - Required
+     - The Standard Library function memcmp shall not be used to compare
+       null terminated strings
+     - Xen doesn't provide, use, or link against any Standard Library.
+       Xen implements itself a few functions with names that match the
+       corresponding function names of the Standard Library for
+       developers' convenience. These functions are part of the Xen code
+       and subject to analysis.
+
+   * - `Rule 21.15 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_15.c>`_
+     - Required
+     - The pointer arguments to the Standard Library functions memcpy,
+       memmove and memcmp shall be pointers to qualified or unqualified
+       versions of compatible types
+     - Xen doesn't provide, use, or link against any Standard Library.
+       Xen implements itself a few functions with names that match the
+       corresponding function names of the Standard Library for
+       developers' convenience. These functions are part of the Xen code
+       and subject to analysis.
+
+   * - `Rule 21.16 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_16.c>`_
+     - Required
+     - The pointer arguments to the Standard Library function memcmp
+       shall point to either a pointer type, an essentially signed type,
+       an essentially unsigned type, an essentially Boolean type or an
+       essentially enum type
+     - void* arguments are allowed. Xen doesn't provide, use, or link
+       against any Standard Library.  Xen implements itself a few
+       functions with names that match the corresponding function names
+       of the Standard Library for developers' convenience. These
+       functions are part of the Xen code and subject to analysis.
+
    * - `Rule 21.17 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_17.c>`_
      - Mandatory
      - Use of the string handling functions from <string.h> shall not result in
-- 
2.25.1


