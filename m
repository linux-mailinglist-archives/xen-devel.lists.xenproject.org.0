Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D948CCA5E
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 03:26:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728001.1132714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9xDj-0006cH-KU; Thu, 23 May 2024 01:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728001.1132714; Thu, 23 May 2024 01:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9xDj-0006a3-HU; Thu, 23 May 2024 01:26:15 +0000
Received: by outflank-mailman (input) for mailman id 728001;
 Thu, 23 May 2024 01:26:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GulG=M2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s9xDi-0006Zx-AL
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 01:26:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f8d74eb-18a3-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 03:26:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7F1E462C1B;
 Thu, 23 May 2024 01:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11049C2BBFC;
 Thu, 23 May 2024 01:26:07 +0000 (UTC)
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
X-Inumbo-ID: 6f8d74eb-18a3-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716427569;
	bh=YR3KJ3TmhDushqp+LY+DYIddrHRhTOOrKUSPZFMBa8I=;
	h=Date:From:To:cc:Subject:From;
	b=DgDb/QOwpW21LsdJspqBdV9yPP9Wn9O6dIKR7OjphMV7/b3BVG/JBlNRxSDlGrz0p
	 ZGQVvihkRRqdsff0CZFWd3P4jJcJ7jjHm/9U/ixlLhRs1mqSb6YUZlylKbN4Qgvch8
	 CzbPEgA4zVZInkDohYJ9na777Zzd7caGjmZw5qk3OuaWtXiRfQ8t8F8/zpVLDAYMM9
	 ysn5Mh/neZjmd3/Y72eSVhsw7qg+vmIbImFOgepXA1N7Oy1Mpb66wq8rIb9GkEGL41
	 2SX70LDKwE+RXjIWtFeDXiFECClbEYgIOTPb6SpGFqKIEy+zF/rJpcfsMFLqGsJfKD
	 rLJ0UxXii5GSw==
Date: Wed, 22 May 2024 18:26:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com, 
    julien@xen.org, michal.orzel@amd.com, bertrand.marquis@arm.com, 
    roger.pau@citrix.com
Subject: [PATCH] docs/misra: rules for mass adoption
Message-ID: <alpine.DEB.2.22.394.2405221822500.1052252@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

This patch adds a bunch of rules to rules.rst that are uncontroversial
and have zero violations in Xen. As such, they have been approved for
adoption.

All the ones that regard the standard library have the link to the
existing footnote in the notes.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 80e5e972ad..d67c74a083 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -580,6 +580,11 @@ maintainers if you want to suggest a change.
      - The relational operators > >= < and <= shall not be applied to objects of pointer type except where they point into the same object
      -
 
+   * - `Rule 18.8 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_18_08.c>`_
+     - Required
+     - Variable-length array types shall not be used
+     -
+
    * - `Rule 19.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_19_01.c>`_
      - Mandatory
      - An object shall not be assigned or copied to an overlapping
@@ -589,11 +594,29 @@ maintainers if you want to suggest a change.
        instances where Eclair is unable to verify that the code is valid
        in regard to Rule 19.1. Caution reports are not violations.
 
+   * - `Rule 20.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_02.c>`_
+     - Required
+     - The ', " or \ characters and the /* or // character sequences
+       shall not occur in a header file name
+     -
+
+   * - `Rule 20.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_03.c>`_
+     - Required
+     - The #include directive shall be followed by either a <filename>
+       or "filename" sequence
+     -
+
    * - `Rule 20.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_04.c>`_
      - Required
      - A macro shall not be defined with the same name as a keyword
      -
 
+   * - `Rule 20.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_06.c>`_
+     - Required
+     - Tokens that look like a preprocessing directive shall not occur
+       within a macro argument
+     -
+
    * - `Rule 20.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_07.c>`_
      - Required
      - Expressions resulting from the expansion of macro parameters
@@ -609,6 +632,12 @@ maintainers if you want to suggest a change.
        evaluation
      -
 
+   * - `Rule 20.11 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_11.c>`_
+     - Required
+     - A macro parameter immediately following a # operator shall not
+       immediately be followed by a ## operator
+     -
+
    * - `Rule 20.12 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_12.c>`_
      - Required
      - A macro parameter used as an operand to the # or ## operators,
@@ -651,11 +680,39 @@ maintainers if you want to suggest a change.
        declared
      - See comment for Rule 21.1
 
+   * - `Rule 21.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_03.c>`_
+     - Required
+     - The memory allocation and deallocation functions of <stdlib.h>
+       shall not be used
+     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
+
+   * - `Rule 21.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_04.c>`_
+     - Required
+     - The standard header file <setjmp.h> shall not be used
+     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
+
+   * - `Rule 21.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_05.c>`_
+     - Required
+     - The standard header file <signal.h> shall not be used
+     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
+
    * - `Rule 21.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_06.c>`_
      - Required
      - The Standard Library input/output routines shall not be used
      - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
 
+   * - `Rule 21.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_07.c>`_
+     - Required
+     - The Standard Library functions atof, atoi, atol and atoll of
+       <stdlib.h> shall not be used
+     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
+
+   * - `Rule 21.8 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_08.c>`_
+     - Required
+     - The Standard Library functions abort, exit and system of
+       <stdlib.h> shall not be used
+     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
+
    * - `Rule 21.9 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_09.c>`_
      - Required
      - The library functions bsearch and qsort of <stdlib.h> shall not be used
@@ -666,6 +723,11 @@ maintainers if you want to suggest a change.
      - The Standard Library time and date routines shall not be used
      - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
 
+   * - `Rule 21.12 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_12.c>`_
+     - Advisory
+     - The exception handling features of <fenv.h> should not be used
+     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
+
    * - `Rule 21.13 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_13.c>`_
      - Mandatory
      - Any value passed to a function in <ctype.h> shall be representable as an
@@ -725,12 +787,25 @@ maintainers if you want to suggest a change.
      - The Standard Library function system of <stdlib.h> shall not be used
      -
 
+   * - `Rule 22.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_01.c>`_
+     - Required
+     - All resources obtained dynamically by means of Standard Library
+       functions shall be explicitly released
+     -
+     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
+
    * - `Rule 22.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_02.c>`_
      - Mandatory
      - A block of memory shall only be freed if it was allocated by means of a
        Standard Library function
      -
 
+   * - `Rule 22.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_03.c>`_
+     - Required
+     - The same file shall not be open for read and write access at the
+       same time on different streams 
+     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
+
    * - `Rule 22.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_04.c>`_
      - Mandatory
      - There shall be no attempt to write to a stream which has been opened as
@@ -748,6 +823,31 @@ maintainers if you want to suggest a change.
        stream has been closed
      -
 
+   * - `Rule 22.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_07.c>`_
+     - Required
+     - The macro EOF shall only be compared with the unmodified return
+       value from any Standard Library function capable of returning EOF
+     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
+
+   * - `Rule 22.8 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_08.c>`_
+     - Required
+     - The value of errno shall be set to zero prior to a call to an
+       errno-setting-function
+     -
+
+   * - `Rule 22.9 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_09.c>`_
+     - Required
+     - The value of errno shall be tested against zero after calling an
+       errno-setting-function
+     -
+
+   * - `Rule 22.10 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_10.c>`_
+     - Required
+     - The value of errno shall only be tested when the last function to
+       be called was an errno-setting-function
+     -
+
+
 Terms & Definitions
 -------------------
 

