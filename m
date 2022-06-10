Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88901545951
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 02:49:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345697.571372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzSpP-00015y-Bw; Fri, 10 Jun 2022 00:48:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345697.571372; Fri, 10 Jun 2022 00:48:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzSpP-00013O-8s; Fri, 10 Jun 2022 00:48:43 +0000
Received: by outflank-mailman (input) for mailman id 345697;
 Fri, 10 Jun 2022 00:48:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tsmg=WR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nzSpN-00013I-6D
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 00:48:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f61a36d-e857-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 02:48:38 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 68757615D1;
 Fri, 10 Jun 2022 00:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56752C34114;
 Fri, 10 Jun 2022 00:48:34 +0000 (UTC)
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
X-Inumbo-ID: 0f61a36d-e857-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654822114;
	bh=IDgNoo+BA5lAS7UKqsa5Qr/m/XsUGO4spdDI9oW0io0=;
	h=Date:From:To:cc:Subject:From;
	b=r+GfQOEe+TGzWbFJfMwnH4fYrjWZZQRVhyAva4Y+/OiPh1E4SSqDeTjpnIW7pvvxX
	 bXur0ZnDs3qZwwQGg+dGctG9VrseaxY30kzkBnNZeVEpg15sAa6Gu5gC4D+TRLbw2i
	 iI3VhQhQjnCO05mLKRy3eKg6EmkAYLO8zmWxq5ovRCyXS9RKoHxpw+TT8Vw2OhoZ3D
	 LdcGN4mP+4T8p+xp5eoCDbclHmmHcX7rkM/szvd25BrG0J+XnMNLcEhIJ48Xnakrlh
	 K01o6bsYJ3pSeyRHlloTrTzpvXJtTnJyytS1kTVYY7jGWZeMsR9Xe6hohQsxNZ4MEm
	 W1Qxd6zjGpadw==
Date: Thu, 9 Jun 2022 17:48:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, jbeulich@suse.com, George.Dunlap@citrix.com, 
    roger.pau@citrix.com, Artem_Mygaiev@epam.com, Andrew.Cooper3@citrix.com, 
    julien@xen.org, Bertrand.Marquis@arm.com
Subject: [PATCH] add more MISRA C rules to docs/misra/rules.rst
Message-ID: <alpine.DEB.2.22.394.2206091748210.756493@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Add the new MISRA C rules agreed by the MISRA C working group to
docs/misra/rules.rst.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

---

I added the rules that we agreed upon this morning together with all the
notes we discussed, in particular:

- macros as macro parameters at invocation time for Rule 5.3
- the clarification of Rule 9.1
- gnu_inline exception for Rule 8.10


diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 6ccff07765..5c28836bc8 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -89,6 +89,28 @@ existing codebase are work-in-progress.
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
+     - Using macros as macro parameters at invocation time is allowed,
+       e.g. MAX(var0, MIN(var1, var2))
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
@@ -123,8 +145,75 @@ existing codebase are work-in-progress.
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

