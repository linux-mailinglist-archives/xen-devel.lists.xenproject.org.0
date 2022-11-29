Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6779B63B67B
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 01:20:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449169.705787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozoKZ-0006fL-KV; Tue, 29 Nov 2022 00:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449169.705787; Tue, 29 Nov 2022 00:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozoKZ-0006dQ-Hc; Tue, 29 Nov 2022 00:18:35 +0000
Received: by outflank-mailman (input) for mailman id 449169;
 Tue, 29 Nov 2022 00:18:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CMqW=35=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ozoKX-0006dK-GR
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 00:18:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a082d06-6f7b-11ed-91b6-6bf2151ebd3b;
 Tue, 29 Nov 2022 01:18:31 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A2DE761511;
 Tue, 29 Nov 2022 00:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC50BC433C1;
 Tue, 29 Nov 2022 00:18:27 +0000 (UTC)
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
X-Inumbo-ID: 5a082d06-6f7b-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669681109;
	bh=YixsR12PJDn9xlCuW5VEiZORmlQGw6gVE3t4ZgP7BPw=;
	h=From:To:Cc:Subject:Date:From;
	b=m7P1FCjAmQWLPrrIwa0XOJqpHSGV/1K6/CiCAsgIoWJDIDAclPtr1DZ3dZtOsBjD6
	 OFwGgJDhYpjcRUAJEpPuimix8klC6pDieC0KzKPdzzYikuGZbPiF078n8bhyvZfE3F
	 gaYAhPFnOMa0h9xNlBDPPUgtFz2sjWBqv1WekG8mTOr7kwXeIpCFjmX13THxfk3hGQ
	 XYzYpPgzA3r1w0r9Bk3Klbff7ogLgXVr8WCTacXQatnH7cq1+diVQt03Vq7c6FTiy0
	 5wep67/VfVq0ZIS3GcwsT9vbfJa0i3T1Yq61nIQW18CVZbtrDIu/AKYLLui5jmh3Z4
	 /20Ri6KEoVhWA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: sstabellini@kernel.org
Cc: xen-devel@lists.xenproject.org,
	george.dunlap@citrix.com,
	andrew.cooper3@citrix.com,
	jbeulich@suse.com,
	roger.pau@citrix.com,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH] Introduce more MISRA C rules to docs/misra/rules.rst
Date: Mon, 28 Nov 2022 16:18:24 -0800
Message-Id: <20221129001824.2344912-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Add the new MISRA C rules agreed by the MISRA C working group to
docs/misra/rules.rst.

Add a comment for Rule 19.1 to explain that Eclair's findings are
"caution" reports, not violations.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 docs/misra/rules.rst | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 8a659d8d47..dcceab9388 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -77,11 +77,32 @@ existing codebase are work-in-progress.
        behaviour
      -
 
+   * - `Rule 2.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_06.c>`_
+     - Advisory
+     - A function should not contain unused label declarations
+     -
+
+   * - `Rule 3.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_03_01.c>`_
+     - Required
+     - The character sequences /* and // shall not be used within a
+       comment
+     -
+
    * - `Rule 3.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_03_02.c>`_
      - Required
      - Line-splicing shall not be used in // comments
      -
 
+   * - `Rule 4.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_04_01.c>`_
+     - Required
+     - Octal and hexadecimal escape sequences shall be terminated
+     -
+
+   * - `Rule 4.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_04_02.c>`_
+     - Advisory
+     - Trigraphs should not be used
+     -
+
    * - `Rule 5.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_01_2.c>`_
      - Required
      - External identifiers shall be distinct
@@ -200,6 +221,21 @@ existing codebase are work-in-progress.
        have an explicit return statement with an expression
      -
 
+   * - `Rule 17.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_06.c>`_
+     - Mandatory
+     - The declaration of an array parameter shall not contain the
+       static keyword between the [ ]
+     -
+
+   * - `Rule 19.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_19_01.c>`_
+     - Mandatory
+     - An object shall not be assigned or copied to an overlapping
+       object
+     - Be aware that the static analysis tool Eclair might report
+       several findings for Rule 19.1 of type "caution". These are
+       instances where Eclair is unable to verify that the code is valid
+       in regard to Rule 19.1. Caution reports are not violations.
+
    * - `Rule 20.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_07.c>`_
      - Required
      - Expressions resulting from the expansion of macro parameters
-- 
2.25.1


