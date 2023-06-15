Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC307321B1
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 23:27:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549924.858738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9uV2-00087I-Ch; Thu, 15 Jun 2023 21:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549924.858738; Thu, 15 Jun 2023 21:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9uV2-00085a-9n; Thu, 15 Jun 2023 21:27:24 +0000
Received: by outflank-mailman (input) for mailman id 549924;
 Thu, 15 Jun 2023 21:27:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vZfe=CD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q9uV0-00085O-Su
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 21:27:22 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68cf68dd-0bc3-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 23:27:20 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A0F5061DCF;
 Thu, 15 Jun 2023 21:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF601C433C8;
 Thu, 15 Jun 2023 21:27:17 +0000 (UTC)
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
X-Inumbo-ID: 68cf68dd-0bc3-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686864439;
	bh=x1kXzx7pPDuFD2e7tslJipL42jrsChZD9clwm3g37Uk=;
	h=From:To:Cc:Subject:Date:From;
	b=XovzLdIerTfn6LYgbvtIeR2HNVbz39IN9EWrr/yA4bk6gmAmEPHVIp3AaIkvvBSZw
	 A26d1DJMruZQkwVLBzS8uPfZ17SOnU+B5VdEv0jvivypjq+dzfHNvFSx2CAmrI1F1r
	 LEGo4VsIg2wnyphg8RjP8P5daWuiobPFJYg1aWQsrZpWXY5tl2jUGekt5S7JRf/MNn
	 6OPZd45EiudOLdZ6bevMZhtwnqg9csoC2/aUr8coKRKpgC7XuVEflfaiaBp3SacsSs
	 IaxGTV+GsMWfwutsS6p27RgGVa6N0AZWggV4gAfipR6XyXFa/9s7owQrMkdHmRP1bk
	 Xkk8TTCwMmyKQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jbeulich@suse.com,
	julien@xen.org,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	roberto.bagnara@bugseng.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v2] xen/misra: add rules 1.4 and 2.1
Date: Thu, 15 Jun 2023 14:27:16 -0700
Message-Id: <20230615212716.1330929-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Also add a comment at the top of the file to say rules.rst could be
changed.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

---
Changes in v2:
- add link for 1.4
- expand 1.4 comment to say it could be revisited
- add comment at the top
---
 docs/misra/rules.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index a88c284e7d..11b9c42b70 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -32,6 +32,9 @@ violations are meant to be documented as deviations, while some others
 should be fixed. Both compliance and documenting deviations on the
 existing codebase are work-in-progress.
 
+The list below might need to be updated over time. Reach out to THE REST
+maintainers if you want to suggest a change.
+
 .. list-table::
    :header-rows: 1
 
@@ -90,6 +93,18 @@ existing codebase are work-in-progress.
        behaviour
      -
 
+   * - `Rule 1.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/>`_
+     - Required
+     - Emergent language features shall not be used
+     - Emergent language features, such as C11 features, should not be
+       confused with similar compiler extensions, which we use. When the
+       time comes to adopt C11, this rule will be revisited.
+
+   * - `Rule 2.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_01_1.c>`_
+     - Required
+     - A project shall not contain unreachable code
+     -
+
    * - `Rule 2.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_06.c>`_
      - Advisory
      - A function should not contain unused label declarations
-- 
2.25.1


