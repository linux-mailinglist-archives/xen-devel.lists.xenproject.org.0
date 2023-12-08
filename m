Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F8F8096F2
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 01:10:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650262.1015585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBORW-0001ll-1A; Fri, 08 Dec 2023 00:10:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650262.1015585; Fri, 08 Dec 2023 00:10:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBORV-0001kP-UT; Fri, 08 Dec 2023 00:10:09 +0000
Received: by outflank-mailman (input) for mailman id 650262;
 Fri, 08 Dec 2023 00:10:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvmJ=HT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rBORU-0001kJ-Ms
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 00:10:08 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2347ecd3-955e-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 01:10:06 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 44C57CE1F68;
 Fri,  8 Dec 2023 00:10:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C167C433C7;
 Fri,  8 Dec 2023 00:09:58 +0000 (UTC)
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
X-Inumbo-ID: 2347ecd3-955e-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701994199;
	bh=tHrOx/qdz5H68a9f3qKTXOuNrb27A8wS5L+D0AyS1w4=;
	h=Date:From:To:cc:Subject:From;
	b=KmzruPsDw4ZSrIFphB1b0p1x7OF2SQVrqRRWzIAqJduSDSEcE5U9i1VKqrNhbasK/
	 haB7hHjx/5iWn7Gs33VcTZMJoT6zVNTArAyGzka+XaCseAmh0pBSpRya6BNDEaJsEW
	 VUcwB/w8ziMPGY9DPiM9j0LTwFdFuVdxMzJQ7J1XOiv6OGq8PXdPzMiUopN0O3lGRj
	 USz9E/5ijPF3MWZOpEex/WkrqaV3XaIxO1O7LfEO5AOfcB+7GW301cBKFg62Bd+LEk
	 GJq90VHIclAlDmlrDUgz9P6R+s9h3NRtfVxCG5yxJc2p/rbjffGg/aLR/MlCJXzVSX
	 Grv8plJbiMyGw==
Date: Thu, 7 Dec 2023 16:09:56 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: andrew.cooper3@citrix.com, jbeulich@suse.com, george.dunlap@citrix.com, 
    julien@xen.org, sstabellini@kernel.org, bertrand.marquis@arm.com, 
    roger.pau@citrix.com, roberto.bagnara@bugseng.com, 
    federico.serafini@bugseng.com
Subject: [PATCH v2] docs/misra/rules.rst: add more rules
Message-ID: <alpine.DEB.2.22.394.2312071609060.1265976@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Add the rules accepted in the last three MISRA C working group meetings.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- remove 17.1 for now, to be a separate patch
- add a clarification comment for 17.7
---
 docs/misra/rules.rst | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 75921b9a34..2b570af0e0 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -462,6 +462,13 @@ maintainers if you want to suggest a change.
 
        while(0) and while(1) and alike are allowed.
 
+   * - `Rule 16.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_03.c>`_
+     - Required
+     - An unconditional break statement shall terminate every
+       switch-clause
+     - In addition to break, also other flow control statements such as
+       continue, return, goto are allowed.
+
    * - `Rule 16.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_07.c>`_
      - Required
      - A switch-expression shall not have essentially Boolean type
@@ -478,12 +485,27 @@ maintainers if you want to suggest a change.
        have an explicit return statement with an expression
      -
 
+   * - `Rule 17.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_05.c>`_
+     - Advisory
+     - The function argument corresponding to a parameter declared to
+       have an array type shall have an appropriate number of elements
+     -
+
    * - `Rule 17.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_06.c>`_
      - Mandatory
      - The declaration of an array parameter shall not contain the
        static keyword between the [ ]
      -
 
+   * - `Rule 17.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_07.c>`_
+     - Required
+     - The value returned by a function having non-void return type
+       shall be used
+     - Please beware that this rule has many violations in the Xen
+       codebase today, and its adoption is aspirational. However, when
+       submitting new patches please try to decrease the number of
+       violations when possible.
+
    * - `Rule 18.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_18_03.c>`_
      - Required
      - The relational operators > >= < and <= shall not be applied to objects of pointer type except where they point into the same object
@@ -498,6 +520,11 @@ maintainers if you want to suggest a change.
        instances where Eclair is unable to verify that the code is valid
        in regard to Rule 19.1. Caution reports are not violations.
 
+   * - `Rule 20.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_04.c>`_
+     - Required
+     - A macro shall not be defined with the same name as a keyword
+     -
+
    * - `Rule 20.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_07.c>`_
      - Required
      - Expressions resulting from the expansion of macro parameters
@@ -506,6 +533,13 @@ maintainers if you want to suggest a change.
        as function arguments, as macro arguments, array indices, lhs in
        assignments
 
+   * - `Rule 20.9 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_09.c>`_
+     - Required
+     - All identifiers used in the controlling expression of #if or
+       #elif preprocessing directives shall be #define'd before
+       evaluation
+     -
+
    * - `Rule 20.13 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_13.c>`_
      - Required
      - A line whose first token is # shall be a valid preprocessing
-- 
2.25.1


