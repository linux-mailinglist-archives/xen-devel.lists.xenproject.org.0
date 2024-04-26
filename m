Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3928B414B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 23:36:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713137.1114151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0TFJ-0004mZ-MQ; Fri, 26 Apr 2024 21:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713137.1114151; Fri, 26 Apr 2024 21:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0TFJ-0004jv-IF; Fri, 26 Apr 2024 21:36:41 +0000
Received: by outflank-mailman (input) for mailman id 713137;
 Fri, 26 Apr 2024 21:36:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tzl=L7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s0TFH-0004jp-Hl
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 21:36:39 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d49ed1f-0415-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 23:36:36 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2F176CE1C1F;
 Fri, 26 Apr 2024 21:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E266C113CD;
 Fri, 26 Apr 2024 21:36:29 +0000 (UTC)
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
X-Inumbo-ID: 0d49ed1f-0415-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714167390;
	bh=9GYZQex2/gm04Q/M2dnesvyzpTgonNuQh7Av2l719Jc=;
	h=Date:From:To:cc:Subject:From;
	b=EOkeu81HEYwxGXgYbxBafUXDlFJLASFzr3428W2VdexCf/aArKX5Ceydmh5UuBlnV
	 u27eVrWfu5/yap/r3l+WQ582cp6NwyFGeBaqgWEZp9vAIBFYuZ3YztTF56NYkVxj4J
	 dnWGsYXBucK4xkYfx+MKs9xagSpDjwF0iuH2JSjOsiogmiUs+bm1WsJq1Jx22b/7s0
	 SjZK7lAkdFYFVoSirR4OAvlBFg7IrQHMPachpUiUBGhxxTaPwUBMp00hW9sGegXGNJ
	 DxKtrheeun4TAV6z2AkMWQLsTBC33PQutInGYGYQU/e5R8+q53hjPb5S3yi8AB/twI
	 FvbL6CHMgS+Jg==
Date: Fri, 26 Apr 2024 14:36:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v3] docs/misra: add R21.6 R21.9 R21.10 R21.14 R21.15 R21.16
Message-ID: <alpine.DEB.2.22.394.2404261435010.3940@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---

Changes in v3:
- add explanation in footnote
- remove comment from 21.14, 21.15, 21.16

 docs/misra/rules.rst | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index b7b447e152..5ba7394f05 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -652,12 +652,48 @@ maintainers if you want to suggest a change.
        declared
      - See comment for Rule 21.1
 
+   * - `Rule 21.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_06.c>`_
+     - Required
+     - The Standard Library input/output routines shall not be used
+     - Xen doesn't provide, use, or link against a Standard Library [1]_
+
+   * - `Rule 21.9 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_09.c>`_
+     - Required
+     - The library functions bsearch and qsort of <stdlib.h> shall not be used
+     - Xen doesn't provide, use, or link against a Standard Library [1]_
+
+   * - `Rule 21.10 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_10.c>`_
+     - Required
+     - The Standard Library time and date routines shall not be used
+     - Xen doesn't provide, use, or link against a Standard Library [1]_
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
+     -
+
+   * - `Rule 21.15 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_15.c>`_
+     - Required
+     - The pointer arguments to the Standard Library functions memcpy,
+       memmove and memcmp shall be pointers to qualified or unqualified
+       versions of compatible types
+     -
+
+   * - `Rule 21.16 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_16.c>`_
+     - Required
+     - The pointer arguments to the Standard Library function memcmp
+       shall point to either a pointer type, an essentially signed type,
+       an essentially unsigned type, an essentially Boolean type or an
+       essentially enum type
+     - void* arguments are allowed
+
    * - `Rule 21.17 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_17.c>`_
      - Mandatory
      - Use of the string handling functions from <string.h> shall not result in
@@ -712,3 +748,9 @@ maintainers if you want to suggest a change.
      - The value of a pointer to a FILE shall not be used after the associated
        stream has been closed
      -
+
+
+.. [1] Xen implements itself a few functions with names that match the
+       corresponding function names of the Standard Library for developers'
+       convenience. These functions are part of the Xen code and subject to
+       analysis.
-- 
2.25.1


