Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8474F546F3A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 23:28:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346747.572655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzmAj-0008GP-RD; Fri, 10 Jun 2022 21:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346747.572655; Fri, 10 Jun 2022 21:28:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzmAj-0008E1-O1; Fri, 10 Jun 2022 21:28:01 +0000
Received: by outflank-mailman (input) for mailman id 346747;
 Fri, 10 Jun 2022 21:28:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tsmg=WR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nzmAi-0008Dv-CH
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 21:28:00 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 334508b0-e904-11ec-8901-93a377f238d6;
 Fri, 10 Jun 2022 23:27:59 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BDE50B83765;
 Fri, 10 Jun 2022 21:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2D9C34114;
 Fri, 10 Jun 2022 21:27:56 +0000 (UTC)
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
X-Inumbo-ID: 334508b0-e904-11ec-8901-93a377f238d6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654896477;
	bh=KBP82+EJ08ywiXHELyDwBuHDDTpTUfvp7+EqgZWDwuE=;
	h=From:To:Cc:Subject:Date:From;
	b=V9pX9DwVjbvtYEz06hJ4GIQaq0IVH/unouwpz8f4YnuYJscUR510Wn5BndKvBABGB
	 CDHDOLy8tSJ13msOeaxsIpK7X5d7cWK2z05MEqtzTg5xHVWq6qWOoiE7ZcGaLYc5Cp
	 uZClXCJFWWiCYyT6tehZnf5cMSHYivtHYz8Bt56JDUJZHkrRVMx8a/HlbLH1yEV1XH
	 wbCsYwNpLmM1RuTdohEe7ILyfPfZ8VjIxTN3HydDmY/4m1AibkCCd5JTuvpQncdVwV
	 ETQIetSIXu0QA6pBoUAHsc7JwWGpcVRwG02+BVDTbtr7e8Pc8oLAxOonwYv6PtNwjr
	 SZGdHdUO5F9Tw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	George.Dunlap@citrix.com,
	roger.pau@citrix.com,
	Artem_Mygaiev@epam.com,
	Andrew.Cooper3@citrix.com,
	julien@xen.org,
	Bertrand.Marquis@arm.com,
	jbeulich@suse.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2] add more MISRA C rules to docs/misra/rules.rst
Date: Fri, 10 Jun 2022 14:27:55 -0700
Message-Id: <20220610212755.1051640-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the new MISRA C rules agreed by the MISRA C working group to
docs/misra/rules.rst.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
Given the minimal/trivial changes I kept the acked/reviewed-by.

Changes in v2:
- use max_t/min_t instead of MAX/MIN in the Rule 5.3 example
- improve wording for the note of Rule 5.3
---
 docs/misra/rules.rst | 90 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 6ccff07765..c0bdc75987 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -89,6 +89,29 @@ existing codebase are work-in-progress.
        (xen/include/public/) are allowed to retain longer identifiers
        for backward compatibility.
 
+   * - `Rule 5.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_02.c>`_
+     - Required
+     - Identifiers declared in the same scope and name space shall be
+       distinct
+     - The Xen characters limit for identifiers is 40. Public headers
+       (xen/include/public/) are allowed to retain longer identifiers
+       for backward compatibility.
+
+   * - `Rule 5.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_03.c>`_
+     - Required
+     - An identifier declared in an inner scope shall not hide an
+       identifier declared in an outer scope
+     - Using macros as macro parameters at invocation time is allowed
+       even if both macros use identically named local variables, e.g.
+       max_t(var0, min_t(var1, var2))
+
+   * - `Rule 5.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_04.c>`_
+     - Required
+     - Macro identifiers shall be distinct
+     - The Xen characters limit for macro identifiers is 40. Public
+       headers (xen/include/public/) are allowed to retain longer
+       identifiers for backward compatibility.
+
    * - `Rule 6.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_06_02.c>`_
      - Required
      - Single-bit named bit fields shall not be of a signed type
@@ -123,8 +146,75 @@ existing codebase are work-in-progress.
        declarations of objects and functions that have internal linkage
      -
 
+   * - `Rule 8.10 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_10.c>`_
+     - Required
+     - An inline function shall be declared with the static storage class
+     - gnu_inline (without static) is allowed.
+
    * - `Rule 8.12 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_12.c>`_
      - Required
      - Within an enumerator list the value of an implicitly-specified
        enumeration constant shall be unique
      -
+
+   * - `Rule 9.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_09_01.c>`_
+     - Mandatory
+     - The value of an object with automatic storage duration shall not
+       be read before it has been set
+     - Rule clarification: do not use variables before they are
+       initialized. An explicit initializer is not necessarily required.
+       Try reducing the scope of the variable. If an explicit
+       initializer is added, consider initializing the variable to a
+       poison value.
+
+   * - `Rule 9.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_09_02.c>`_
+     - Required
+     - The initializer for an aggregate or union shall be enclosed in
+       braces
+     -
+
+   * - `Rule 13.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_13_06.c>`_
+     - Mandatory
+     - The operand of the sizeof operator shall not contain any
+       expression which has potential side effects
+     -
+
+   * - `Rule 14.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_01.c>`_
+     - Required
+     - A loop counter shall not have essentially floating type
+     -
+
+   * - `Rule 16.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_07.c>`_
+     - Required
+     - A switch-expression shall not have essentially Boolean type
+     -
+
+   * - `Rule 17.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_03.c>`_
+     - Mandatory
+     - A function shall not be declared implicitly
+     -
+
+   * - `Rule 17.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_04.c>`_
+     - Mandatory
+     - All exit paths from a function with non-void return type shall
+       have an explicit return statement with an expression
+     -
+
+   * - `Rule 20.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_07.c>`_
+     - Required
+     - Expressions resulting from the expansion of macro parameters
+       shall be enclosed in parentheses
+     -
+
+   * - `Rule 20.13 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_13.c>`_
+     - Required
+     - A line whose first token is # shall be a valid preprocessing
+       directive
+     -
+
+   * - `Rule 20.14 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_14.c>`_
+     - Required
+     - All #else #elif and #endif preprocessor directives shall reside
+       in the same file as the #if #ifdef or #ifndef directive to which
+       they are related
+     -
-- 
2.25.1


