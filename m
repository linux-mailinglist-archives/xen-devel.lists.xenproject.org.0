Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D43D9806563
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 04:04:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648790.1012756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAiBP-0000ym-Td; Wed, 06 Dec 2023 03:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648790.1012756; Wed, 06 Dec 2023 03:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAiBP-0000x8-Qc; Wed, 06 Dec 2023 03:02:43 +0000
Received: by outflank-mailman (input) for mailman id 648790;
 Wed, 06 Dec 2023 03:02:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AMAt=HR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rAiBO-0000x2-1d
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 03:02:42 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea7c9c66-93e3-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 04:02:39 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 268EFB818D3;
 Wed,  6 Dec 2023 03:02:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14CD0C433C7;
 Wed,  6 Dec 2023 03:02:36 +0000 (UTC)
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
X-Inumbo-ID: ea7c9c66-93e3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701831758;
	bh=ntTXqts67fmIhOymiZHUwupfVzExsdvRdWNYbyqGwYw=;
	h=Date:From:To:cc:Subject:From;
	b=T7/dDbrwqCFaneV0rUrvqT5HENfaBv83cxvctdeWRM1lbp6cZ26zjNDGB61BrtjaL
	 zcLjakJ7Emu8vTzClqVt+a0Oa5anBisqSUUqlrYNBeEmWv3G2BpChNoCmDmEqKshFg
	 4K7xRVaBVlRUFqKZBrpiFyFVgWaE/+uNtwP8RLXWj+I5aipRfjcDlgR43rlF6NITSN
	 a1k3QHNO0QGllmOOqeSOJ7tULGGZjKINOGJBnbnqBy4XIXdrVNWxoAt8pmpI4bMILM
	 2pHeUXFyYv+OXtgdqXAOfl7aWfSscIHU9zKhPfmFjrNEMlq/hBxZSFRMxdq3uEk5Cp
	 JytOTc5TXJZyg==
Date: Tue, 5 Dec 2023 19:02:35 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: andrew.cooper3@citrix.com, jbeulich@suse.com, george.dunlap@citrix.com, 
    julien@xen.org, sstabellini@kernel.org, bertrannd.marquis@arm.com, 
    roger.pau@citrix.com, roberto.bagnara@bugseng.com, 
    federico.serafini@bugseng.com
Subject: [PATCH] docs/misra/rules.rst: add more rules 
Message-ID: <alpine.DEB.2.22.394.2312051859440.110490@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Add the rules accepted in the last three MISRA C working group meetings.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 75921b9a34..ab89116a43 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -462,11 +462,23 @@ maintainers if you want to suggest a change.
 
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
      -
 
+   * - `Rule 17.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_01.c>`_
+     - Required
+     - The features of <stdarg.h> shall not be used
+     -
+
    * - `Rule 17.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_03.c>`_
      - Mandatory
      - A function shall not be declared implicitly
@@ -478,12 +490,24 @@ maintainers if you want to suggest a change.
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
+     -
+
    * - `Rule 18.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_18_03.c>`_
      - Required
      - The relational operators > >= < and <= shall not be applied to objects of pointer type except where they point into the same object
@@ -498,6 +522,11 @@ maintainers if you want to suggest a change.
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
@@ -506,6 +535,13 @@ maintainers if you want to suggest a change.
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

