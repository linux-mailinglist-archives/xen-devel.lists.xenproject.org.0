Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F958A74B0
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 21:29:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707091.1104598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwoTC-0001ux-NH; Tue, 16 Apr 2024 19:27:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707091.1104598; Tue, 16 Apr 2024 19:27:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwoTC-0001rl-KM; Tue, 16 Apr 2024 19:27:54 +0000
Received: by outflank-mailman (input) for mailman id 707091;
 Tue, 16 Apr 2024 19:27:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ggj+=LV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rwoTA-0001rd-Db
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 19:27:52 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6729aa58-fc27-11ee-94a3-07e782e9044d;
 Tue, 16 Apr 2024 21:27:48 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E4E8FCE117E;
 Tue, 16 Apr 2024 19:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4A2C4AF0C;
 Tue, 16 Apr 2024 19:27:42 +0000 (UTC)
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
X-Inumbo-ID: 6729aa58-fc27-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713295663;
	bh=U8tzrv9FyflCl7J9eLzS/qexsRCa8ukLXPjHuTuQzyA=;
	h=Date:From:To:cc:Subject:From;
	b=ZwgIWEcaYaV3JwNyC2A3W4sKaOknkqfPGlSq+NwKc0OCWviJkcQbNs9CU559o9gsK
	 5xv+reMGMHKcYCgShB2x3Hns5+jRbVuDUbfWDRxIhGXTwDE9Z9xNjWf9BEix+iarCR
	 GezzofNcZl94EFTUTe/hzQxLEd0//PkTCe1/iq9LG0LV4VUCvuLTR4E61/FSNaCv1d
	 cX5G36tfNmu/2M8V3lh86wD4Z/t6AhfDa5XmwdRGDIZOR01zmfw5S8KvHG+jffcgUq
	 UoWWiirz76ILIJzEWsjceLLvyv8OW/u3JSJ2jD2kiE/t73FbEizPPIA/CY1p1BdRo7
	 TDlFwbWTtC0Vg==
Date: Tue, 16 Apr 2024 12:27:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: docs/misra: add R21.6 R21.14 R21.15 R21.16
Message-ID: <alpine.DEB.2.22.394.2404161227340.2257106@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Also add two specific project-wide deviations for R21.6 and R21.15.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 32b02905d1..9123c8edb5 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -387,6 +387,22 @@ Deviations related to MISRA C:2012 Rules:
        of the Rule due to uses of this macro.
      - Tagged as `deliberate` for ECLAIR.
 
+   * - R21.6
+     - The use of snprintf() and vsnprintf() is justifiable as, despite
+       the fact that such functions have the same names of the
+       corresponding standard library functions, each configuration of
+       Xen has a unique implementation for them; the code implementing
+       such functions is subject to the analysis, so that any undefined
+       or unspecified behavior associated to them falls under the
+       responsibility of other MISRA guidelines
+     - Tagged as `safe` for ECLAIR.
+
+   * - R21.15
+     - The use of void* arguments is justifiable as the rationale for
+       the rule is to indicate possible mistakes, and void* is
+       frequently used in Xen to represent virtual memory addresses
+     - Tagged as `deliberate` for ECLAIR.
+
 Other deviations:
 -----------------
 
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index b7b447e152..00db02ad34 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -652,12 +652,38 @@ maintainers if you want to suggest a change.
        declared
      - See comment for Rule 21.1
 
+   * - `Rule 21.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_06.c>`_
+     - Required
+     - The Standard Library input/output routines shall not be used
+     - See the snprintf() and vsnprintf() deviation in deviations.rst
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
+     - void* arguments are allowed, see deviations.rst
+
+   * - `Rule 21.16 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_16.c>`_
+     - Required
+     - The pointer arguments to the Standard Library function memcmp
+       shall point to either a pointer type, an essentially signed type,
+       an essentially unsigned type, an essentially Boolean type or an
+       essentially enum type 
+     -
+
    * - `Rule 21.17 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_17.c>`_
      - Mandatory
      - Use of the string handling functions from <string.h> shall not result in

