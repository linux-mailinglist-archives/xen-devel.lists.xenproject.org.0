Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E369487A026
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 01:29:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692231.1079151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkCU4-0005UV-Tk; Wed, 13 Mar 2024 00:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692231.1079151; Wed, 13 Mar 2024 00:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkCU4-0005Sb-Ql; Wed, 13 Mar 2024 00:28:40 +0000
Received: by outflank-mailman (input) for mailman id 692231;
 Wed, 13 Mar 2024 00:28:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EqwV=KT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rkCU2-0005SV-Qj
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 00:28:39 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0584eec-e0d0-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 01:28:36 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E422CCE172D;
 Wed, 13 Mar 2024 00:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A4C1C433C7;
 Wed, 13 Mar 2024 00:28:29 +0000 (UTC)
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
X-Inumbo-ID: a0584eec-e0d0-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710289710;
	bh=VETAQc7mohf8kIx42D/f98f55cEIgZLe8uhKx+/HHMk=;
	h=Date:From:To:cc:Subject:From;
	b=B0S1cAJdjnFAxW73IAjHgtdAiSeXAC8PHzmDsXfh1Nbi5/OF8kFsUrqsYg5PLQwF5
	 1rA7jL57OMStyzXvVeDPa5lrYe1iUH+NGtpOocXtHfgWhx9fI8fvPnD5K+KDshl6Go
	 FF1Go2kIS+kc9aWGpCzqHAcsrTxfBLCl4jjSEnfeTOHXig3dgqBL+9VpEHRWarJr+T
	 JWCBrd88Ao4le+c9/n6/LSKApmgk+7pvzXHE/tdpmOFpk4HPHHKnxIh9+kgPfWAMot
	 AjYUTQrNIEQdBPgtnMyT6D+RFwDsQMBGCvAQbsADstNs8VGSrFZ0nMf/58KFyx8Wfn
	 /xyEpOhOlMmvg==
Date: Tue, 12 Mar 2024 17:28:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: andrew.cooper3@citrix.com, bertrand.marquis@arm.com, jbeulich@suse.com, 
    julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, 
    sstabellini@kernel.org
Subject: [PATCH] docs/misra: add Rule 16.4
Message-ID: <alpine.DEB.2.22.394.2403121725370.853156@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
I tested the rendered output and it is correct both on the gitlab UI as
well as with tools like rst2html.
---
 docs/misra/rules.rst | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 1e134ccebc..5e9367f11c 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -478,6 +478,30 @@ maintainers if you want to suggest a change.
      - In addition to break, also other unconditional flow control statements
        such as continue, return, goto are allowed.
 
+   * - `Rule 16.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_04.c>`_
+     - Required
+     - Every switch statement shall have a default label
+     - Switch statements with enums as controlling expression don't need
+       a default label as gcc -Wall enables -Wswitch which warns (and
+       breaks the build) if one of the enum labels is missing from the
+       switch.
+
+       Switch statements with integer types as controlling expression
+       should have a default label:
+
+       - if the switch is expected to handle all possible cases
+         explicitly, then a default label shall be added to handle
+         unexpected error conditions, using BUG(), ASSERT(), WARN(),
+         domain_crash(), or other appropriate methods;
+
+       - if the switch is expected to handle a subset of all
+         possible cases, then a default label shall be added with an
+         in-code comment as follows::
+
+             /* only handle a subset of the possible cases */
+             default:
+                 break;
+
    * - `Rule 16.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_02.c>`_
      - Required
      - A switch label shall only be used when the most closely-enclosing
-- 
2.25.1

