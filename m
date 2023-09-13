Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 369C479F55B
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 01:16:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601699.937809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgZ60-0003Q9-Qx; Wed, 13 Sep 2023 23:16:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601699.937809; Wed, 13 Sep 2023 23:16:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgZ60-0003NO-Nh; Wed, 13 Sep 2023 23:16:32 +0000
Received: by outflank-mailman (input) for mailman id 601699;
 Wed, 13 Sep 2023 23:16:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VxlT=E5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qgZ5z-0003M6-SO
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 23:16:31 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90fb6561-528b-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 01:16:29 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 78306CE1CDE;
 Wed, 13 Sep 2023 23:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE96C433C8;
 Wed, 13 Sep 2023 23:16:20 +0000 (UTC)
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
X-Inumbo-ID: 90fb6561-528b-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694646981;
	bh=NFPq2l4rmz9ci/728VrxanMSNdWGNt1ro5YfrSePgkI=;
	h=From:To:Cc:Subject:Date:From;
	b=bSsMdAEk5kp4D+Qg0hGCT/KWDKLLd3L+r0GODf8CepID1dWou6OYpuV6BmkxzTVWA
	 traJkWZNzSqN+F51DUWKBd0UY87oGEQZHtlD+c04qfhhKCNdpIYBHqoaOZAjEk+cly
	 GGL/jb+gZ3bDyX6fMxXs46jG409KKEJzcMsuyciF4sKiVSQQwUtkMbMXOH/AW71sel
	 XGDinJOfjTz0SO2/qw+5pryg0KuIxvbsppWfwSSN8iujgYlOrcB3YYvp8N/E7Og/GE
	 GaTmaelqC7Q75K2QxunmDDbF3sE4a1w6AQY0F1jNsLXg7anluCkf4ecgPW48r1gD/c
	 0f177orRasgpQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	julien@xen.org,
	sstabellini@kernel.org,
	george.dunlap@citrix.com,
	bertrand.marquis@arm.com,
	roberto.bagnara@bugseng.com,
	nicola.vetrini@bugseng.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH] docs/misra: accept 11.7 and 11.8
Date: Wed, 13 Sep 2023 16:16:17 -0700
Message-Id: <20230913231617.2638735-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

As per the last MISRA C group discussion, let's accept 11.7 (for which
we have no violations) and 11.8.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 docs/misra/rules.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 34916e266a..8e7d17d242 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -363,6 +363,16 @@ maintainers if you want to suggest a change.
 
        CFLAGS="-Warith-conversion -Wno-error=arith-conversion" make -C xen
 
+   * - `Rule 11.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_11_07.c>`_
+     - Required
+     - A cast shall not be performed between pointer to object and a noninteger arithmetic type
+     -
+
+   * - `Rule 11.8 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_11_08.c>`_
+     - Required
+     - A cast shall not remove any const or volatile qualification from the type pointed to by a pointer
+     -
+
    * - `Rule 12.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_12_05.c>`_
      - Mandatory
      - The sizeof operator shall not have an operand which is a function
-- 
2.25.1


