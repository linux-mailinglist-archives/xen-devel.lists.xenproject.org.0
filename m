Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CAA6FFD3F
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 01:23:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533662.830490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxFcT-00005m-Rd; Thu, 11 May 2023 23:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533662.830490; Thu, 11 May 2023 23:22:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxFcT-0008UV-Oo; Thu, 11 May 2023 23:22:45 +0000
Received: by outflank-mailman (input) for mailman id 533662;
 Thu, 11 May 2023 23:22:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eoy0=BA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pxFcS-0008UP-N2
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 23:22:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba26587c-f052-11ed-b229-6b7b168915f2;
 Fri, 12 May 2023 01:22:42 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8C56065283;
 Thu, 11 May 2023 23:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE4F9C433D2;
 Thu, 11 May 2023 23:22:39 +0000 (UTC)
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
X-Inumbo-ID: ba26587c-f052-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683847361;
	bh=fm56nYRPn8WoeCpx9USW1lPIRzH1T19T/S8+YXGvkn0=;
	h=From:To:Cc:Subject:Date:From;
	b=HF65XH8mKAPt4SOhO1tBxNFaOBqLVkppKVQ1I1ItoLkK5SvQA959/iCwyHeKBRQUo
	 E1Quahst0Dj1SYHf9W3KHxvXrLGZPAA/lIR9V1HWiknMYBjv0aES79TgnK0hCDl/Zn
	 Du7hMk+wDTW04yNdmOE7aqoxKyirlX+LiMXsVqBz9g3yk5bX3SSwMxIzPJewA6o+Yx
	 a4ajwIOVBS4gwmQKo5pVyvKf7W5tRm8djM8t7GmW4jUeUQPhwSFw9SNIxcARJUJTeq
	 TcuDx/i+K3OQgOOB9CautTkCX9nskijwsGPII+hgyfrfQEiyCbnfUOS7JdtmWJikYU
	 O5yNwNsi4f5dw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	sstabellini@kernel.org,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH] docs/misra: adds Mandatory rules
Date: Thu, 11 May 2023 16:22:37 -0700
Message-Id: <20230511232237.3720769-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Add the Mandatory rules agreed by the MISRA C working group to
docs/misra/rules.rst.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 docs/misra/rules.rst | 62 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 83f01462f7..d5a6ee8cb6 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -204,6 +204,12 @@ existing codebase are work-in-progress.
        braces
      -
 
+   * - `Rule 12.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_12_05.c>`_
+     - Mandatory
+     - The sizeof operator shall not have an operand which is a function
+       parameter declared as "array of type"
+     -
+
    * - `Rule 13.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_13_06.c>`_
      - Mandatory
      - The operand of the sizeof operator shall not contain any
@@ -274,3 +280,59 @@ existing codebase are work-in-progress.
        in the same file as the #if #ifdef or #ifndef directive to which
        they are related
      -
+
+   * - `Rule 21.13 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_13.c>`_
+     - Mandatory
+     - Any value passed to a function in <ctype.h> shall be representable as an
+       unsigned char or be the value EOF
+     -
+
+   * - `Rule 21.17 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_17.c>`_
+     - Mandatory
+     - Use of the string handling functions from <string.h> shall not result in
+       accesses beyond the bounds of the objects referenced by their pointer
+       parameters
+     -
+
+   * - `Rule 21.18 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_18.c>`_
+     - Mandatory
+     - The size_t argument passed to any function in <string.h> shall have an
+       appropriate value
+     -
+
+   * - `Rule 21.19 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_19.c>`_
+     - Mandatory
+     - The pointers returned by the Standard Library functions localeconv,
+       getenv, setlocale or, strerror shall only be used as if they have
+       pointer to const-qualified type
+     -
+
+   * - `Rule 21.20 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_20.c>`_
+     - Mandatory
+     - The pointer returned by the Standard Library functions asctime ctime
+       gmtime localtime localeconv getenv setlocale or strerror shall not be
+       used following a subsequent call to the same function
+     -
+
+   * - `Rule 22.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_02.c>`_
+     - Mandatory
+     - A block of memory shall only be freed if it was allocated by means of a
+       Standard Library function
+     -
+
+   * - `Rule 22.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_04.c>`_
+     - Mandatory
+     - There shall be no attempt to write to a stream which has been opened as
+       read-only
+     -
+
+   * - `Rule 22.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_05.c>`_
+     - Mandatory
+     - A pointer to a FILE object shall not be dereferenced
+     -
+
+   * - `Rule 22.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_06.c>`_
+     - Mandatory
+     - The value of a pointer to a FILE shall not be used after the associated
+       stream has been closed
+     -
-- 
2.25.1


